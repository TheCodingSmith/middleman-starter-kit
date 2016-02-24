require 'rubygems'
require 'middleman'
require 'digest/sha1'
require 'yaml'

# Implement basic_auth for certain envs.
if %w(staging).include? ENV['RACK_ENV']
  user_list = YAML.load_file(File.join(Dir.pwd, 'config', 'users.yml'))
  use Rack::Auth::Basic, 'Login required' do |username, password|
    [username, password] == [ENV['USERNAME'], ENV['PASSWORD']] ||
      Digest::SHA1.hexdigest(password) == user_list[ENV['RACK_ENV']][username]
  end
end

# Modified version of TryStatic, from rack-contrib
# https://github.com/rack/rack-contrib/blob/master/lib/rack/contrib/try_static.rb

# Serve static files under a `build/public` directory:
# - `/` will try to serve your `build/public/index.html` file
# - `/foo` will try to serve `build/public/foo` or `build/public/foo.html` in that order
# - missing files will try to serve build/public/404.html or a tiny default 404 page
module Rack
  class TryStatic
    def initialize(app, options)
      @app = app
      @try = ['', *options.delete(:try)]
      @static = ::Rack::Static.new(-> { [404, {}, []] }, options)
    end

    def call(env)
      orig_path = env['PATH_INFO']
      found = nil
      @try.each do |path|
        resp = @static.call(env.merge!('PATH_INFO' => orig_path + path))
        break if 404 != resp[0] && found = resp
      end
      found || @app.call(env.merge!('PATH_INFO' => orig_path))
    end
  end
end

use Rack::Deflater
use Rack::TryStatic, root: 'build', urls: %w(/), try: ['.html', 'index.html', '/index.html']

# Run your own Rack app here or use this one to serve 404 messages:
run lambda{ |_env|
  not_found_page = File.expand_path('build/temp/index.html', __FILE__)
  if File.exist?(not_found_page)
    [404, { 'Content-Type' => 'text/html' }, [File.read(not_found_page)]]
  else
    [404, { 'Content-Type' => 'text/html' }, ['404 - page not found']]
  end
}
