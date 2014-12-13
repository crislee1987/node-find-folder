node-find-folder
================

[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/iTonyYo/node-find-folder?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Build status](https://ci.appveyor.com/api/projects/status/tgg5rob05g94mao9/branch/master?svg=true)](https://ci.appveyor.com/project/iTonyYo/node-find-folder/branch/master) [![Build Status](https://travis-ci.org/iTonyYo/node-find-folder.svg)](https://travis-ci.org/iTonyYo/node-find-folder) [![Project Dependencies](https://david-dm.org/iTonyYo/node-find-folder.png)](https://david-dm.org/iTonyYo/node-find-folder '点击 · Click') [![Project devDependencies](https://david-dm.org/iTonyYo/node-find-folder/dev-status.png)](https://david-dm.org/iTonyYo/node-find-folder#info=devDependencies '点击 · Click')

![node-find-folder](http://h.hiphotos.baidu.com/image/pic/item/359b033b5bb5c9ea82bd8b53d639b6003af3b330.jpg)

**Use just the name of folder** to find folder(s), rather than through path  - To search the targeted directory(s) you want，returns array type data. Then, you can do anything you want! For batch operations which according to the directory(s).

It uses the `glob` library to do some matching work.



Usage
-----

Folder structure for reference,

```
root/
├── [.git]
├── [doc]
├── [node_modules]
├── [dev]
├── [dest]
├── [gulp]
```

Code,

```js
var ff, folders;

ff = require('node-find-folder');

folders = ff('1'); //output: ['dev/ui_icon_social_64px/1']
```



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

#### getfolders(folderName, [options])

Return array type data which contain the path(s) of matched folder(s).

#### Options

+ `nottraversal`, top-level directories which need to be ignored.

+ `ignore`, specific path to folder(s) which need to be ignored.



LICENSE
------

See also [*LICENSE*](https://github.com/iTonyYo/WSK_IMAGE/blob/master/LICENSE '点击 · Click') .


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/iTonyYo/node-find-folder/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
