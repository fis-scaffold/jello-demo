var $ = require('jquery');
var validator = module.exports = require('jquery-validation');

require('jquery-validation/localization/messages_zh');

$.validator.setDefaults({
    ignore: 'input[type=hidden]:not(.form-item)',
    highlight: function(element) {
        var tabcontent = $(element).closest('.tab-pane');

        if (tabcontent.not('.active')) {
            $('a[href="#' + tabcontent.attr('id') + '"]').tab('show');
        }

        $(element).closest('.form-group').addClass('has-error');
    },
    unhighlight: function(element) {
        $(element).closest('.form-group').removeClass('has-error');
    },
    errorElement: 'span',
    errorClass: 'help-block',
    errorPlacement: function(error, element) {
        if (element.parent('.input-group').length) {
            error.insertAfter(element.parent());
        } else if(element.is('input[type=radio]') && element.closest('.radio-inline').length) {
            error.insertAfter(element.closest('.radio-inline').parent());
        } else {
            error.insertAfter(element);
        }
    }
});
