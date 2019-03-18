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
<script src="../../js/selected.js"></script>
<script src="../../js/editor.js"></script>
<title>${user.username}的个人主页-修改笔记</title>
</head>
<body>
	<%@include file="../basicpage/personalPageHead.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPageLeft.jsp"%>
		<div class="page-content">
			<div class="add-content rounded">
				<h4 class="add-title">修改笔记</h4>
				<form action="" method="post" class="settings-form">
					<table>
						<input type="hidden" id="content" name="content" value="${noteEntity.content}">
						<input type="hidden" id="courseIdValue" value="${noteEntity.courseByCourseId.courseId}">
						<tr>
							<th>笔记标题:</th>
							<td><input type="text" name="title" class="form-control add-text" placeholder="输入笔记标题" value="${noteEntity.title}"/></td>
						</tr>
						<tr>
							<th>课程分类:</th>
							<td>
								<select class="form-control select" name="courseByCourseId.courseId" id="courseId">
									<option value="0" selected="selected">--</option>
									<c:forEach items="${courseEntities}" var="course">
										<option value="${course.courseId}">${course.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th style=" vertical-align: text-top;padding-top:30px;">笔记内容:</th>
							<td>
								<div id="editor" style="height:314.6px;width:690.7px;margin-bottom:10px;"></div>
							</td>
						</tr>
						<tr>
							<th>是否公开:</th>
							<td>
								<input type="radio" id="seen" name="isPublic" value="1" checked="checked"/>
								<label for="seen" style="margin-right:15px;">公开</label>
								<input type="radio" id="no-seen" value="0" name="isPublic"/>
								<label for="no-seen">不公开</label>
							</td>
						</tr>
					</table>
					<input id="add" type="submit" value="保存" class="btn btn-primary submit" style="font-size:13px;"/>
				</form>
			</div>
		</div>
	</div>
</body>
</html>