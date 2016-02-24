# Build-specific configuration
configure :build do
  ignore 'stylesheets/*.sass'
end

unless build?
  activate :external_pipeline,
    name: :gulp,
    command: './node_modules/gulp/bin/gulp.js',
    source: '.tmp/dist'
end
