# name: clean.js
#
# author: 沈维忠 ( Shen Weizhong / Tony Stark )
#
# Last Update: 沈维忠 ( Shen Weizhong / Tony Stark )



'use strict'



cfg        = require '../config.json'

gulp       = require 'gulp'

$          = require('gulp-load-plugins')()

del        = require 'del'

ff         = require '../index'

order      = ['childs_need_to_be_deteled']

cln_prefix = 'clean-'



order.forEach (the) ->

	gulp.task cln_prefix + the, ->

		$.util.log 'The results of the folder to be find found: ', new ff the,

			nottraversal: ['.git', 'node_modules', 'backup']

		ff_result = new ff the,

			nottraversal: ['.git', 'node_modules', 'backup']

		ff_result.forEach (_item, _index, _array) ->

			del _item + '/*'

			return

		return

	return



gulp.task 'clean', order.map (the) ->

	cln_prefix + the
