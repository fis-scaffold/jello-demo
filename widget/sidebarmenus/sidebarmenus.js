require('libs/scrollspy');
var $ = require('jquery');
var $toc = $('.jello-toc');

$toc.each(function() {
    var $this = $(this),
        postion = $this.offset();

    $this.affix({
        offset: {
            top: function() {
                var top = $this.offset().top;
                var navHeight = $('.navbar').height();
                var marginTop = parseInt($this.children(0).css("margin-top"), 10);

                return this.top = top - navHeight - marginTop;
            },
            bottom: function() {
                return this.bottom = $('.footer').outerHeight(true);
            }
        }
    });
});

if ($toc.length) {
    $('body').scrollspy({
        target: '.jello-toc'
    });
}