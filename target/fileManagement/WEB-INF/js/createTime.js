$(function () {
    var currentTime=new Date();
    var year=currentTime.getFullYear();
    var month=currentTime.getMonth();
    var day=currentTime.getDate();
    var localTime=currentTime.toLocaleTimeString();
    var time=year+"-"+month+"-"+day+" "+localTime;
    $("#createTime").val(time);
    $(".createTime").val(time);
})