<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendFile.jsp" %>
<link href="../../css/person-page.css" rel="stylesheet"/>
<script src="../../js/height.js"></script>
<script src="../../js/basic-info.js"></script>
<title>${user.username}的个人主页-我的课程</title>
</head>
<body>
	<%@include file="../basicpage/personalPageHead.jsp" %>
	<div class="container-fluid page-body">
		<%@include file="../basicpage/personalPageLeft.jsp"%>
		<div class="page-content">
			<div class="add-content rounded clearfix">
				<h4 class="add-title">我的课程</h4>
				<div class="col-sm-12 clearfix" style="margin-bottom:30px;">
					<a href="/personalPage/addCourse"><button type="button" class="btn btn-success" style="font-size:14px;float: right;">+添加课程</button></a>
				</div>
				<div class="col-sm-12 clearfix">
					<c:if test="${empty courseEntities}">
						<span class="prompt">暂时还没有课程哦~</span>
					</c:if>
					<c:if test="${!empty courseEntities}">
						<c:forEach items="${courseEntities}" var="course" begin="${6*(id-1)}" end="${6*id-1}">
							<div class="course">
								<div class="course-title">
									<a href="/personalPage/note/${course.courseId}/1">${course.name}</a>
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
				<ul class="pagination" style="float:right;margin-right:50px;margin-top:20px;">
                    <c:if test="${courseEntities.size()<=6}">
                        <li class="page-item disabled"><a class="page-link" href="/personalPage/course/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
                        <li class="page-item active"><a class="page-link" href="/personalPage/course/1">1</a></li>
                        <li class="page-item disabled"><a class="page-link" href="/personalPage/course/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
                    </c:if>
                    <c:if test="${courseEntities.size()>6&&courseEntities.size()<=12}">
                        <c:if test="${id==1}">
                            <li class="page-item disabled"><a class="page-link" href="/personalPage/course/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
                            <li class="page-item active"><a class="page-link" href="/personalPage/course/1">1</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/2">2</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
                        </c:if>
                        <c:if test="${id==2}">
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/1">1</a></li>
                            <li class="page-item active"><a class="page-link" href="/personalPage/course/2">2</a></li>
                            <li class="page-item disabled"><a class="page-link" href="/personalPage/course/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
                        </c:if>
                    </c:if>
                    <c:if test="${courseEntities.size()>12&&courseEntities.size()<=18}">
                        <c:if test="${id==1}">
                            <li class="page-item disabled"><a class="page-link" href="/personalPage/course/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
                            <li class="page-item active"><a class="page-link" href="/personalPage/course/1">1</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/2">2</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/3">3</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
                        </c:if>
                        <c:if test="${id==2}">
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/1">1</a></li>
                            <li class="page-item active"><a class="page-link" href="/personalPage/course/2">2</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/3">3</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
                        </c:if>
                        <c:if test="${id==3}">
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/1">1</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/2">2</a></li>
                            <li class="page-item active"><a class="page-link" href="/personalPage/course/3">3</a></li>
                            <li class="page-item disabled"><a class="page-link" href="/personalPage/course/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
                        </c:if>
                    </c:if>
                    <c:if test="${courseEntities.size()>18}">
                        <c:if test="${id==1}">
                            <li class="page-item disabled"><a class="page-link" href="/personalPage/course/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
                            <li class="page-item active"><a class="page-link" href="/personalPage/course/1">1</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/2">2</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/3">3</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id}">...</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
                        </c:if>
                        <c:if test="${id==2}">
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/1">1</a></li>
                            <li class="page-item active"><a class="page-link" href="/personalPage/course/2">2</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/3">3</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id}">...</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
                        </c:if>
                        <c:if test="${id==3}">
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/1">1</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/2">2</a></li>
                            <li class="page-item active"><a class="page-link" href="/personalPage/course/3">3</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id}">...</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
                        </c:if>
                        <c:if test="${id>3&&id<(courseEntities.size()/6)}">
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/1">1</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/2">2</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/3">3</a></li>
                            <li class="page-item active"><a class="page-link" href="/personalPage/course/${id}">...</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
                        </c:if>
                        <c:if test="${id==(courseEntities.size()/6)}">
                            <li class="page-item"><a class="page-link" href="/personalPage/course/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/1">1</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/2">2</a></li>
                            <li class="page-item"><a class="page-link" href="/personalPage/course/3">3</a></li>
                            <li class="page-item active"><a class="page-link" href="/personalPage/course/${id}">...</a></li>
                            <li class="page-item disabled"><a class="page-link" href="/personalPage/course/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
                        </c:if>
                    </c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>