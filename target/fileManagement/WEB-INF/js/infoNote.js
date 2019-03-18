/**
 * 
 */
$(function(){
	var height=$(".body-left").outerHeight();
	$(".body-right").css("height",height);
	$(".body-left").bind('resize',function(){
		var height=$(".body-left").outerHeight();
		$(".body-right").css("height",height);
	});
	$(".best-comment").click(function(){
		$(this).parent().next().slideToggle();
	})
	$(".ans-comment").click(function(){
		$(this).parent().next().slideToggle();
	})
	$(".com-comment").click(function(){
		$(this).parent().parent().next().slideToggle();
	})
})