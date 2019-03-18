<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendFile.jsp" %>
<link href="/css/person-page.css" rel="stylesheet"/>
<script src="/js/height.js"></script>
<script src="/js/basic-info.js"></script>
<script src="/js/folder.js"></script>
<title>${user.username}的个人主页-我的文件夹</title>
</head>
<body>
	<%@include file="../basicpage/personalPageHead.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPageLeft.jsp"%>
		<div class="page-content">
			<div class="add-content rounded clearfix">
				<h4 class="add-title">我的文件夹</h4>
				<div class="col-sm-12 clearfix" style="margin-bottom:30px;">
					<button type="button" id="add" class="btn btn-success" style="font-size:14px;float: right;">+创建文件夹</button>
				</div>
				<div class="col-sm-12 clearfix">
					<div class="add-folder rounded">
						<form action="" method="post">
							<input type="hidden" name="userByUserId.userId" value="${user.userId}">
							<label for="name" style="font-size: 16px;font-weight:500;">文件夹名称：</label>
							<input type="text" placeholder="输入文件夹名称"  id="name" name="name" class="form-control" style="font-size:13px;margin-bottom:8px;"/>
							<input type="submit" class="btn btn-primary btn-sm" value="添加" style="font-size: 13px"/>
							<button type="button" id="cancel" class="btn btn-secondary btn-sm" style="font-size: 13px">取消</button>
						</form>
					</div>
					<div class="folders clearfix">
						<nav class="breadcrumb">
						  <span class="breadcrumb-item active">主页面</span>
						</nav>
						<div class="col-sm-12 clearfix" style="padding:0;"><a href="/personalPage/addDocument"><button type="button" class="btn btn-info add-document">+上传文件</button></a></div>
						<c:if test="${empty folderEntities}">
							<span class="prompt">还没有任何创建文件夹哦~</span>
						</c:if>
						<c:if test="${!empty folderEntities}">
							<c:forEach items="${folderEntities}" var="folder" begin="${6*(id-1)}" end="${6*id-1}">
								<a href="/personalPage/folderContent/${folder.folderId}/1" class="folders-a">
									<div class="folder">
										<span class="fa fa-folder-open folder-icon"></span>
										<div class="folder-name">${folder.name}</div>
									</div>
								</a>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<ul class="pagination" style="float:right;margin-right:50px;margin-top:20px;">
					<c:if test="${folderEntities.size()<=6}">
						<li class="page-item disabled"><a class="page-link" href="/personalPage/folder/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
						<li class="page-item active"><a class="page-link" href="/personalPage/folder/1">1</a></li>
						<li class="page-item disabled"><a class="page-link" href="/personalPage/folder/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
					</c:if>
					<c:if test="${folderEntities.size()>6&&folderEntities.size()<=12}">
						<c:if test="${id==1}">
							<li class="page-item disabled"><a class="page-link" href="/personalPage/folder/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folder/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==2}">
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/1">1</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folder/2">2</a></li>
							<li class="page-item disabled"><a class="page-link" href="/personalPage/folder/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
					</c:if>
					<c:if test="${folderEntities.size()>12&&folderEntities.size()<=18}">
						<c:if test="${id==1}">
							<li class="page-item disabled"><a class="page-link" href="/personalPage/folder/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folder/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==2}">
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/1">1</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folder/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==3}">
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/2">2</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folder/3">3</a></li>
							<li class="page-item disabled"><a class="page-link" href="/personalPage/folder/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
					</c:if>
					<c:if test="${folderEntities.size()>18}">
						<c:if test="${id==1}">
							<li class="page-item disabled"><a class="page-link" href="/personalPage/folder/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folder/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==2}">
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/1">1</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folder/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==3}">
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/2">2</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folder/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id>3&&id<(folderEntities.size()/6)}">
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/3">3</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folder/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==(folderEntities.size()/6)}">
							<li class="page-item"><a class="page-link" href="/personalPage/folder/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folder/3">3</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folder/${id}">...</a></li>
							<li class="page-item disabled"><a class="page-link" href="/personalPage/folder/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>