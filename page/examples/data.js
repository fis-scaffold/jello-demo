require('bootstrap');
var $ = require('jquery');
var alert = require('libs/alert');

var app = module.exports = function(opt) {

    // from velocity data
    var vm = opt.vm;
    $(vm.btn).on('click', function() {
        alert('<pre>' + JSON.stringify(vm.data, null, 4) + '</pre>');
    });


    var json = opt.json;
    $(json.btn).click(function() {
        $(json.btn).button('loading');

        $.ajax(json.remote)
            .then(function(response) {
                alert('<p>返回结果为：</p><pre>' + JSON.stringify(response, null, 4) + '</pre>');
            })
            .fail(function() {
                alert('加载失败', 'danger');
            })
            .always(function() {
                $(json.btn).button('reset');
            });
    });


    var jsp = opt.jsp;
    $(jsp.btn).click(function() {
        $(jsp.btn).button('loading');

        $.ajax(jsp.remote)
            .then(function(response) {
                alert('<p>返回结果为：</p><pre>' + JSON.stringify(response, null, 4) + '</pre>');
            })
            .fail(function() {
                alert('加载失败', 'danger');
            })
            .always(function() {
                $(jsp.btn).button('reset');
            });
    });

};