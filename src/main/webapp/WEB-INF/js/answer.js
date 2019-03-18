/**
 * 
 */
$(function(){
	$("#li1").click(function(){
		$("#li2").css("background-color","#EAEAEA");
		$("#li2 a").css("color","black");
		$("#li1").css("background-color","white");
		$("#li1 a").css("color","#4ACA6D");
		$("#table1").css("display","table");
		$("#table2").css("display","none");	
	})
	$("#li2").click(function(){
		$("#li1").css("background-color","#EAEAEA");
		$("#li1 a").css("color","black");
		$("#li2").css("background-color","white");
		$("#li2 a").css("color","#4ACA6D");
		$("#table2").css("display","table");
		$("#table1").css("display","none");
	})
})