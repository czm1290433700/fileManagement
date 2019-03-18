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
<script src="../../js/editor.js"></script>
<script src="../../js/add-document.js"></script>
<script src="../../js/getUrl.js"></script>
<script src="../../js/createTime.js"></script>
<title>${user.username}的个人主页-上传文件</title>
</head>
<body>
	<%@include file="../basicpage/personalPageHead.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPageLeft.jsp"%>
		<div class="page-content">
			<div class="add-content rounded">
				<h4 class="add-title">上传文件</h4>
				<form action="" method="post" class="settings-form" enctype="multipart/form-data">
					<table>
						<input type="hidden" name="uploadTime" id="createTime"/>
						<input type="hidden" name="userByUserId.userId" value="${user.userId}"/>
						<tr>
							<th>存放位置:</th>
							<td>
								<c:if test="${empty folderEntities}">
									<span class="prompt">还没有创建任何文件夹,请先创建文件夹再进行文件上传~</span>
								</c:if>
								<c:if test="${!empty folderEntities}">
									<select class="form-control select" id="sel_folder" name="folderByFolderId.folderId">
										<option value="0">--</option>
										<c:forEach items="${folderEntities}" var="folder">
											<option value="${folder.folderId}">${folder.name}</option>
										</c:forEach>
									</select>
								</c:if>
							</td>
						</tr>
						<tr>
							<th>上传文件:</th>
							<td>
								<input type="file" name ="file" class="file" id="file" style="display: none;">
								<input type="button" class="btn btn-secondary" value="上传" onclick="document.getElementById('file').click()" style="font-size:13px;"/>
							</td>
						</tr>
						<tr>
							<th>是否公开:</th>
							<td>
								<input type="radio" id="seen" name="isDownloadable" value="1" checked="checked"/>
								<label for="seen" style="margin-right:15px;">公开</label>
								<input type="radio" id="no-seen" value="0" name="isDownloadable"/>
								<label for="no-seen">不公开</label>
							</td>
						</tr>
					</table>
					<input type="submit" value="保存" class="btn btn-primary submit" style="font-size:13px;"/>
				</form>
			</div>
		</div>
	</div>
</body>
</html>