find-folder
===========

[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/iTonyYo/node-find-folder?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Build status](https://ci.appveyor.com/api/projects/status/tgg5rob05g94mao9/branch/master?svg=true)](https://ci.appveyor.com/project/iTonyYo/node-find-folder/branch/master) [![Build Status](https://travis-ci.org/iTonyYo/node-find-folder.svg)](https://travis-ci.org/iTonyYo/node-find-folder) [![Project Dependencies](https://david-dm.org/iTonyYo/node-find-folder.png)](https://david-dm.org/iTonyYo/node-find-folder '点击 · Click') [![Project devDependencies](https://david-dm.org/iTonyYo/node-find-folder/dev-status.png)](https://david-dm.org/iTonyYo/node-find-folder#info=devDependencies '点击 · Click') [![Issues Closed In...](http://img.shields.io/badge/Issues%20Closed%20In-Not%20Available-red.svg?style=flat)](http://issuestats.com/github/iTonyYo/node-find-folder '点击 · Click') [![Pull Request Closed In...](http://img.shields.io/badge/Pull%20Requests%20Closed%20In-5%20minutes-brightgreen.svg?style=flat)](http://issuestats.com/github/iTonyYo/node-find-folder '点击 · Click') [![MIT LICENSE](https://camo.githubusercontent.com/377eda57da4e5aff0480df11e5a0ada0b5d95903/687474703a2f2f696d672e736869656c64732e696f2f6e706d2f6c2f69732d6f626a6563742e737667)](https://github.com/iTonyYo/WSK_IMAGE/blob/master/LICENSE '点击 · Click')

![NPM · downloads, rank and stars](https://nodei.co/npm/node-find-folder.png?downloads=true&downloadRank=true&stars=true)

![node-find-folder](http://h.hiphotos.baidu.com/image/pic/item/359b033b5bb5c9ea82bd8b53d639b6003af3b330.jpg)



Primer
------

Walk a directory tree in node.js. **Use just the name of folder** to find the folder(s), rather than through given path(s)  - To search the targeted directory(s) you want in the whole project，return array type result. Then, you can do anything you want with the result! For batch operations which according to the directory(s).

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

ff_result = new ff('1'); //output: ['dev/image/ui_icon_social_64px/1']
```

**Exist the same folder under some directories! But I just need one of them! How should I do?**

A: You can do like this:

```js
ff_result = new ff('grey', {ignore: ['dev/image/ui_icon_keyamoon_32px/grey']});
// output: ['dev/image/ui_icon_social_32px/grey']
// not: ['dev/image/ui_icon_keyamoon_32px/grey', 'dev/image/ui_icon_social_32px/grey']
```

**I don't want to traverse folders like `.git`, `node_modules` and `dest` which are in the root of project! Maybe more... How should I do?**

A: By default, this module will ignore `.git`, `node_modules` two folders. So you can just do like this:

```js
ff_result = new ff('grey', {nottraversal: ['dest']});
// the ".git", "node_modules" and "dest" folders will not be traversed in this way.
```

***Want more features? Let's improve this module togethor!***



Code without `node-find-folder`,
--------------------------------

```js
...

var order, cln_prefix;

// the name of folder
order      = [ "ui_icon_keyamoon_16px", "ui_icon_keyamoon_32px", "ui_icon_social_32px"];

cln_prefix = 'clean-';

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

gulp.task('clean', order.map(function (the) {

    return cln_prefix + the;

}));

...
```
The code above is too much... and not flexible...



Code with `node-find-folder`,
-----------------------------

```js
...

var ff, order, cln_prefix;

ff = require('node-find-folder');

// the name of folder
order = [ "ui_icon_keyamoon_16px", "ui_icon_keyamoon_32px", "ui_icon_social_32px"];

cln_prefix = 'clean-';

order.forEach(function (the) {

    gulp.task(cln_prefix + the, function () {

        var ff_result;

        ff_result = new ff(the);

        ff_result.forEach(function (_item, _index, _array) {

            del(_item + '/*');

        });

    });

});

gulp.task('clean', order.map(function (the) {

    return cln_prefix + the;

}));

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



Helping `node-find-folder`
--------------------------

#### What's `node-find-folder` working on next?

You can check the plan of development in my related [*Trello*](https://trello.com/b/Hc2tSxlR '点击 · Click') board! I use [*Trello*](https://trello.com/ '点击 · Click') to manage the plan of this project. And we can discuss a lot through the related board! Of course we can use [*Gitter*](https://gitter.im/iTonyYo/node-find-folder '点击 · Click') to discuss, too! You can choose your favorite kind of communication form!

#### My requirement is not met!

A person's strength is limited, I will ignore something... Or, I just did not get the idea what you think... If you'd like to help to improve the project, whelcome you to present your ideas on [*Gitter*](https://gitter.im/iTonyYo/node-find-folder '点击 · Click') or [*Trello*](https://trello.com/b/Hc2tSxlR '点击 · Click'). I will be very gratefull!

#### I found a bug!

If you found a repeatable bug, and tips from [*Usage*](https://github.com/iTonyYo/node-find-folder#usage '点击 · Click') section didn't help, then be sure to [*search existing issues*](https://github.com/iTonyYo/node-find-folder/issues '点击 · Click') first. If there's no content is similar with the problem you found, welcome you to create a new issue you found!

#### I want to help with the code!

Awesome! I use Github to managed code. So there are lots of ways you can help. First read [*CONTRIBUTING.md*](https://github.com/iTonyYo/node-find-folder/blob/master/doc/CONTRIBUTION.md '点击 · Click'), then learn [*be social with Github*](https://help.github.com/articles/be-social/) and [*how to pull the repo*](https://help.github.com/articles/creating-a-pull-request/ '点击 · Click') on `node-find-folder`.



Contact info
------------

+ **Twitter:** [@iTonyYo](https://twitter.com/iTonyYo)

+ **Blog:** https://medium.com/@itonyyo

+ **More? Check here:** http://www.evernote.com/l/AIdKUowUzdNLbK_gDY54E0gAqdcNuAol59E/



LICENSE
-------

See also [*LICENSE*](https://github.com/iTonyYo/node-find-folder/blob/master/LICENSE '点击 · Click') .


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/iTonyYo/node-find-folder/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
