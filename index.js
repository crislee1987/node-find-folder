'use strict';
var $, arrayTo_Obj, extend, fs, getFolders, getFoldersInRoot, glob, gulp, ifExistInRoot, isDir, isFile, isObject, isString, path, traversal_pattern, _default, _filter, _filter_, _forEach, _options;

_options = void 0;

gulp = require('gulp');

path = require('path');

fs = require('fs');

glob = require('glob');

extend = require('xtend');

isFile = require('is-file');

isDir = require('is-directory');

$ = require('gulp-load-plugins')();

_default = {
  nottraversal: ['.git', 'node_modules'],
  ignore: []
};

if (!Array.prototype.forEach) {
  _forEach = function(callback, thisArg) {
    var O, T, k, kValue, len;
    T = void 0;
    k = void 0;
    if (this === null) {
      throw new TypeError('this is null or not defined');
    }
    O = Object(this);
    len = O.length >>> 0;
    if ({}.toString.call(callback) !== '[object Function]') {
      throw new TypeError(callback + 'is not a function');
    }
    if (thisArg) {
      T = thisArg;
    }
    k = 0;
    while (k < len) {
      if (Object.prototype.hasOwnProperty.call(O, k)) {
        kValue = O[k];
        callback.call(T, kValue, k, O);
      }
      k++;
    }
  };
  Array.prototype.forEach = _forEach;
}

if (![].includes) {
  Object.defineProperty(Array.prototype, 'includes', {
    enumerable: false,
    configurable: true,
    writable: true,
    value: function(searchElement) {
      var O, currentElement, k, len, n;
      if (this === void 0 || this === null) {
        throw new TypeError('Cannot convert this value to object');
        O = Object(this);
        len = parseInt(O.length || 0);
        if (len === 0) {
          return false;
        }
        n = parseInt(arguments[1] || 0);
        if (n >= len) {
          return false;
        }
        if (n >= 0) {
          k = n;
        } else {
          k = len + n;
          if (k < 0) {
            k = 0;
          }
        }
        while (k < len) {
          currentElement = O[k];
          if (searchElement === currentElement || searchElement !== searchElement && currentElement !== currentElement) {
            return true;
            k++;
          }
        }
      }
    }
  });
}

if (!Array.prototype.filter) {
  _filter_ = function(fun) {
    var i, len, res, t, thisArg, val;
    if (this === void 0 || this === null) {
      throw new TypeError();
    }
    t = Object(this);
    len = t.length >>> 0;
    if (typeof fun !== 'function') {
      throw new TypeError();
    }
    res = [];
    thisArg = arguments.length >= 2 ? arguments[1] : void 0;
    i = 0;
    while (i < len) {
      if (i in t) {
        val = t[i];
        if (fun.call(thisArg, val, i, t)) {
          res.push(val);
        }
      }
      i++;
    }
    return res;
  };
  Array.prototype.filter = _filter_;
}

isString = function() {
  var rslt;
  return rslt = Object.prototype.toString.call(arguments[0]) === '[object String]' ? true : false;
};

isObject = function(target) {
  var rslt;
  return rslt = target !== void 0 && target.length === void 0 ? true || false : void 0;
};

arrayTo_Obj = function(arr) {
  var obj;
  obj = {};
  arr.forEach(function(_item, _index, _array) {
    return obj[_item] = _index;
  });
  return obj;
};

_filter = function(arr, filter) {
  var fltObj;
  fltObj = void 0;
  fltObj = arrayTo_Obj(filter);
  return arr.filter(function(_item, _index, _array) {
    return !(_item in fltObj);
  });
};

getFoldersInRoot = (function() {
  var init, instance;
  instance = void 0;
  init = function() {
    var folders, list, traversal, _deal;
    list = fs.readdirSync(process.cwd());
    folders = [];
    traversal = [];
    _deal = function(_item, _index, _array) {
      if (isDir(_item)) {
        folders.push(_item);
      }
    };
    list.forEach(_deal);
    traversal = _filter(folders, _options.nottraversal);
    return traversal;
  };
  return {
    getInstance: function() {
      if (!instance) {
        instance = init();
      }
      return instance;
    }
  };
})();

traversal_pattern = function(target) {
  var pattern;
  pattern = '+(' + getFoldersInRoot.getInstance().join('|') + ')/**/' + target;
  return pattern;
};

ifExistInRoot = function(target) {
  return getFoldersInRoot.getInstance().includes(target);
};

getFolders = function() {
  var option, target, traversal_matched;
  target = arguments[0];
  option = arguments[1];
  if (option !== void 0) {
    if (isObject(option)) {
      _options = extend(_default, option);
    }
  } else {
    _options = _default;
  }
  if (isString(target) && !isFile(target)) {
    traversal_matched = glob.sync(traversal_pattern(target));
    if (ifExistInRoot(target)) {
      traversal_matched.push(target);
    }
  }
  return _filter(traversal_matched, _options.ignore);
};

module.exports = getFolders;
