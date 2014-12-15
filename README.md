find-folder
===========

[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/iTonyYo/node-find-folder?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Build status](https://ci.appveyor.com/api/projects/status/tgg5rob05g94mao9/branch/master?svg=true)](https://ci.appveyor.com/project/iTonyYo/node-find-folder/branch/master) [![Build Status](https://travis-ci.org/iTonyYo/node-find-folder.svg)](https://travis-ci.org/iTonyYo/node-find-folder) [![Project Dependencies](https://david-dm.org/iTonyYo/node-find-folder.png)](https://david-dm.org/iTonyYo/node-find-folder '点击 · Click') [![Project devDependencies](https://david-dm.org/iTonyYo/node-find-folder/dev-status.png)](https://david-dm.org/iTonyYo/node-find-folder#info=devDependencies '点击 · Click') [![Issues Closed In...](http://img.shields.io/badge/Issues%20Closed%20In-Not%20Available-red.svg?style=flat)](http://issuestats.com/github/iTonyYo/node-find-folder '点击 · Click') [![Pull Request Closed In...](http://img.shields.io/badge/Pull%20Requests%20Closed%20In-5%20minutes-brightgreen.svg?style=flat)](http://issuestats.com/github/iTonyYo/node-find-folder '点击 · Click')

![NPM · downloads, rank and stars](https://nodei.co/npm/node-find-folder.png?downloads=true&downloadRank=true&stars=true)

![node-find-folder](http://h.hiphotos.baidu.com/image/pic/item/359b033b5bb5c9ea82bd8b53d639b6003af3b330.jpg)



Primer
------

**Use just the name of folder** to find the folder(s), rather than through path  - To search the targeted directory(s) you want，returns array type data. Then, you can do anything you want! For batch operations which according to the directory(s).

It uses the `glob` library to do some matching work.



Usage
-----

**Folder structure for reference,**

```
root/
├── [.git]
├── [doc]
├── [node_modules]
├── [dev]
│   ├── [code]
│   │   ├── [splited_tasks_for_gulp]
│   ├── [image]
│   │   ├── [apple_touch_icon]
│   │   ├── [illustration]
│   │   ├── [pinned_site_icon]
│   │   ├── [ui_icon_keyamoon_16px]
│   │   ├── [ui_icon_keyamoon_32px]
│   │   │   ├── [grey]
│   │   ├── [ui_icon_social_32px]
│   │   │   ├── [grey]
│   │   │   ├── [white]
│   │   ├── [ui_icon_social_64px]
│   │   │   ├── [1]
├── [dest]
├── [gulp]
```

**Install**

![how to install](https://nodei.co/npm/node-find-folder.png?mini=true)

You can use `--save-dev` param after the command above to save `node-find-folder` to `package.json`

**Code details,**

```js
var ff, ff_result;

ff = require('node-find-folder');

ff_result = ff('1'); //output: ['dev/image/ui_icon_social_64px/1']
```

**Exist the same folder under some directories! But I just need one of them! How should I do?**

A: You can do like this:

```js
ff_result = ff('grey', {ignore: ['dev/image/ui_icon_keyamoon_32px/grey']});
// output: ['dev/image/ui_icon_social_32px/grey']
// not: ['dev/image/ui_icon_keyamoon_32px/grey', 'dev/image/ui_icon_social_32px/grey']
```

**I don't want to traverse folders like `.git`, `node_modules` and `dest` which are in the root of project! Maybe more... How should I do?**

A: By default, this module will ignore `.git`, `node_modules` two folders. So you can just do like this:

```js
ff_result = ff('grey', {nottraversal: ['dest']});
// the ".git", "node_modules" and "dest" folders will not be traversed in this way.
```

***Want more features? Let's improve this module togethor!***



Code without `node-find-folder`,
--------------------------------

```js
...

// the name of folder
var order = [ "ui_icon_keyamoon_16px", "ui_icon_keyamoon_32px", "ui_icon_social_32px"];

var cln_prefix = 'clean-';

order.forEach(function (the) {

    gulp.task(cln_prefix + the, function () {

        fs.readdir(process.cwd(), function (err, files) {

            var deal;

            deal = function (_item, _index, _array) {

                if (isDir(_item)) {

                    if (_item === the) {

                        del(_item + '/*');

                    }

                }

            };

            files.forEach(deal);

        });

    });

});
```
The code above is too much... and not flexible...



Code with `node-find-folder`,
-----------------------------

```js
...

ff         = require('node-find-folder');

// the name of folder
var order = [ "ui_icon_keyamoon_16px", "ui_icon_keyamoon_32px", "ui_icon_social_32px"];

var cln_prefix = 'clean-';

order.forEach(function (the) {

    gulp.task(cln_prefix + the, function () {

        ff(the).forEach(function (_item, _index, _array) {

            del(_item + '/*');

        });

    });

});

...
```
Code is simple, flexible and well-understood! The most important thing is that you can focus on your operation.



API
------

#### getFolders(folderName, [options])

Return array type data which contain the path(s) of matched folder(s).

#### Options

+ `nottraversal`, **`Array` type**; **default value is `['.git', 'node_modules']`**; for top-level directories which need to be ignored.

+ `ignore`, **`Array` type**; **default value is `[]`**; for specific path to folder(s) which need to be ignored.



LICENSE
------

See also [*LICENSE*](https://github.com/iTonyYo/WSK_IMAGE/blob/master/LICENSE '点击 · Click') .


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/iTonyYo/node-find-folder/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
