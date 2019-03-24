<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>智存网-用户注册</title>
<%@include file="../basicpage/extendFile.jsp" %>
<link href="../../css/index.css" rel="stylesheet"/>
<link href="../../css/home.css" rel="stylesheet"/>
<script src="../../js/registerCheck.js"></script>
</head>
<body>
	<%@include file="../basicpage/homeHead.jsp" %>
	<div class="container-fluid body" id="wall" style="padding:160px;">
		<div id="register-form">
			<h4 style="padding-bottom:30px;">新用户注册</h4>
			<form action="" method="post" onsubmit="return checkAll()">
				<input type="hidden" name="courseNum" value="0"/>
				<input type="hidden" name="messageNum" value="0"/>
				<input type="hidden" name="followNum" value="0"/>
				<table class="register-table">
					<tr>
						<td><label for="username">用户名:</label></td>
						<td><input class="form-control" id="username" name="username" type="text" placeholder="输入用户名"/></td>
						<td><span id="result1"></span></td>
					</tr>
					<tr>
						<td><label for="password">密码:</label></td>
						<td><input class="form-control" id="password" name="password" type="password" placeholder="输入密码"/></td>
						<td></td>
					</tr>
					<tr>
						<td><label for="okpwd">确认密码:</label></td>
						<td><input class="form-control" id="okpwd" name="okpwd" type="password" placeholder="确认密码" /></td>
						<td><span id="result2"></span></td>
					</tr>
					<tr>
						<td><label for="phone">手机号:</label></td>
						<td><input class="form-control" id="phone" name="phone" type="text" placeholder="输入手机号" /></td>
						<td><span id="result3"></span></td>
					</tr>
					<tr>
						<td><label for="code">手机验证码:</label></td>
						<td>
							<input class="form-control" id="code" name="code" type="text" placeholder="输入验证码" style="width:100px;float:left;margin-right:5px;"/>
							<button type="button" class="btn btn-info" style="font-size:13px;float:left;">获取验证码</button>
						</td>
						<td></td>
					</tr>
				</table>
				<input id="add" type="submit" value="注册" class="btn btn-primary btn-lg"/>
			</form>
		</div>
	</div>
	<%@include file="../basicpage/homeCopy.jsp" %>
</body>
</html>