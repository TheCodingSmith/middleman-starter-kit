#### Replace the following values: [project name], [github repo], [project folder], [git url], [heroku-staging-app], [heroku-production-app], [heroku-staging-url], [heroku-production-url], [basecamp-project-url], [pivotal-tracker-project-url]
#### Replace `project-name` in package.json and bower.json
#### Replace `git-hub-url` in bower.json

[project name]
=========================

[project name] is a Middleman app with a preferred set of tools, as well as configurations for working with multiple developers.

**Development tools being using:**

- [Autoprefixer](https://github.com/postcss/autoprefixer) to add CSS vendor prefixes.
- [Babel](http://babeljs.io/) javascript compiler.
- [Bower](http://bower.io/) front-end package manager.
- [BrowserSync](http://browsersync.io/) time-saving synchronised browser testing.
- [Bundler](http://bundler.io/) to manage application dependencies.
- [Data files](https://middlemanapp.com/advanced/data_files/) to extract the data content of a page from the rendering.
- [Gulp](https://github.com/gulpjs/gulp) automate and enhance your workflow.
- [Haml](http://haml.info/) for beautiful, DRY, well-indented, clear markup.
- [Homebrew](http://brew.sh/) for OS X package management.
- [Heroku](https://www.heroku.com) deploying and managing the app.
- [jQuery](https://jquery.com/) write less do more.
- [Linters](https://github.com/showcases/clean-code-linters) to help detect errors, potential problems and make sure code is clean, consistent, style guide compliant.
- [Middleman](https://middlemanapp.com) an easy-to-use framework to build static websites.
-	[Source maps](http://webdesign.tutsplus.com/tutorials/how-to-use-source-maps-for-better-preprocessor-debugging--cms-22735) for preprocessor debugging
- [node-sass](https://github.com/sass/node-sass) Node.js bindings to libsass
- [npm](https://www.npmjs.com/) a package manager for javascript.
- [rbenv](https://github.com/sstephenson/rbenv) to set up Ruby enviroment. ***Note: rbenv is incompatible with RVM***
- [Ruby](https://www.ruby-lang.org/en/) a dynamic, open source programming language with a focus on simplicity and productivity.
- [sanitize-css](https://10up.github.io/sanitize.css/) makes browsers render elements consistently and allows you to style with today’s best practices out-of-the-box.
- [Sass](http://sass-lang.com/) CSS with super powers. (Sassy syntax)

If you're unfamiliar with any of the above, please follow the links to have a better understanding of what's being used before continuing.

## Getting Started

### System dependencies
***Note: Skip dependencies section if you all ready have homebrew, git, rbenv, node and ruby installed.***

Get the system ready by installing Homebrew. (***OS X***\)

Install Homebrew

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

#### Once Homebrew is installed and you're ready to brew, install git, node, rbenv, ruby, and sass-lint.

Git
```
$ brew install git
```

rbenv
```
$ brew install rbenv ruby-build
```

Node and NPM
```
$ brew install node
```

Sass-lint
```
$ npm install -g sass-lint
```

Ruby
```
$ rbenv install [ruby version // update ruby version in .ruby-version and Gemfile]
```

Bundler
```
$ gem install bundler
```

### Clone repo, install bower components, node packages, ruby gems and start Middleman.

Clone repo
```
$ [github repo]
```

```
$ cd [project folder // name of repo]
```

Install ruby gems using bundler

```
$ bundle install
```

```
$ npm install
```

```
$ bundle exec middleman
```

***`bundle exec middleman` is starting the Middleman server and gulp and is located at `localhost:3000`.***

Configuration
-------------

#### BrowserSync

Set local BrowserSync options at `localhost:3001`

#### EditorConfig

Some editors come bundled with native support for EditorConfig otherwise a plugin is needed. ([editor-integration](http://editorconfig.org/#download)).

#### Linters

- [Haml-lint](https://github.com/brigade/haml-lint) to help write clean and consistent HAML. ([editor-integration](https://github.com/brigade/haml-lint#editor-integration)\)
- [RuboCop](https://github.com/bbatsov/rubocop) ruby code analyzer. ([editor-integration](https://github.com/bbatsov/rubocop#editor-integration)\)
- [Sass-lint](https://github.com/sasstools/sass-lint) to help keep sass files clean and readable. ([editor-integration](https://github.com/sasstools/sass-lint#ide-integration)\)

## Deploying to Heroku
[Project name] is managed on two separate environments hosted on
Heroku. The staging environment is intended to be seen internally and
production is for sharing with the client.

#### Add Heroku git remotes
```
$ git remote add heroku-staging [git url]
```
```
$ git remote add heroku-production [git url]
```

#### Add custom buildpack

*This is only necessary before the first push to each Heroku server*

```
$ heroku buildpacks:set https://github.com/ddollar/heroku-buildpack-multi.git --remote heroku-staging
```
```
$ heroku buildpacks:set https://github.com/ddollar/heroku-buildpack-multi.git --remote heroku-production
```

#### Deploying to Staging
```
$ git push heroku-staging develop:master
```

#### Open Staging environment in browser
```
$ heroku open --app [heroku-staging-app]
```

#### Deploying to Production
```
$ git push heroku-production master:master
```

#### Open Production environment in browser
```
$ heroku open --app [heroku-production-app]
```

Name | URL |
:------------ | :------------- |
**Staging** | [heroku-staging-url]
**Production** | [heroku-production-url]

## Basecamp Project
Basecamp: [basecamp-project-url]

## Pivotal Tracker Project
Pivotal: [pivotal-tracker-project-url]
