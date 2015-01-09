'use strict';
var assert, ff, isArray, util;

assert = require('assert');

isArray = require('amp-is-array');

util = require('gulp-util');

ff = require('../index');

describe('NODE-FIND-FOLDER', function() {
  describe('#getFolders()', function() {
    describe('*return value', function() {
      it('should be array type result', function() {
        assert.equal(true, isArray(new ff('childs_need_to_be_deteled')));
      });
    });
    describe('*option setup', function() {
      it('should return ["test/childs_need_to_be_deteled"], when |$ new ff("childs_need_to_be_deteled", {nottraversal: [".git", "node_modules", "backup"]})', function() {
        assert.deepEqual(["test/childs_need_to_be_deteled"], new ff('childs_need_to_be_deteled', {
          nottraversal: ['.git', 'node_modules', 'backup']
        }));
      });
      it('should return empty array, when |$ new ff("childs_need_to_be_deteled", {nottraversal: [".git", "node_modules", "backup"],ignore: ["test/childs_need_to_be_deteled"]})', function() {
        assert.deepEqual([], new ff('childs_need_to_be_deteled', {
          nottraversal: ['.git', 'node_modules', 'backup'],
          ignore: ['test/childs_need_to_be_deteled']
        }));
      });
    });
  });
});
