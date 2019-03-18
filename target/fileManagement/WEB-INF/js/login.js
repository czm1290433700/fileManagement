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
})
