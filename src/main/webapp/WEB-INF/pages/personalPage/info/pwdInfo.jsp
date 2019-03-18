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
						<div class="info-menu-title"><span style="margin-right:10px;font-size:16px;" class="fa fa-user"></span><span style="font-weight:500;font-size:16px;color:#666!important;">个人资料</span></div>
						<ul style="margin:0;padding:0;">
							<a href="/personalPage/info/basicInfo"><li class="info-item">资料完善</li></a>
							<a href="/personalPage/info/picInfo"><li class="info-item">头像更换</li></a>
						</ul>
						<div class="info-menu-title info-menu-title-active"><span style="margin-right:10px;font-size:16px;" class="fa fa-unlock-alt"></span><span style="font-weight:500;font-size:16px;color:#666!important;">隐私设置</span></div>
						<ul style="margin:0;padding:0;">
							<a href="/personalPage/info/pwdInfo"><li class="info-item info-item-active">密码修改</li></a>
						</ul>
					</div>
					<div class="info-form">
						<div class="info-form-title"><h5>密码修改</h5></div>
						<form action="" method="post" class="settings-form">
							<table>
								<tr>
									<th>旧密码:</th>
									<td><input type="text" class="form-control" name="pastPassword" placeholder="输入旧密码" style="font-size: 13px;"/></td>
								</tr>
								<tr>
									<th>新密码:</th>
									<td><input type="text" class="form-control" name="password" placeholder="输入新密码" style="font-size: 13px;"/></td>
								</tr>
								<tr>
									<th>确认密码:</th>
									<td><input type="text" class="form-control" name="okPassword" placeholder="确定新密码" style="font-size: 13px;"/></td>
								</tr>
							</table>
							<input type="submit" value="保存" class="btn btn-primary submit" style="font-size:13px;"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>