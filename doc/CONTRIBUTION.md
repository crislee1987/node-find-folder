如何创建独属于你的拷贝
--------------------

如果你已经在自己的电脑上安装并配置了 `WSK IMAGE` 的[*主要开发依赖*](https://github.com/iTonyYo/WSK_IMAGE/wiki/%E4%B8%BB%E8%A6%81%E5%BC%80%E5%8F%91%E4%BE%9D%E8%B5%96 '点击 · Click')，你可以克隆一份 [*"WSK_IMAGE" 主要镜像*](https://github.com/iTonyYo/web.starter.kit-war.machine '点击 · Click') 副本至指定文件目录：

```bash
git clone https://github.com/iTonyYo/WSK_IMAGE.git
```

因为工程托管在 `Github` 上，所以你也可以使用 [*Github for Windows*](https://windows.github.com '点击 · Click') 或者 [*GitHub for Mac*](https://mac.github.com '点击 · Click') 客户端从 [*"WSK_IMAGE" 主要镜像*](https://github.com/iTonyYo/web.starter.kit-war.machine '点击 · Click') 处克隆一份副本。详细操作参阅《 [*Github Help · Fork A Repo*](https://help.github.com/articles/fork-a-repo/ '点击 · Click') 》。

克隆完全后，进入 `WSK IMAGE` 文件夹，安装所有 `Node.js` 模块：

```bash
npm install
```

如果你是在 Mac 等系统上操作，需要提升操作权限：

```bash
sudo npm install
```

如果你所处网络环境访问（境）外网存在不稳定的情况且没法儿使用 VPN 访问相关国外代理服务器，那么你可以通过国内 [*TAONPM*](http://npm.taobao.org/ '点击 · Click') 安装所有模块：

```bash
npm install --registry=https://registry.npm.taobao.org
```

如果你需要在安装的过程中输出相关安装日志，可在上述命令后按需添加 `-d` 或 `-dd` 或 `-ddd` 参数。

至此，所有开发依赖就安装完了。**开始编辑这个工程**吧:grey_exclamation::smiley:



如何推送你的修改至 WSK IMAGE
---------------------------

`WSK IMAGE` 是开源的，且托管在 `Github` 上，借助 `Github` 的 [*社交*](https://help.github.com/articles/be-social/ '点击 · Click') 特点，获取大家协作的力量完善 `WSK IMAGE` 。参阅《 [*Using pull requests*](https://help.github.com/articles/using-pull-requests/ '点击 · Click') 》、《 [*Creating a pull request*](https://help.github.com/articles/creating-a-pull-request/ '点击 · Click') 》，以借助 `Github` 将你的修改推送至 `WSK IMAGE` 。:smiley: