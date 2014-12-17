# name: uglify.js
#
# author: 沈维忠 ( Shen Weizhong / Tony Stark )
#
# Last Update: 沈维忠 ( Shen Weizhong / Tony Stark )



'use strict'



cfg          = require '../config.json'

gulp         = require 'gulp'

$            = require('gulp-load-plugins')()

lazypipe     = require 'lazypipe'

mrg          = require 'merge-stream'

extend       = require 'xtend'

clp          = require './clp'



_cmprs = lazypipe()

	.pipe $.uglify, cfg.cmprs_opts



gulp.task 'cmprs_js', ->

	root_js_src = gulp.src cfg.path.root_js_src + '*.js'

	splited_tasks_js_src = gulp.src cfg.path.splited_tasks_js_src + '*.js'

	root_js_src.pipe _cmprs()

	.pipe gulp.dest './'

	.pipe $.if clp.notify, $.notify extend cfg.notify_opts,

		title: 'JS Compression'

		message: cfg.message.cmprs_root_js_src

	splited_tasks_js_src.pipe _cmprs()

	.pipe gulp.dest './gulp'

	.pipe $.if clp.notify, $.notify extend cfg.notify_opts,

		title: 'JS Compression'

		message: cfg.message.cmprs_splited_tasks_js_src

	return mrg root_js_src, splited_tasks_js_src
