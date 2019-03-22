<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendFile.jsp" %>
<link href="../../css/index.css" rel="stylesheet"/>
<link href="../../css/infoNote.css" rel="stylesheet"/>
<script src="../../js/index.js"></script>
<script src="../../js/infoNote.js"></script>
<script src="../../js/height.js"></script>
<script src="../../js/alert.js"></script>
<script src="../../js/createTime.js"></script>
<title>智存网-${note.title}</title>
</head>
<body>
	<%@include file="../basicpage/homeHead.jsp" %>
	<div class="container-fluid body">
		<div class="container row">
			<div class="body-left col-sm-8">
				<div class="col-sm-8">
					<nav class="breadcrumb" style="color:#8B8B8B;font-size:15px;">
						<a href="/noteRecommend/1" class="breadcrumb-item">全部笔记</a>
						<a href="/signNote/${note.courseByCourseId.courseId}/1" class="breadcrumb-item">${note.courseByCourseId.name}</a>
						<span class="breadcrumb-item">${note.title}</span>
					</nav>
				</div>
				<div class="body-left-content clearfix">
					<div class="col-sm-12 clearfix" style="margin-bottom:20px;">
						<div style="float:right;">
                            <c:if test="${user.userId==note.userByUserId.userId}">
                                <a href="/personalPage/modifyNote/${note.noteId}"><button type="button" class="btn btn-warning btn-sm" style="color:white;">编辑</button></a>
                                <a href="/personalPage/deleteNote/${note.userByUserId.userId}/${note.noteId}"><button type="button" class="btn btn-danger btn-sm">删除</button></a>
                            </c:if>
                            <c:if test="${ffolderEntity==null}">
                                <a href="/personalPage/favoriteNote/${note.noteId}"><button type="button" class="btn btn-info btn-sm">收藏</button></a>
                            </c:if>
                            <c:if test="${ffolderEntity!=null}">
                                <a href="/personalPage/cancelFavoriteNote/${note.noteId}"><button type="button" class="btn btn-info btn-sm">取消收藏</button></a>
                            </c:if>
						</div>
					</div>
					<h4 class="title">${note.title}</h4>
					<span class="author"><a href="#">${note.userByUserId.username}</a></span><br/>
					<span class="time">${note.createTime}</span>
					<div class="main">${note.content}</div>
					<div class="info">
						<div class="comments">
							<span class="fa fa-comments"></span>${note.commentsByNoteId.size()}
						</div>
						<div class="browse">
							<span class="fa fa-eye"></span>${note.view}
						</div>
					</div>
				</div>
				<div class="comment">
					<h5>评论</h5>
					<c:if test="${note.commentsByNoteId.size()==0}">
						<span class="prompt">暂时还没有评论哦~</span>
					</c:if>
					<div class="comment-area rounded clearfix">
						<c:if test="${user==null}">
							<form class="comment-form clearfix" method="post" onsubmit="false">
								<input type="text" class="form-control col-sm-10" style="font-size:13px;margin-right:5px;float:left;" placeholder="发表意见"/>
								<button type="button" class="btn loginAlert" style="font-size:13px;float:left;">评论</button>
							</form>
						</c:if>
						<c:if test="${user!=null}">
							<form class="comment-form clearfix" method="post">
								<input type="hidden" name="commentTime" class="createTime">
								<input type="hidden" name="userBySenderId.userId" value="${user.userId}">
								<input type="hidden" name="noteByNoteId.noteId" value="${note.noteId}">
								<input type="text" name="content" class="form-control col-sm-10" style="font-size:13px;margin-right:5px;float:left;" placeholder="发表意见"/>
								<input type="submit" class="btn" style="font-size:13px;float:left;" value="评论">
							</form>
						</c:if>
						<c:if test="${note.commentsByNoteId.size()!=0}">
							<c:forEach items="${note.commentsByNoteId}" var="comment">
								<div>
									<div class="comment row" style="margin:0;">
										<div class="col-sm-3">
											<img src="${comment.userBySenderId.photo}" class="rounded-circle" style="width:30px;"/><span>${comment.userBySenderId.username}</span>:
										</div>
										<div class="col-sm-9">
											<div class="comment-text text-justify">${comment.content}</div>
											<span class="com-time">${comment.commentTime}</span>
											<div class="com-comment"><span class="fa fa-comments"></span>回复</div>
										</div>
									</div>
									<div class="comment-area-none rounded clearfix">
                                        <c:if test="${user==null}">
                                            <form class="comment-form clearfix" method="post" onsubmit="false">
                                                <input type="text" class="form-control col-sm-10" style="font-size:13px;margin-right:5px;float:left;" placeholder="发表意见"/>
                                                <button type="button" class="btn loginAlert" style="font-size:13px;float:left;">评论</button>
                                            </form>
                                        </c:if>
                                        <c:if test="${user!=null}">
                                            <form class="comment-form clearfix" method="post">
                                                <input type="hidden" name="commentTime" class="createTime">
                                                <input type="hidden" name="userBySenderId.userId" value="${user.userId}">
                                                <input type="hidden" name="noteByNoteId.noteId" value="${note.noteId}">
                                                <input type="text" name="content" class="form-control col-sm-10" style="font-size:13px;margin-right:5px;float:left;" placeholder="发表意见"/>
                                                <input type="submit" class="btn" style="font-size:13px;float:left;" value="评论">
                                            </form>
                                        </c:if>
									</div>
                                    <div class="comment-divider"></div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
			<div class="body-right">
				<div class="clearfix" style="margin-bottom:30px;">
					<span class="head">猜你喜欢</span>
					<a href="#" class="refresh"><span class="fa fa-refresh"></span>换一换</a>
				</div>
				<ul class="otherQues">
					<c:if test="${empty otherNotes}">
						<li><span class="prompt">不好意思，暂时没有更多的笔记咯~</span></li>
					</c:if>
					<c:if test="${!empty otherNotes}">
						<c:forEach items="${otherNotes}" var="otherNote" begin="0" end="9">
							<li><a href="/infoNote/${otherNote.noteId}">${otherNote.title}</a></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<%@include file="../basicpage/homeCopy.jsp" %>
</body>
</html>