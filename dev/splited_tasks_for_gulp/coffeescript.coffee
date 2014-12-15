# name: coffeescript.js
#
# author: 沈维忠 ( Shen Weizhong / Tony Stark )
#
# Last Update: 沈维忠 ( Shen Weizhong / Tony Stark )



'use strict'



cfg      = require '../config.json'

gulp     = require 'gulp'

$        = require('gulp-load-plugins')()

clp      = require './clp'

lazypipe = require 'lazypipe'



_coffeelint = lazypipe()

    .pipe $.coffeelint, 'coffeelint.json'

    .pipe $.coffeelint.reporter



gulp.task 'coffeescript', ->

    gulp.src cfg.path.dev + 'node.find.folder.coffee'

    .pipe $.plumber()

    .pipe $.if clp.coffeelint, _coffeelint()

    .pipe $.coffee cfg.cs_opts

    .pipe $.rename

        dirname: ''

        basename: 'index'

        extname: '.js'

    .pipe gulp.dest './'
