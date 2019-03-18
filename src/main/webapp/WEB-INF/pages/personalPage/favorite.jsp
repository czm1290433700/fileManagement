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
<script src="/js/selected.js"></script>
<title>${user.username}的个人主页-我的收藏夹</title>
</head>
<body>
	<%@include file="../basicpage/personalPageHead.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPageLeft.jsp"%>
		<div class="page-content">
			<div class="add-content rounded clearfix">
				<h4 class="add-title">我的收藏夹</h4>
				<input type="hidden" id="courseIdValue" value="${courseId}"/>
				<input type="hidden" id="titleValue" value="${title}">
				<div class="note-list">
					<form action="" method="post" class="clearfix" style="margin-bottom:15px;">
						<select name="courseByCourseId.courseId" class="form-control note-search-select" id="courseId">
							<option value="0" selected>全部课程</option>
							<c:forEach items="${courseEntities}" var="course">
								<option value="${course.courseId}">${course.name}</option>
							</c:forEach>
						</select>
						<input type="text" id="title" name="noteByNoteId.title" class="form-control note-search" placeholder="Search all collects"/>
						<input type="submit" class="btn btn-primary note-search-submit" value="搜索"/>
					</form>
					<c:if test="${empty ffolderEntities}">
						<span class="prompt">暂时还没有收藏笔记哦~</span>
					</c:if>
					<c:if test="${!empty ffolderEntities}">
						<ul class="rounded">
							<c:forEach items="${ffolderEntities}" var="ffolder" begin="${4*(id-1)}" end="${4*id-1}">
								<li class="clearfix">
									<a class="note-title" href="/infoNote/${ffolder.noteByNoteId.noteId}"><span class="fa fa-tags note-icon2"></span>${ffolder.noteByNoteId.title}</a>
									<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list">${ffolder.noteByNoteId.courseByCourseId.name}</span></div>
									<div class="note-time">#由<a href="#">${ffolder.noteByNoteId.userByUserId.username}</a>发表于${ffolder.noteByNoteId.createTime}</div>
								</li>
							</c:forEach>
						</ul>
					</c:if>
				</div>
				<ul class="pagination" style="float:right;margin-right:50px;margin-top:20px;">
					<c:if test="${ffolderEntities.size()<=4}">
						<li class="page-item disabled"><a class="page-link" href="/personalPage/favorite/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
						<li class="page-item active"><a class="page-link" href="/personalPage/favorite/1">1</a></li>
						<li class="page-item disabled"><a class="page-link" href="/personalPage/favorite/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
					</c:if>
					<c:if test="${ffolderEntities.size()>4&&ffolderEntities.size()<=8}">
						<c:if test="${id==1}">
							<li class="page-item disabled"><a class="page-link" href="/personalPage/favorite/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/favorite/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==2}">
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/1">1</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/favorite/2">2</a></li>
							<li class="page-item disabled"><a class="page-link" href="/personalPage/favorite/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
					</c:if>
					<c:if test="${ffolderEntities.size()>8&&ffolderEntities.size()<=12}">
						<c:if test="${id==1}">
							<li class="page-item disabled"><a class="page-link" href="/personalPage/favorite/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/favorite/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==2}">
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/1">1</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/favorite/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==3}">
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/2">2</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/favorite/3">3</a></li>
							<li class="page-item disabled"><a class="page-link" href="/personalPage/favorite/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
					</c:if>
					<c:if test="${ffolderEntities.size()>12}">
						<c:if test="${id==1}">
							<li class="page-item disabled"><a class="page-link" href="/personalPage/favorite/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/favorite/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==2}">
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/1">1</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/favorite/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==3}">
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/2">2</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/favorite/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id>3&&id<(ffolderEntities.size()/4)}">
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/3">3</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/favorite/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==(ffolderEntities.size()/4)}">
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/favorite/3">3</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/favorite/${id}">...</a></li>
							<li class="page-item disabled"><a class="page-link" href="/personalPage/favorite/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>