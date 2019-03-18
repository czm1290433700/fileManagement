$(function(){
    var height=$(".home-info").outerHeight();
    $(".home-main").css("height",height);
    $(".home-info").bind('resize',function(){
        var height=$(".home-info").outerHeight();
        $(".home-main").css("height",height);
    });
})