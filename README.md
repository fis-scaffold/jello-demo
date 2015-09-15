jello-demo
==========

Jello demo &amp; doc, you can [preview this online](http://oak.baidu.com/jello-demo/).

## 如何使用

1. 安装 jello

    ```
    npm install -g jello
    ```
2. 安装插件

    ```
    npm install -g fis-parser-marked
    npm install -g fis-parser-utc
    npm install -g fis-parser-sass
    npm install -g fis-packager-depscombine
    npm install -g fis-postprocessor-amd
    ```
3. git clone 下来此仓库

    ```
    git clone https://github.com/2betop/jello-demo.git
    ```
4. 进入 jello-demo 目录后 安装 components

    ```
    cd jello-demo
    jello install
    ```
5. 进入当前目录后发布代码

    ```
    jello release
    jello server start
    ```
6. 自动打开浏览器预览页面
