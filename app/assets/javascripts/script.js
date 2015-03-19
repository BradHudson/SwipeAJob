$(document).ready(function(){
	Slider = $('#slider').Swipe().data('Swipe');
});


Slider = $('#slider').Swipe({
	auto: 3000,
	continuous: false
}).data('Swipe');

$('.next').on('click', Slider.next);
$('.prev').on('click', Slider.prev);

