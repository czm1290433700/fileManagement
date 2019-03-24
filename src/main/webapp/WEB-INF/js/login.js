/**
 * 
 */
$(function(){
	/**
	 * 点击密码登录
	 */
	$("#aID1").click(function(){
		$("#aID1").removeClass("a2").addClass("a1");
		$("#aID2").removeClass("a1").addClass("a2");
		$("#form1").removeClass("none-form");
		$("#form2").addClass("none-form");
	})
	/**
	 * 点击验证登录
	 */
	$("#aID2").click(function(){
		$("#aID2").removeClass("a2").addClass("a1");
		$("#aID1").removeClass("a1").addClass("a2");
		$("#form2").removeClass("none-form");
		$("#form1").addClass("none-form");
	})
	/*表单验证*/
	$("#phone").blur(checkPhone);
	$("#password").blur(checkPassword);
	$("#add").click(checkPhone).click(checkPassword).click(checkPass).click(infoAlert);
})
function infoAlert() {
	if($("#result1").val()!=""){
		alert($("#result1").val());
	}else{
		if($("#result2").val()!=""){
			alert($("#result2").val());
		}else{
			if($("#result3").val()!=""){
				alert($("#result3").val());
			}
		}
	}
}
function checkPhone() {
	var phone=$("#phone").val();
	if(phone==""){
		$("#result1").val("手机号不能为空");
		return false;
	}else{
		if(/^1[34578]\d{9}$/.test(phone)){
			$("#result1").val("");
			return true;
		}else{
			$("#result1").val("请检查手机号格式");
			return false;
		}
	}
}
function checkPassword() {
	var password=$("#password").val();
	if(password==""){
		$("#result2").val("请输入密码");
		return false;
	}
	else{
		$("#result2").val("");
		return true;
	}
}
function checkPass() {
	if($("#result1").val()==""&&$("#result2").val()==""){
		var phone=$("#phone").val();
		var password=$("#password").val();
		var value={
			"phone":phone,
			"password":password
		}
		$.ajax({
			url:"/login/loginCheck",
			type:"post",
			async:false,
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(value),
			success:function (data) {
				$("#result3").val(data);
			}
		})
		if($("#result3").val()==""){
			return true;
		}else{
			return false;
		}
	}else{
		$("#result3").val("");
		return false;
	}
}
function checkAll() {
	if(checkPhone()==true&&checkPassword()==true&&checkPass()==true){
		return true;
	}else{
		return false;
	}
}