# name: coffeescript.js
#
# author: 沈维忠 ( Shen Weizhong / Tony Stark )
#
# Last Update: 沈维忠 ( Shen Weizhong / Tony Stark )



'use strict'



cfg      = require '../config.json'

gulp     = require 'gulp'

$        = require('gulp-load-plugins')()



gulp.task 'coffeescript', ->

    gulp.src 'dev/node.find.folder.coffee'

    .pipe $.plumber()

    .pipe $.coffeelint 'coffeelint.json'

    .pipe $.coffeelint.reporter()

    .pipe $.coffee cfg.cs_opts

    .pipe $.rename

        dirname: ''

        basename: 'index'

        extname: '.js'

    .pipe gulp.dest './'
