# name: index.js
#
# author: 沈维忠 ( Shen Weizhong / Tony Stark )
#
# Last Update: 沈维忠 ( Shen Weizhong / Tony Stark )



'use strict'



assert = require 'assert'

util   = require 'gulp-util'

ff     = require '../index'



ff_rslt_1 = new ff("childs_need_to_be_deteled")

ff_rslt_2 = new ff("childs_need_to_be_deteled", {nottraversal: [".git", "node_modules", "backup"]})

ff_rslt_3 = new ff 'childs_need_to_be_deteled',

    nottraversal: ['.git', 'node_modules', 'backup']

    ignore: ['test/childs_need_to_be_deteled']



describe '_core', ->

    describe '#getFolders()', ->

        describe '#return value', ->

            it 'should return array type result', ->

                assert.equal '[object Array]', Object::toString.call(ff_rslt_1)

                return

            return

        describe '#option setup', ->

            it 'should return ["test/childs_need_to_be_deteled"]', ->

                assert.deepEqual ["test/childs_need_to_be_deteled"], ff_rslt_2

                return

            it 'should return empty array', ->

                assert.deepEqual [], ff_rslt_3

                return

            return

        return

    return
