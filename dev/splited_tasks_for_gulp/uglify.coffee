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



_cmprs = lazypipe()

    .pipe $.uglify, cfg.cmprs_opts



gulp.task 'cmprs_js', ->

    root_js_src = gulp.src './*.js'

    splited_tasks_js_src = gulp.src './gulp/*.js'

    root_js_src.pipe _cmprs()

    .pipe gulp.dest './'

    splited_tasks_js_src.pipe _cmprs()

    .pipe gulp.dest './gulp'

    mrg root_js_src, splited_tasks_js_src
