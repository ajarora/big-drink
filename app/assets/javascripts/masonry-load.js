$(function(){
    var $container = $('.thumbnails');
    $container.imagesLoaded( function(){
        $container.masonry({
            itemSelector : '.span3'
        });
    });
	$(window).resize(function(){
		$container.masonry({
            itemSelector : '.span3'
        });
	});
});