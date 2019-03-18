<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendFile.jsp" %>
<link href="../../css/index.css" rel="stylesheet"/>
<link href="../../css/home.css" rel="stylesheet"/>
<script src="../../js/login.js"></script>
<title>智存网-登录</title>
</head>
<body>
	<%@include file="../basicpage/homeHead.jsp" %>
	<div class="container-fluid body" id="wall">
		<div class="container clearfix" style="padding-top:200px;">
			<div id="login-form">
				<div class="clearfix" style="margin-bottom:30px;">
					<a id="aID1" class="a1" href="#" >密码登录</a>
					<a id="aID2" class="a2" href="#" style="float:right;">验证登录</a>
				</div>
				<form id="form1" action="/login/loginCheck" method="post" style="margin:auto;">
					<input type="text" name="userId" placeholder="注册手机号" style="font-size:13px;"/>
					<input type="text" name="password" placeholder="密码" style="font-size:13px;"/>
					<div class="clearfix" style="margin:10px 0;font-size:12px;">
						<a href="/register" style="color:white;">免费注册</a>
						<a href="#" style="float:right;color:white;">忘记登录密码？</a>
					</div>
					<input type="submit" class="btn btn-primary rounded" value="登录"/>
				</form>
				<form id="form2" class="none-form" action="" method="post" style="margin:auto;">
					<input type="text" name="id" placeholder="注册手机号" style="font-size:13px;"/>
					<input type="text" name="pwd" placeholder="短信验证码" style="font-size:13px;width:105px;"/>
					<a href="#"><button type="button" class="btn btn-info" style="font-size:12px;height:40px;">获取验证码</button></a>
					<div class="clearfix" style="margin:10px 0;font-size:12px;">
						<a href="register.jsp" style="color:white;">免费注册</a>
						<a href="#" style="float:right;color:white;">忘记登录密码？</a>
					</div>
					<input type="submit" class="btn btn-primary rounded" value="登录"/>
				</form>
			</div>
		</div>
	</div>
	<%@include file="../basicpage/homeCopy.jsp" %>
</body>
</html>