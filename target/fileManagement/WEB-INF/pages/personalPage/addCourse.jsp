<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendFile.jsp" %>
<link href="../../css/person-page.css" rel="stylesheet"/>
<script src="../../js/height.js"></script>
<script src="../../js/basic-info.js"></script>
<title>${user.username}的个人主页-添加课程</title>
</head>
<body>
	<%@include file="../basicpage/personalPageHead.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPageLeft.jsp"%>
		<div class="page-content">
			<div class="add-content rounded">
				<h4 class="add-title">添加课程</h4>
				<form method="post" class="settings-form">
					<table>
						<input type="hidden" name="userByUserId.userId" value="${user.userId}"/>
						<input type="hidden" name="noteNum" value="0"/>
						<input type="hidden" name="folderNum" value="0"/>
						<input type="hidden" name="ffolderNum" value="0"/>
						<tr>
							<th>课程名称:</th>
							<td><input type="text" name="name" class="form-control add-text" placeholder="输入课程名称"/></td>
						</tr>
					</table>
					<input type="submit" value="保存" class="btn btn-primary submit" style="font-size:13px;"/>
				</form>
			</div>
		</div>
	</div>
</body>
</html>