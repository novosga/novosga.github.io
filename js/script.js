
$(function() {
    $(".gallery a").fancybox();
    $('.faq-entry h4 a').each(function(i, e) { 
        var elem = $(e); 
        elem.on('click', function() {
            var entry = elem.parent().parent();
            entry.find('.faq-entry-body').animate({height: 'toggle'}, 500); 
        });
    });
    var url = window.location + "";
    if (url.indexOf('#')) {
        var anchor = url.split('#')[1];
        $('#' + anchor + ' a').click();
    }
});