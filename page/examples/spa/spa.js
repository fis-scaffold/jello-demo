var $ = require('jquery');

var app = module.exports = function(nav) {
    var $nav = $(nav);
    var $container = $('#content');

    $nav.off('click.spa').on('click.spa', 'a', function() {
        var $this = $(this);
        var href = $this.attr('href');

        $
            .ajax(href)
            .then(function(response) {
                // 我不确认是否都支持。
                history.replaceState && history.replaceState({}, document.title, href);
                $container.html(response);
            });
        return false;
    });
};