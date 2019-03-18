$(function () {
    var str="";
    $("#add").click(function () {
        $(".tag-name").each(function () {
            str=str+","+$(this).text();
        })
        str=str.substr(1);
        $("#tag").val(str);
    })
})