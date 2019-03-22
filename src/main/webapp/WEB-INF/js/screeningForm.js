$(function () {
    $(".go-search").click(function () {
        if($("#keyword").val()==""){
            alert("关键词不能为空");
        }
        else{
            if($("#table1").css("display")=="none"){
                $("#tableId").val(2);
            }else{
                $("#tableId").val(1);
            }
        }
    })
})
function checkScreeningForm() {
    if($("#keyword").val()==""){
        return false;
    }
    else{
        return true;
    }
}