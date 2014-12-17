# name: default.js
#
# author: 沈维忠 ( Shen Weizhong / Tony Stark )
#
# Last Update: 沈维忠 ( Shen Weizhong / Tony Stark )



'use strict'



cfg          = require '../config.json'

gulp         = require 'gulp'

run_sequence = require 'run-sequence'



gulp.task 'default', (cb) ->

	run_sequence ['coffeescript'], ['watch'], cb

	return
