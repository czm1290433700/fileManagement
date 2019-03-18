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
<title>${user.username}的个人主页-我的笔记</title>
</head>
<body>
	<%@include file="../basicpage/personalPageHead.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPageLeft.jsp"%>
		<div class="page-content">
			<div class="add-content rounded clearfix">
				<input type="hidden" id="isPublicValue" value="${isPublic}"/>
				<input type="hidden" id="courseIdValue" value="${courseID}"/>
				<input type="hidden" id="titleValue" value="${title}"/>
				<h4 class="add-title">我的笔记</h4>
				<div class="col-sm-12 clearfix">
					<a href="/personalPage/addNote"><button type="button" class="btn btn-success" style="font-size:14px;float: right;">+写笔记</button></a>
				</div>
				<div class="note-list">
					<form method="post" class="clearfix" style="margin-bottom:15px;">
						<input type="hidden" name="userByUserId.userId" value="${user.userId}">
						<select id="isPublic" name="isPublic" class="form-control note-search-select">
							<option value="2" selected="selected">所有文章</option>
							<option value="1">公开</option>
							<option value="0">不公开</option>
						</select>
						<select id="courseId" name="courseByCourseId.courseId" class="form-control note-search-select">
							<c:if test="${courseId==0||courseId==null}">
								<option value="0" selected>全部课程</option>
								<c:forEach items="${courseEntities}" var="course">
									<option value="${course.courseId}">${course.name}</option>
								</c:forEach>
							</c:if>
							<c:if test="${courseId!=0&&courseId!=null}">
								<option value="${courseId}" selected>${name}</option>
								<option value="0">全部课程</option>
								<c:forEach items="${courseEntities}" var="course">
									<c:if test="${course.courseId!=courseId}">
										<option value="${course.courseId}">${course.name}</option>
									</c:if>
								</c:forEach>
							</c:if>
						</select>
						<input type="text" id="title" name="title" class="form-control note-search" placeholder="Search all notes"/>
						<input id="search" type="submit" class="btn btn-primary note-search-submit" value="搜索"/>
					</form>
					<c:if test="${empty noteEntities}">
						<span class="prompt">还没有相应笔记哦~</span>
					</c:if>
					<c:if test="${!empty noteEntities}">
						<c:forEach items="${noteEntities}" var="note" begin="${4*(id-1)}" end="${4*id-1}">
							<ul class="rounded">
								<c:if test="${note.isPublic==0}">
									<li class="clearfix">
										<a class="note-title" href="/infoNote/${note.noteId}"><span class="fa fa-ban note-icon-ban"></span>${note.title}</a>
										<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list">${note.courseByCourseId.name}</span></div>
										<div class="note-time">#发表于${note.createTime}</div>
									</li>
								</c:if>
								<c:if test="${note.isPublic!=0}">
									<li class="clearfix">
										<a class="note-title" href="/infoNote/${note.noteId}"><span class="fa fa-exclamation-circle note-icon-seen"></span>${note.title}</a>
										<div class="note-mark clearfix"><span class="fa fa-mortar-board note-icon"></span><span class="note-mark-list">${note.courseByCourseId.name}</span></div>
										<div class="note-time">#发表于${note.createTime}</div>
									</li>
								</c:if>
							</ul>
						</c:forEach>
					</c:if>
				</div>
				<ul class="pagination" style="float:right;margin-right:50px;margin-top:20px;">
					<c:if test="${noteEntities.size()<=4}">
						<li class="page-item disabled"><a class="page-link" href="/personalPage/note/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
						<li class="page-item active"><a class="page-link" href="/personalPage/note/1">1</a></li>
						<li class="page-item disabled"><a class="page-link" href="/personalPage/note/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
					</c:if>
					<c:if test="${noteEntities.size()>4&&noteEntities.size()<=8}">
						<c:if test="${id==1}">
							<li class="page-item disabled"><a class="page-link" href="/personalPage/note/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/note/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==2}">
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/1">1</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/note/2">2</a></li>
							<li class="page-item disabled"><a class="page-link" href="/personalPage/note/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
					</c:if>
					<c:if test="${noteEntities.size()>8&&noteEntities.size()<=12}">
						<c:if test="${id==1}">
							<li class="page-item disabled"><a class="page-link" href="/personalPage/note/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/note/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==2}">
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/1">1</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/note/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==3}">
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/2">2</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/note/3">3</a></li>
							<li class="page-item disabled"><a class="page-link" href="/personalPage/note/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
					</c:if>
					<c:if test="${noteEntities.size()>12}">
						<c:if test="${id==1}">
							<li class="page-item disabled"><a class="page-link" href="/personalPage/note/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/note/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==2}">
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/1">1</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/note/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==3}">
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/2">2</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/note/3">3</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id>3&&id<(noteEntities.size()/4)}">
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/3">3</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/note/${id}">...</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
						<c:if test="${id==(noteEntities.size()/4)}">
							<li class="page-item"><a class="page-link" href="/personalPage/note/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/1">1</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/2">2</a></li>
							<li class="page-item"><a class="page-link" href="/personalPage/note/3">3</a></li>
							<li class="page-item active"><a class="page-link" href="/personalPage/note/${id}">...</a></li>
							<li class="page-item disabled"><a class="page-link" href="/personalPage/note/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>