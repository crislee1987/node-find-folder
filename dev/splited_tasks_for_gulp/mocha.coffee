# name: index.js
#
# author: 沈维忠 ( Shen Weizhong / Tony Stark )
#
# Last Update: 沈维忠 ( Shen Weizhong / Tony Stark )



'use strict'



cfg          = require '../config.json'

gulp         = require 'gulp'

$            = require('gulp-load-plugins')()



gulp.task 'mocha', ->

	gulp.src cfg.path.test + 'test.js'

	.pipe $.mocha()
