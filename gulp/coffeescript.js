// Generated by CoffeeScript 1.8.0
'use strict';
var $, cfg, gulp;

cfg = require('../config.json');

gulp = require('gulp');

$ = require('gulp-load-plugins')();

gulp.task('coffeescript', function() {
  return gulp.src('dev/node.find.folder.coffee').pipe($.plumber()).pipe($.coffee(cfg.cs_opts)).pipe($.rename({
    dirname: '',
    basename: 'index',
    extname: '.js'
  })).pipe(gulp.dest('./'));
});
