fis.require('jello')(fis);

// 标记 staitc/libs 下面的 js 为模块化代码。
fis.match('/static/libs/**.js', {
  isMod: true
});

// jello 里面默认用的 commonjs 这里改成 amd 方案。
fis.unhook('commonjs');
fis.hook('amd', {
  packages: [

    // 用来存放 libs 库
    {
      name: 'libs',
      location: 'static/libs/',
      main: 'index'
    }
  ]
});

// 设置 *.scss 配置配置项
fis.match('*.scss', {
  parser: fis.plugin('sass', {
    include_paths: [
      './static/scss',
      './components/compass-mixins'
    ]
  })
});

// 不启用 less
fis.match('*.less', {
  parser: null
});

// 解析 markdown，编译成 html
fis.match('*.md', {
  parser: fis.plugin('marked'),
  rExt: '.html'
});
