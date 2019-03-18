<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendFile.jsp" %>
<link href="/css/person-page.css" rel="stylesheet"/>
<script src="/js/height.js"></script>
<script src="/js/basic-info.js"></script>
<script src="/js/home.js"></script>
<title>${user.username}的个人主页</title>
</head>
<body>
	<%@include file="../basicpage/personalPageHead.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPageLeft.jsp"%>
		<div class="page-content">
			<div class="home-body row">
				<div class="col-sm-8">
					<div class="home-main rounded">
						<div class="home-main-course clearfix">
							<h5>最新课程</h5>
							<c:if test="${empty courseEntities}">
								<span class="prompt">暂时还没有课程哦~</span>
							</c:if>
							<c:if test="${!empty courseEntities}">
								<c:forEach items="${courseEntities}" var="course" begin="0" end="1">
									<div class="course">
										<div class="course-title">
											<a href="/personalPage/note">${course.name}</a>
										</div>
										<div class="clearfix course-body">
											<div class="yellow rounded-circle"></div>
											<div class="course-content">笔记：${course.noteNum}</div>
										</div>
										<div class="clearfix course-body">
											<div class="green rounded-circle"></div>
											<div class="course-content">收藏夹：${course.ffolderNum}</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
						<div class="home-main-note">
							<h5>最新笔记</h5>
							<div class="note-list" style="padding-top:0;">
								<c:if test="${empty noteEntities}">
									<span class="prompt">还没有相应笔记哦~</span>
								</c:if>
								<c:if test="${!empty noteEntities}">
									<c:forEach items="${noteEntities}" var="note" begin="0" end="3">
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
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="home-info rounded">
						<div class="about-me">
							<h5>About Me</h5>
							<div class="me-pic"><img src="${user.photo}" class="rounded-circle" style="width:100px"/></div>
							<div class="clearfix me-info"><div class="me-name">${user.username}</div><%--<span class="best-level rounded">LV2</span>--%></div>
							<div class="me-sign">${user.signature}</div>
						</div>
						<div class="other-me">
							<h5>Other Me</h5>
							<table class="me-table">
								<tr>
									<td>课程：</td>
									<td>${user.courseNum}</td>
								</tr>
								<tr>
									<td>留言：</td>
									<td>${user.messageNum}</td>
								</tr>
								<tr>
									<td>粉丝：</td>
									<td>${user.followNum}</td>
								</tr>
								<tr>
									<td>专业：</td>
									<td>${user.major}</td>
								</tr>
								<tr>
									<td>学校：</td>
									<td>${user.school}</td>
								</tr>
								<tr>
									<td>著作：</td>
									<td>
										<ul>
											<c:if test="${noteList!=null}">
												<c:forEach items="${noteList}" var="note" begin="0" end="2">
													<li><a href="/infoNote">${note.title}</a></li>
												</c:forEach>
											</c:if>
											<c:if test="${noteList==null}">
												<li>暂时还没有作品哦</li>
											</c:if>
										</ul>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>