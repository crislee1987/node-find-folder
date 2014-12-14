# name: index.js
#
# author: 沈维忠 ( Shen Weizhong / Tony Stark )
#
# Last Update: 沈维忠 ( Shen Weizhong / Tony Stark )



'use strict'



_options = undefined



gulp   = require 'gulp'

path   = require 'path'

fs     = require 'fs'

glob   = require 'glob'

extend = require 'xtend'

isFile = require 'is-file'

isDir  = require 'is-directory'

$      = require('gulp-load-plugins')()



_default =

    nottraversal: ['.git', 'node_modules']

    ignore: []



# Production steps of ECMA-262, Edition 5, 15.4.4.18
# Reference: http://es5.github.com/#x15.4.4.18
unless Array::forEach

    _forEach = (callback, thisArg) ->

        T = undefined

        k = undefined

        if @ is null

            throw new TypeError 'this is null or not defined'

        O = Object @

        len = O.length >>> 0

        if {}.toString.call(callback)  isnt '[object Function]'

            throw new TypeError callback + 'is not a function'

        if thisArg

            T = thisArg

        k = 0

        while k < len

            if Object::hasOwnProperty.call O, k

                kValue = O[k]

                callback.call T, kValue, k, O

            k++

        return # return undefined

    Array::forEach = _forEach



# ES7 "Array.prototype.includes", https://github.com/domenic/Array.prototype.includes/blob/master/spec.md
unless [].includes

    Object.defineProperty Array::, 'includes',

        enumerable: false

        configurable: true

        writable: true

        value: (searchElement) -> #(searchElement, fromIndex)

            if @ is undefined or @ is null

                throw new TypeError 'Cannot convert this value to object'

                O = Object @

                len = parseInt O.length or 0

                if len is 0

                    return false

                n = parseInt arguments[1] or 0

                if n >= len

                    return false

                if n >= 0

                    k = n

                else

                    k = len + n

                    if k < 0

                        k = 0

                while k < len

                    currentElement = O[k]

                    if searchElement is currentElement or searchElement isnt searchElement and currentElement isnt currentElement

                        return true

                        k++

            return



unless Array::filter

    _filter_ = (fun) -> #(fun, thisArg)

        if @ is undefined || @ is null

            throw new TypeError()

        t = Object @

        len = t.length >>> 0

        if typeof fun isnt 'function'

            throw new TypeError()

        res = []

        thisArg = if arguments.length >= 2 then arguments[1] else undefined

        i = 0

        while i < len

            if i of t

                val = t[i]

                # NOTE: Technically this should Object.defineProperty at
                #       the next index, as push can be affected by
                #       properties on Object.prototype and Array.prototype.
                #       But that method's new, and collisions should be
                #       rare, so use the more-compatible alternative.
                res.push val  if fun.call(thisArg, val, i, t)

            i++

        return res

    Array::filter = _filter_



isString = ->

    rslt = if Object::toString.call(arguments[0]) is '[object String]' then true else false



isObject = (target) ->

    rslt = if target isnt undefined and target.length is undefined then true or false



arrayTo_Obj = (arr) ->

    obj = {}

    arr.forEach (_item, _index, _array) ->

        obj[_item] = _index

    return obj



_filter = (arr, filter) ->

    fltObj = arrayTo_Obj filter

    arr.filter (_item, _index, _array) ->

        return !(_item in fltObj)



getFoldersInRoot = =>

    instance = undefined

    ctx = {}

    init = ->

        list = fs.readdirSync process.cwd()

        folders = []

        traversal = []

        _deal = (_item, _index, _array) ->

            if isDir _item

                folders.push _item

            return

        list.forEach _deal

        traversal = _filter folders, _options.nottraversal

        return traversal

    ctx.getInstance = ->

        if !instance

            instance = init()

        return instance

    return ctx



traversal_pattern = (target) ->

    pattern = '+(' + getFoldersInRoot.getInstance().join('|') + ')/**/' + target #matches zero or more directories and subdirectories searching for matches

    return pattern



ifExistInRoot = (target) ->

    getFoldersInRoot.getInstance().includes target



getfolders = ->

    target = arguments[0]

    option = arguments[1]

    if option isnt undefined

        if isObject option

            _options = extend _default, option

    else

        _options = _default

    if isString(target) and not isFile(target)

        traversal_matched = glob.sync traversal_pattern target

        if ifExistInRoot target

            traversal_matched.push target

    return _filter traversal_matched, _options.ignore



module.exports = getfolders
