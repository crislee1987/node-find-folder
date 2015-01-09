# name: index.js
#
# author: 沈维忠 ( Shen Weizhong / Tony Stark )
#
# Last Update: 沈维忠 ( Shen Weizhong / Tony Stark )



'use strict'



assert  = require 'assert'

isArray = require 'amp-is-array'

util    = require 'gulp-util'

ff      = require '../index'



describe 'NODE-FIND-FOLDER', ->

	describe '#getFolders()', ->

		describe '*return value', ->

			it 'should be array type result', ->

				assert.equal true, isArray new ff 'childs_need_to_be_deteled'

				return

			return

		describe '*option setup', ->

			it 'should return ["test/childs_need_to_be_deteled"], when |$ new ff("childs_need_to_be_deteled", {nottraversal: [".git", "node_modules", "backup"]})', ->

				assert.deepEqual ["test/childs_need_to_be_deteled"], new ff 'childs_need_to_be_deteled',

					nottraversal: ['.git', 'node_modules', 'backup']

				return

			it 'should return empty array, when |$ new ff("childs_need_to_be_deteled", {nottraversal: [".git", "node_modules", "backup"],ignore: ["test/childs_need_to_be_deteled"]})', ->

				assert.deepEqual [], new ff 'childs_need_to_be_deteled',

					nottraversal: ['.git', 'node_modules', 'backup']

					ignore: ['test/childs_need_to_be_deteled']

				return

			return

		return

	return
