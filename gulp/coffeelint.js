// Generated by CoffeeScript 1.8.0
'use strict';
var $, cfg, gulp;

cfg = require('../config.json');

gulp = require('gulp');

$ = require('gulp-load-plugins')();

gulp.task('coffeelint', function() {
  return gulp.src('dev/node.find.folder.coffee').pipe($.coffeelint('coffeelint.json')).pipe($.coffeelint.reporter());
});
