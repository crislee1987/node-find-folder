# name: clp.js
#
# author: 沈维忠 ( Shen Weizhong / Tony Stark )
#
# Last Update: 沈维忠 ( Shen Weizhong / Tony Stark )



'use strict'



cfg          = require '../config.json'

gulp         = require 'gulp'

$            = require('gulp-load-plugins')()

parse_args   = require 'minimist'



__args   = parse_args process.argv.slice(2),

	'boolean': cfg.clp



module.exports = __args
