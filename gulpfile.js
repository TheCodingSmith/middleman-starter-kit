'use strict';

var gulp = require('gulp'),
    sass = require('gulp-sass'),
    sourcemaps = require('gulp-sourcemaps'),
    prefix = require('gulp-autoprefixer'),
    browserSync = require('browser-sync').create(),
    babel = require('gulp-babel'),
    include = require('gulp-include');

gulp.task('sass', function () {
  return gulp.src('./source/stylesheets/**/*.s+(a|c)ss')
    .pipe(sourcemaps.init())
    .pipe(sass().on('error', sass.logError))
    .pipe(prefix('last 30 versions', 'Explorer >= 9'))
    .pipe(sourcemaps.write('.', { includeContent: false }))
    .pipe(gulp.dest('./source/stylesheets/'));
});

gulp.task('sass-build', function () {
  return gulp.src('./source/stylesheets/**/*.s+(a|c)ss')
    .pipe(sass().on('error', sass.logError))
    .pipe(prefix('last 30 versions', 'Explorer >= 9'))
    .pipe(gulp.dest('./source/stylesheets/'));
});

gulp.task('sass:watch', function () {
  gulp.watch('./source/stylesheets/**/*.s+(a|c)ss', ['sass']);
});

gulp.task('browser-sync', function() {
  browserSync.init({
    proxy: 'localhost:4567',
    open: false,
    notify: false,
    files: 'source',
    reloadDelay: 1000
  });
});

gulp.task('js', function() {
  gulp.src('./source/javascripts/src/all.js')
    .pipe(babel({
      presets: ['es2015']
    }))
    .pipe(include())
    .on('error', console.log)
    .pipe(gulp.dest('./source/javascripts'));
});

gulp.task('js:watch', function () {
  gulp.watch('./source/javascripts/+(src|libs)/**/*.js', ['js']);
});

gulp.task('default', ['sass', 'sass:watch', 'browser-sync', 'js', 'js:watch'], function() {});
gulp.task('build', ['sass-build', 'js'], function() {});
