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
							<label for="course" style="font-size: 16px;font-weight:500;">文件夹名称：</label>
							<input type="text" placeholder="输入文件夹名称"  id="course" class="form-control" style="font-size:13px;margin-bottom:8px;"/>
							<input type="submit" class="btn btn-primary btn-sm" value="添加" style="font-size: 13px"/>
							<button type="button" id="cancel" class="btn btn-secondary btn-sm" style="font-size: 13px">取消</button>
						</form>
					</div>
					<div class="folders clearfix">
						<nav class="breadcrumb">
							<a class="breadcrumb-item" href="/personalPage/folder/1">主页面</a>
						  	<span class="breadcrumb-item active">${folderName}</span>
						</nav>
						<div class="col-sm-12 clearfix" style="padding:0;"><a href="/personalPage/addDocument"><button type="button" class="btn btn-info add-document">+上传文件</button></a></div>
						<c:if test="${empty fileEntities}">
							<span class="prompt">该文件夹暂时还没有文件哦~</span>
						</c:if>
						<c:if test="${!empty fileEntities}">
							<c:forEach items="${fileEntities}" var="file" begin="${6*(id-1)}" end="${6*id-1}">
								<a href="#" class="folders-a">
									<div class="folder">
                                        <c:choose>
                                            <c:when test="${file.fileType.equals('xls')}">
                                                <span class="fa fa-file-excel-o folder-icon"></span>
                                            </c:when>
                                            <c:when test="${file.fileType.equals('jpg')}">
                                                <span class="fa fa-file-image-o folder-icon"></span>
                                            </c:when>
                                            <c:when test="${file.fileType.equals('pdf')}">
                                                <span class="fa fa-file-pdf-o folder-icon"></span>
                                            </c:when>
                                            <c:when test="${file.fileType.equals('ppt')}">
                                                <span class="fa fa-file-powerpoint-o folder-icon"></span>
                                            </c:when>
                                            <c:when test="${file.fileType.equals('mp3')}">
                                                <span class="fa fa-file-sound-o folder-icon"></span>
                                            </c:when>
                                            <c:when test="${file.fileType.equals('avi')}">
                                                <span class="fa fa-file-video-o folder-icon"></span>
                                            </c:when>
                                            <c:when test="${file.fileType.equals('doc')}">
                                                <span class="fa fa-file-word-o folder-icon"></span>
                                            </c:when>
                                            <c:when test="${file.fileType.equals('txt')}">
                                                <span class="fa fa-file-text-o folder-icon"></span>
                                            </c:when>
                                            <c:when test="${file.fileType.equals('zip')}">
                                                <span class="fa fa-file-zip-o folder-icon"></span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="fa fa-file-code-o folder-icon"></span>
                                            </c:otherwise>
                                        </c:choose>
										<div class="folder-name">${file.fileName}</div>
									</div>
								</a>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<ul class="pagination" style="float:right;margin-right:50px;margin-top:20px;">
					<c:if test="${fileEntities.size()<=6}">
						<li class="page-item disabled"><a class="page-link" href="/personalPage/folderContent/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
						<li class="page-item active"><a class="page-link" href="/personalPage/folderContent/1">1</a></li>
						<li class="page-item disabled"><a class="page-link" href="/personalPage/folderContent/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
					</c:if>
					<c:if test="${fileEntities.size()>6&&fileEntities.size()<=12}">
						<c:if test="${id==1}">
							<li class="page-item disabled"><a class="page-link" href="/personalPage/folderContent/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folderContent/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==2}">
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/1">1</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folderContent/2">2</a></li>
							<li class="page-item disabled"><a class="page-link" href="/personalPage/folderContent/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
					</c:if>
					<c:if test="${fileEntities.size()>12&&fileEntities.size()<=18}">
						<c:if test="${id==1}">
							<li class="page-item disabled"><a class="page-link" href="/personalPage/folderContent/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folderContent/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==2}">
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/1">1</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folderContent/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==3}">
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/2">2</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folderContent/3">3</a></li>
							<li class="page-item disabled"><a class="page-link" href="/personalPage/folderContent/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
					</c:if>
					<c:if test="${fileEntities.size()>18}">
						<c:if test="${id==1}">
							<li class="page-item disabled"><a class="page-link" href="/personalPage/folderContent/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folderContent/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==2}">
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/1">1</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folderContent/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==3}">
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/2">2</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folderContent/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id>3&&id<(fileEntities.size()/6)}">
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/3">3</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folderContent/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==(fileEntities.size()/6)}">
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/folderContent/3">3</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/folderContent/${id}">...</a></li>
							<li class="page-item disabled"><a class="page-link" href="/personalPage/folderContent/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>