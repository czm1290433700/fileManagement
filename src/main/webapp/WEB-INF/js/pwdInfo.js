$(function () {
    $("#add").click(checkPastPassword).click(checkPassword).click(checkOkPassword);
})
function checkPastPassword() {
    var pastPassword=$("#pastPassword").val();
    var value={"password":pastPassword};
    if(pastPassword==""){
        $("#alert1").text("请输入旧密码！").css("color","red");
    }else{
        $.ajax({
            url:"/checkPassword",
            type:"post",
            async:false,
            contentType:'application/json;charset=utf-8',
            data:JSON.stringify(value),
            success:function (data) {
                $("#alert1").text(data).css("color","red");
            }
        })
    }
    if($("#alert1").text()==""){
        return true;
    }else{
        return false;
    }
}
function checkPassword() {
    var password=$("#password").val();
    if(password==""){
        $("#alert2").text("新密码不能为空").css("color","red");
        return false;
    }else{
        $("#alert2").text("");
        return true;
    }
}
function checkOkPassword() {
    var password=$("#password").val();
    var okPassword=$("#okPassword").val();
    if(password!=okPassword){
        $("#alert3").text("前后密码不一致!").css("color","red");
        return false;
    }else{
        $("#alert3").text("");
        return true;
    }
}
function checkAll() {
    if(checkPastPassword()==true&&checkPassword()==true&&checkOkPassword()==true){
        alert("修改密码成功！");
        return true;
    }else{
        return false;
    }
}