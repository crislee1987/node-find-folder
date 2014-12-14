# name: coffeelint.js
#
# author: 沈维忠 ( Shen Weizhong / Tony Stark )
#
# Last Update: 沈维忠 ( Shen Weizhong / Tony Stark )



'use strict'



cfg      = require '../config.json'

gulp     = require 'gulp'

$        = require('gulp-load-plugins')()



gulp.task 'coffeelint', ->

    gulp.src 'dev/node.find.folder.coffee'

    .pipe $.coffeelint 'coffeelint.json'

    .pipe $.coffeelint.reporter()
