# name: coffeelint.js
#
# author: 沈维忠 ( Shen Weizhong / Tony Stark )
#
# Last Update: 沈维忠 ( Shen Weizhong / Tony Stark )



'use strict'



cfg      = require '../config.json'

gulp     = require 'gulp'

$        = require('gulp-load-plugins')()

extend   = require 'xtend'

clp      = require './clp'



gulp.task 'coffeelint', ->

    gulp.src cfg.path.dev + 'node.find.folder.coffee'

    .pipe $.coffeelint 'coffeelint.json'

    .pipe $.coffeelint.reporter()

    .pipe $.if clp.notify, $.notify extend cfg.notify_opts,

        title: 'CoffeeScript'

        message: cfg.message.coffeelint
