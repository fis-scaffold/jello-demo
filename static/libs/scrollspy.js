// fix bootstrap 对中文标题不支持的bug
require('bootstrap');
var $ = require('jquery');
var ScrollSpy = $.fn.scrollspy.Constructor;


ScrollSpy.prototype.refresh = function() {
    var offsetMethod = 'offset'
    var offsetBase = 0
    if (!$.isWindow(this.$scrollElement[0])) {
        offsetMethod = 'position'
        offsetBase = this.$scrollElement.scrollTop()
    }
    this.offsets = []
    this.targets = []
    this.scrollHeight = this.getScrollHeight()
    var self = this
    this.$body.find(this.selector).map(function() {
        var $el = $(this)
        var href = $el.data('target') || $el.attr('href')
        var $href = /^#./.test(href) && (/^#[a-zA-Z_\d]+$/.test(href) ? $(href) : $('[id="' + href.substr(1) + '"]'))
        return ($href && $href.length && $href.is(':visible') && [
            [$href[offsetMethod]().top + offsetBase, href]
        ]) || null
    }).sort(function(a, b) {
        return a[0] - b[0]
    }).each(function() {
        self.offsets.push(this[0])
        self.targets.push(this[1])
    })
};