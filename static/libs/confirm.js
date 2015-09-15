require('bootstrap');
var modalTplFn = __inline('./_confirm.tmpl');
var noop = function() {};
var $ = require('jquery');
var defaultOptions = {
    title: '',
    confirmed: noop,
    canceled: noop,
    confirmTxt: '确认',
    cancelTxt: '取消'
}

var confirm = module.exports = function(content, opt) {
    if (typeof opt === 'function') {
        opt = {
            confirmed: opt
        };
    }

    opt = $.extend({}, defaultOptions, opt);

    var dom = $(modalTplFn({
        content: content,
        title: opt.title || '提示信息',
        confirmTxt: opt.confirmTxt,
        cancelTxt: opt.cancelTxt
    }));

    dom
        .appendTo('body')
        .on('click', '.btn-confirm', function() {
            opt.confirmed.apply(this, arguments);
            dom.modal('hide');
        })
        .on('click', '.btn-cancel', opt.canceled)
        .modal({
            backdrop: 'static'
        })
        .on('hide.bs.modal', function() {
            dom.remove();
        });
};
