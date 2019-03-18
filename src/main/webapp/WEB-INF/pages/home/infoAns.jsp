<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendFile.jsp" %>
<link href="../../css/index.css" rel="stylesheet"/>
<link href="../../css/home.css" rel="stylesheet"/>
<script src="../../js/question.js"></script>
<script src="../../js/infoAns.js"></script>
<script src="../../js/editor.js"></script>
<script src="../../js/createTime.js"></script>
<title>智存网-回答问题</title>
</head>
<body>
	<%@include file="../basicpage/homeHead.jsp" %>
	<div class="container body" style="padding-top:100px;">
		<div class="row">
			<div class="col-sm-9" style="padding-right:40px;border-right:1px #EBF0F1 solid;padding-bottom:80px;">
				<div class="question-info">
					<h4>${questionEntity.title}</h4>
					<div class="info">
						<ul class="clearfix">
							<li class="questioner">提问者:<a href="#">${questionEntity.userByAskerId.username}</a></li>
							<li class="sign">
								<div style="right:0;">
									<span class="fa fa-bookmark"></span>
									<span>${questionEntity.tagContent}</span>
								</div>
							</li>
							<li class="page-view">浏览量：${questionEntity.browseNum}</li>
						</ul>
					</div>
					<div class="supplement">
                        <span style="font-weight:bold;">问题内容：</span>${questionEntity.content}
                    </div>
                    <c:if test="${questionEntity.isResolve==0}">
                        <form method="post">
                            <span style="font-weight:bold;">回答问题：</span>
                            <input type="hidden" id="content" name="content"/>
                            <input type="hidden" id="createTime" name="answerTime"/>
                            <input type="hidden" name="userByAnswerManId.userId" value="${user.userId}"/>
                            <input type="hidden" name="questionByQuestionId.questionId" value="${questionEntity.questionId}">
                            <input type="hidden" name="isBestAnswer" value="0"/>
                            <div id="editor" style="width:720px;margin-bottom:10px;"></div>
                            <input id="add" type="submit" class="btn btn-success" value="提交回答">
                        </form>
                    </c:if>
                    <c:if test="${questionEntity.isResolve==1}">
                        <img src="/pic/resolve.png" class="resolve-pic">
                    </c:if>
				</div>
				<div class="question-divider">
					<span class="question-divider-text">${questionEntity.answersByQuestionId.size()}个回答</span>
					<span class="question-divider-line"></span>
				</div>
                <c:if test="${questionEntity.answersByQuestionId.size()==0}">
                    <span class="prompt">暂时还没有回答哦~</span>
                </c:if>
				<c:if test="${questionEntity.answersByQuestionId.size()!=0}">
					<c:if test="${bestAnswer!=null}">
						<img src="/pic/bestAns.png" style="width:110px;margin-top:20px;"/>
						<div class="bestAns clearfix">
							<div class="best-content">
								<p>${bestAnswer.content}</p>
								<span class="best-time">${bestAnswer.answerTime}</span>
								<div class="best-comment"><span class="fa fa-comments"></span>评论(${bestAnswer.commentsByAnswerId.size()})</div>
							</div>
							<div class="comment-area rounded clearfix">
								<div class="comment-form clearfix">
									<input type="text" class="form-control col-sm-11" style="font-size:13px;margin-right:5px;float:left;" placeholder="发表意见"/>
									<a href="#"><button type="button" class="btn" style="font-size:13px;float:left;">评论</button></a>
								</div>
								<div class="comment row" style="margin:0;">
									<c:forEach items="${bestAnswer.commentsByAnswerId}" var="comment">
										<div class="col-sm-3">
											<img src="${comment.userBySenderId.photo}" class="rounded-circle" style="width:30px;"/>回复<span style="font-weight:bold;">${answer.userByAnswerManId.username}:</span>
										</div>
										<div class="col-sm-9">
											<div class="comment-text text-justify">${comment.content}</div>
											<span class="com-time">${comment.commentTime}</span>
											<div class="com-comment"><span class="fa fa-comments"></span>回复</div>
										</div>
										<div class="comment-area rounded clearfix">
											<div class="comment-form clearfix">
												<input type="text" class="form-control col-sm-11" style="font-size:13px;margin-right:5px;float:left;" placeholder="发表意见"/>
												<a href="#"><button type="button" class="btn" style="font-size:13px;float:left;">评论</button></a>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="best-info clearfix">
								<img src="${bestAnswer.userByAnswerManId.photo}" class="rounded-circle best-pic">
								<div class="best-user">
									<p><span class="best-name">${bestAnswer.userByAnswerManId.username}</span><%--<span class="best-level rounded">LV2</span>--%></p>
									<p>
                                        <span class="best-sign">
                                            擅长:<c:forEach items="${bestAnswer.userByAnswerManId.coursesByUserId}" var="course" begin="0" end="1">${course.name} </c:forEach>
                                        </span>
									</p>
								</div>
							</div>
						</div>
					</c:if>
                    <img src="/pic/otherAns.png" style="width:90px;margin-top:20px;"/>
					<c:if test="${!empty otherAnswers}">
						<c:forEach items="${otherAnswers}" var="answer">
							<div class="answer clearfix row">
								<div class="col-sm-3 clearfix">
									<img src="${answer.userByAnswerManId.photo}" class="rounded-circle ans-pic">
									<div class="ans-name">${answer.userByAnswerManId.username}</div>
								</div>
								<div class="col-sm-9 ans-content">
									<span class="ans-text">${answer.content}</span><br/>
									<span class="ans-time">${answer.answerTime}</span>
									<div class="ans-comment"><span class="fa fa-comments"></span>评论(${answer.commentsByAnswerId.size()})</div>
									<c:if test="${questionEntity.isResolve==0&&questionEntity.userByAskerId.userId==user.userId}">
										<a href="/resolveQuestion/${questionEntity.questionId}/${answer.answerId}"><button class="ans-resolve btn btn-success">采纳他</button></a>
									</c:if>
								</div>
								<div class="comment-area rounded clearfix">
									<div class="comment-form clearfix">
										<input type="text" class="form-control col-sm-11" style="font-size:13px;margin-right:5px;float:left;" placeholder="发表意见"/>
										<a href="#"><button type="button" class="btn" style="font-size:13px;float:left;">评论</button></a>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
                    <c:if test="${empty otherAnswers}">
						<span class="prompt">该问题没有其他的回答哦~</span>
					</c:if>
				</c:if>
			</div>
			<div class="col-sm-3 clearfix" style="padding:0 30px;">
				<div style="position: fixed;">
					<div class="clearfix" style="margin-bottom:30px;">
						<span class="head">猜你想答</span>
						<a href="#" class="refresh"onclick="location.reload()"><span class="fa fa-refresh" ></span>换一换</a>
					</div>
					<ul class="otherQues">
                        <c:if test="${empty otherQuestions}">
                            <li><span class="prompt">不好意思，暂时没有相似问题可以回答哦~</span></li>
                        </c:if>
                        <c:if test="${!empty otherQuestions}">
                            <c:forEach items="${otherQuestions}" var="otherQuestion" begin="0" end="9">
                                <li><a href="/infoAns/${otherQuestion.questionId}">${otherQuestion.title}</a></li>
                            </c:forEach>
                        </c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../basicpage/homeCopy.jsp" %>
</body>
</html>