$(document).ready(function(){
	$(window).load(function(){
		logoCenter();
	});
	$(window).resize(function(){
		logoCenter();
	});

});

function logoCenter(){
	var center =parseInt($('.brand.brand-center')[0].offsetWidth/2) +'px';
	console.log(center);
	$('.brand.brand-center').css({
		"left":6+getDocWidth()/2 - $('.brand')[0].offsetWidth/2+'px',
		"position":"absolute"
	});
}

function getDocWidth() {
    var D = document;
    return Math.max(
        Math.max(D.body.scrollWidth, D.documentElement.scrollWidth),
        Math.max(D.body.offsetWidth, D.documentElement.offsetWidth),
        Math.max(D.body.clientWidth, D.documentElement.clientWidth)
    );
}