<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../../basicpage/extendFile.jsp" %>
<link href="/css/person-page.css" rel="stylesheet"/>
<script src="/js/height.js"></script>
<script src="/js/basic-info.js"></script>
<script src="/js/picInfo.js"></script>
<title>${user.username}的个人主页-信息完善</title>
</head>
<body>
	<%@include file="../../basicpage/personalPageHead.jsp" %>
	<div class="container-fluid page-body clearfix">
		<%@include file="../../basicpage/personalPageLeft.jsp"%>
		<div class="page-content">
			<div class="info-table rounded">
				<div class="info-table-head">信息完善</div>
				<div class="info-content clearfix">
					<div class="info-menu">
						<div class="info-menu-title info-menu-title-active"><span style="margin-right:10px;font-size:16px;" class="fa fa-user"></span><span style="font-weight:500;font-size:16px;color:#666!important;">个人资料</span></div>
						<ul style="margin:0;padding:0;">
							<a href="/personalPage/info/basicInfo"><li class="info-item">资料完善</li></a>
							<a href="/personalPage/info/picInfo"><li class="info-item info-item-active">头像更换</li></a>
						</ul>
						<div class="info-menu-title"><span style="margin-right:10px;font-size:16px;" class="fa fa-unlock-alt"></span><span style="font-weight:500;font-size:16px;color:#666!important;">隐私设置</span></div>
						<ul style="margin:0;padding:0;">
							<a href="/personalPage/info/pwdInfo"><li class="info-item">密码修改</li></a>
						</ul>
					</div>
					<div class="info-form">
						<div class="info-form-title"><h5>头像更换</h5></div>
						<form action="" method="post" class="settings-form" enctype="multipart/form-data">
							<img src="${user.photo}" class="rounded-circle info-form-pic"><br/>
							<span style="padding-left:60px;">上传图片请勿超过4mb</span> 
							<input type="file" name ="pic" class="file" id="file" style="visibility: hidden;"><br/>
							<input type="button" class="btn btn-success submit" value="更换头像" onclick="document.getElementById('file').click()" style="margin-left:50px;"/>
							<input type="submit" class="btn btn-primary submit" value="保存修改" style="margin-left:10px;"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>