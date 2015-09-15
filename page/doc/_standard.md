在 jello 中开发项目需要遵循一定的目录规范。

一个完整的项目包括两部分
  - 前端部分：包含图片、样式、脚本、模板等一列前端资源。
  - 后端部分：各类 java 资源 jar 配置项文件等。

jello 的开发模式是让前端同学主要负责前端部分，编写 velocity 模板文件、js、css等，脱离后端环境直接在 jello 的环境里面运行。
后端同学主要负责后端数据的获取和页面渲染逻辑，合并前端编译产出，完成整个项目的开发。

这样的好处是只要制定好数据格式便可以并行开发。


## 前端目录

```
├── fis-conf.js
├── page
│   ├── doc
│   ├── examples
│   ├── index.vm
│   └── layout
├── server.conf
├── static
│   ├── favicon.ico
│   ├── js
│   ├── libs
│   └── scss
├── test
│   ├── page
│   ├── page.json
│   └── page.jsp
└── widget
    ├── footer
    ├── header
    └── sidebarmenus
```

### 说明

* `fis-conf.js` 用来设置 fis 编译配置。
* `page` 用来存放各类页面级模板文件(.vm), 可以直接在jello 环境下预览。
  - `layout` 骨架 vm
* `static` 用来存放各类静态资源，如：JS、CSS、image、swf...
* `test` 用来存放各类测试数据
* `widget` 用来存放页面小片段，方便其他页面引用。

## 产出目录

```
├── WEB-INF
│   ├── config
│   │   └── map.json
│   ├── views
│   │   ├── page
│   │   └── widget
├── static
└── test
```

将 jello 前端模块编译产出目录如上

* `WEB-INF/config/map.json` 静态资源表，便于后端定位静态资源。
* `WEB-INF/views` velocity 模板文件
* `static` 静态资源，如果静态资源部署到了cdn 服务器上，后端环境则不需要此文件夹
* `test` 用于本地环境调试，后端程序无需关注。


