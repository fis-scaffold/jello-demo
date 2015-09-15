/**
 * 标记 css 依赖, 需要用到 loading 图标。
 * @require font-awesome/css/font-awesome.css
 */

require('bootstrap');
var modalTplFn = __inline('./_modal.tmpl');
var $ = require('jquery');

// errorLevel 至少支持 danger、info、sucess、warning
var modal = module.exports = function(url, opt) {
    var dom = $(modalTplFn());

    if ($.isPlainObject(url)) {
        opt = url;
        url = null;
    }

    dom
        .appendTo('body')
        .modal($.extend({
            keyboard: false,
            backdrop: 'static',
            remote: url,
            show: true
        }, opt || {}))
        .on('hide.bs.modal', function() {
            dom.remove();
        });
};
