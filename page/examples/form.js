// 因为设置了 amd.packager 所以，可以直接通过 libs 引用 /widget/libs 下面的库
require('libs/validator');
var $ = require('jquery');

module.exports = function(opt) {
    var theform = $(opt.selector);
    var btn = theform.find(':submit');
    var action = theform.attr('action');

    theform.validate({
        submitHandler: function() {
            // 已经通过了验证
            btn.button('loading');

            $
                .ajax(action, {
                    method: 'POST',
                    data: theform.serialize()
                })
                .then(function(response) {
                    alert(response.message);
                    btn.button('reset');
                });
        }
    });
};