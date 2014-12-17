# name: index.js
#
# author: 沈维忠 ( Shen Weizhong / Tony Stark )
#
# Last Update: 沈维忠 ( Shen Weizhong / Tony Stark )



'use strict'



_options = undefined



fs          = require 'fs'

glob        = require 'glob'

extend      = require 'xtend'

isFile      = require 'is-file'

isDir       = require 'is-directory'

isString    = require 'amp-is-string'

isArray     = require 'amp-is-array'

isUndefined = require 'amp-is-undefined'

ampFilter   = require 'amp-filter'

includes    = require 'amp-contains'

_forEach    = require 'amp-each'

util        = require 'gulp-util'



_default =

	nottraversal: ['.git', 'node_modules']

	ignore: []



isObject = (target) ->

	rslt = if not isUndefined(target) and isUndefined(target.length) then true else false



convertTo_Obj = (filter) ->

	obj = {}

	if isArray filter

		_forEach filter, (_item, _index, _array) ->

			obj[_item] = _index

	else if isString filter

		obj[filter] = 0

	return obj



_filter = (arr, filter) ->

	exclude = (item) ->

		(item not of convertTo_Obj(filter))

	ampFilter arr, exclude



_readDirFolderCache = (->

	instance = undefined

	init = ->

		list = fs.readdirSync process.cwd()

		folders = []

		_deal = (_item, _index, _array) ->

			if isDir _item

				folders.push _item

			return

		_forEach list, _deal

		return folders

	return {

		getInstance: ->

			if !instance

				instance = init()

			return instance

	}

)()



traverse_scope = ->

	_filter _readDirFolderCache.getInstance(), _options.nottraversal



ignoreFilter = (matched) ->

	_filter matched, _options.ignore



ifExistInRoot = ->

	includes traverse_scope(), arguments[0]



#matches zero or more directories and subdirectories searching for matches
traversal_pattern = (target) ->

	if ifExistInRoot target

		pattern = '+(' + _filter(traverse_scope(), target).join('|') + ')/**/' + target

	else

		pattern = '+(' + traverse_scope().join('|') + ')/**/' + target

	return pattern



getFolders = ->

	target = arguments[0]

	option = arguments[1]

	if not isUndefined option

		if isObject option

			_options = extend _default, option

	else

		_options = _default

	if isString(target) and not isFile(target)

		traversal_matched = glob.sync traversal_pattern target

		if ifExistInRoot target

			traversal_matched.push target

	return ignoreFilter traversal_matched



class FF

	constructor: (@folderTarget, @searchOptions) ->

		return getFolders @folderTarget, @searchOptions



module.exports = FF
