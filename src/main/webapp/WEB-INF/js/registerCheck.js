$(function () {
    $("#username").blur(checkName);
    $("#okpwd").blur(checkPassword);
    $("#phone").blur(checkPhone);
    $("#add").click(checkName).click(checkPassword).click(checkPhone);
})
function checkName(){
    var username=$("#username").val();
    if(username==""){
        $("#result1").text("用户名不能为空");
        return false;
    }
    else{
        var value={"username":username};
        $.ajax({
            url:"/registerCheck",
            type:"post",
            contentType:'application/json;charset=utf-8',
            data:JSON.stringify(value),
            success:function (data) {
                $("#result1").text(data);
            }
        })
        if($("#result1").val()==null){
            return true;
        }
        else{
            return false;
        }
    }
}
function checkPassword() {
    var password=$("#password").val();
    var okpwd=$("#okpwd").val();
    if(password==""||okpwd==""){
        $("#result2").text("密码不能为空");
        return false;
    }
    else{
        if(password==okpwd){
            return true;
        }
        else{
            $("#result2").text("前后密码不一致");
            return false;
        }
    }
}
function checkPhone() {
    var phone=$("#phone").val();
    if(phone==""){
        $("#result3").text("手机号不能为空");
        return false;
    }
    if(/^1[34578]\d{9}$/.test(phone)){
        return true;
    }
    else{
        $("#result3").text("请输入有效手机号码");
    }
}
function checkAll() {
    if(checkName()==true&&checkPhone()==true&&checkPassword()==true){
        return true;
    }
    else{
        return false;
    }
}