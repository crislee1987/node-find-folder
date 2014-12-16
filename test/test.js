'use strict';
var assert, ff, ff_rslt_1, ff_rslt_2, ff_rslt_3, util;

assert = require('assert');

util = require('gulp-util');

ff = require('../index');

ff_rslt_1 = new ff("childs_need_to_be_deteled");

ff_rslt_2 = new ff("childs_need_to_be_deteled", {
  nottraversal: [".git", "node_modules", "backup"]
});

ff_rslt_3 = new ff('childs_need_to_be_deteled', {
  nottraversal: ['.git', 'node_modules', 'backup'],
  ignore: ['test/childs_need_to_be_deteled']
});

describe('_core', function() {
  describe('#getFolders()', function() {
    describe('#return value', function() {
      it('should return array type result', function() {
        assert.equal('[object Array]', Object.prototype.toString.call(ff_rslt_1));
      });
    });
    describe('#option setup', function() {
      it('should return ["test/childs_need_to_be_deteled"]', function() {
        assert.deepEqual(["test/childs_need_to_be_deteled"], ff_rslt_2);
      });
      it('should return empty array', function() {
        assert.deepEqual([], ff_rslt_3);
      });
    });
  });
});
