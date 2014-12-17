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



_cs = lazypipe()

	.pipe ->

		$.if clp.coffeelint, _coffeelint()

	.pipe $.coffee, cfg.cs_opts



gulp.task 'coffeescript', ->


	ff_src = gulp.src cfg.path.dev + 'node.find.folder.coffee'

	test_src = gulp.src cfg.path.dev + 'test.coffee'

	gulpfile_src = gulp.src cfg.path.dev + 'gulpfile.coffee'


	ff_src.pipe $.changed cfg.path.project_root

	.pipe $.plumber()

	.pipe _cs()

	.pipe $.rename

		dirname: ''

		basename: 'index'

		extname: '.js'

	.pipe gulp.dest cfg.path.project_root


	test_src.pipe $.changed cfg.path.test

	.pipe $.plumber()

	.pipe _cs()

	.pipe gulp.dest cfg.path.test


	gulpfile_src.pipe $.changed cfg.path.project_root

	.pipe $.plumber()

	.pipe _cs()

	.pipe gulp.dest cfg.path.project_root


	return
