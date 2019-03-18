<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendFile.jsp" %>
<link href="../../css/index.css" rel="stylesheet"/>
<link href="../../css/home.css" rel="stylesheet"/>
<script src="../../js/answer.js"></script>
<title>智存网-回答问题</title>
</head>
<body>
	<%@include file="../basicpage/homeHead.jsp" %>
	<div class="container-fluid body" style="padding:100px 0;background-color: #F3F3F3;">
		<div id="answer-page" class="container">
			<div class="allAns col-sm-12">
				<nav class="breadcrumb" style="color:#8B8B8B;font-size:15px;">
					<a href="/answer/1" class="breadcrumb-item">全部问题</a>
					<span class="breadcrumb-item">${name}</span>
				</nav>
			</div>
			<div class="col-sm-12">
				<div class="col-sm-4" style="padding:0;">
					<ul class="supplyAns-title row clearfix">
						<li id="li1" class="col-sm-6" style="background-color:white;"><a href="#" style="color:#4ACA6D;">最新提问</a></li>
						<li id="li2" class="col-sm-6"><a href="#">热门提问</a></li>
					</ul>
				</div>
				<div class="supplyAns-body col-sm-12" style="padding:0px 40px;padding-bottom:40px;">
					<div class="chooseAns clearfix">
						<input class="form-control" type="text" name="choice" placeholder="按关键词筛选" style="width:200px;font-size:14px;float:left;"/>
						<a class="go-search rounded" href="#" style="color: #35b558;text-decoration: none;">筛选</a>
						<a href="#" class="refresh" onclick="location.reload()"><span class="fa fa-refresh"></span>刷新</a>
					</div>
					<div class="answer-body clearfix">
						<div id="table1">
							<table class="table table-hover" style="font-size:15px;">
								<c:forEach items="${LatestQuestions}" var="question" begin="${10*(id-1)}" end="${10*id-1}">
									<tr>
										<td class="answer-title"><a href="/infoAns/${question.questionId}">${question.title}</a></td>
										<td class="answer-sign">
											<span class="fa fa-mortar-board" style="float:left;margin-top:5px;"></span>
											<span>${question.tagContent}</span>
										</td>
										<td class="answer-info"><span style="margin-right: 10px;"><a href="#">${question.answersByQuestionId.size()}回答</a></span>|<span style="margin-left: 10px;">${question.createTime}</span></td>
									</tr>
								</c:forEach>
							</table>
							<ul class="pagination" style="float:right;margin-right:50px;margin-top:20px;">
								<c:if test="${LatestQuestions.size()<=10}">
									<li class="page-item disabled"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
									<li class="page-item active"><a class="page-link" href="/answer/1">1</a></li>
									<li class="page-item disabled"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
								</c:if>
								<c:if test="${LatestQuestions.size()>10&&LatestQuestions.size()<=20}">
									<c:if test="${id==1}">
										<li class="page-item disabled"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item active"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
									<c:if test="${id==2}">
										<li class="page-item"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item active"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item disabled"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
								</c:if>
								<c:if test="${LatestQuestions.size()>20&&LatestQuestions.size()<=30}">
									<c:if test="${id==1}">
										<li class="page-item disabled"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item active"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
									<c:if test="${id==2}">
										<li class="page-item"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item active"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
									<c:if test="${id==3}">
										<li class="page-item"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item active"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item disabled"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
								</c:if>
								<c:if test="${LatestQuestions.size()>30}">
									<c:if test="${id==1}">
										<li class="page-item disabled"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item active"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id}">...</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
									<c:if test="${id==2}">
										<li class="page-item"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item active"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id}">...</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
									<c:if test="${id==3}">
										<li class="page-item"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item active"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id}">...</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
									<c:if test="${id>3&&id<(LatestQuestions.size()/10)}">
										<li class="page-item"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item active"><a class="page-link" href="/answer/${id}">...</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
									<c:if test="${id==(LatestQuestions.size()/10)}">
										<li class="page-item"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item active"><a class="page-link" href="/answer/${id}">...</a></li>
										<li class="page-item disabled"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
								</c:if>
							</ul>
						</div>
						<div id="table2" style="display:none;">
							<table class="table table-hover" style="font-size:15px;">
								<c:forEach items="${HottestQuestions}" var="question" begin="${10*(id-1)}" end="${10*id-1}">
									<tr>
										<td class="answer-title"><a href="/infoAns/${question.questionId}">${question.title}</a></td>
										<td class="answer-sign">
											<span class="fa fa-mortar-board" style="float:left;margin-top:5px;"></span>
											<span>${question.tagContent}</span>
										</td>
										<td class="answer-info"><span style="margin-right: 10px;"><a href="#">${question.answersByQuestionId.size()}回答</a></span>|<span style="margin-left: 10px;">${question.createTime}</span></td>
									</tr>
								</c:forEach>
							</table>
							<ul class="pagination" style="float:right;margin-right:50px;margin-top:20px;">
								<c:if test="${HottestQuestions.size()<=10}">
									<li class="page-item disabled"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
									<li class="page-item active"><a class="page-link" href="/answer/1">1</a></li>
									<li class="page-item disabled"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
								</c:if>
								<c:if test="${HottestQuestions.size()>10&&HottestQuestions.size()<=20}">
									<c:if test="${id==1}">
										<li class="page-item disabled"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item active"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
									<c:if test="${id==2}">
										<li class="page-item"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item active"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item disabled"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
								</c:if>
								<c:if test="${HottestQuestions.size()>20&&HottestQuestions.size()<=30}">
									<c:if test="${id==1}">
										<li class="page-item disabled"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item active"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
									<c:if test="${id==2}">
										<li class="page-item"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item active"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
									<c:if test="${id==3}">
										<li class="page-item"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item active"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item disabled"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
								</c:if>
								<c:if test="${HottestQuestions.size()>30}">
									<c:if test="${id==1}">
										<li class="page-item disabled"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item active"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id}">...</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
									<c:if test="${id==2}">
										<li class="page-item"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item active"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id}">...</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
									<c:if test="${id==3}">
										<li class="page-item"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item active"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id}">...</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
									<c:if test="${id>3&&id<(HottestQuestions.size()/10)}">
										<li class="page-item"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item active"><a class="page-link" href="/answer/${id}">...</a></li>
										<li class="page-item"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
									<c:if test="${id==(HottestQuestions.size()/10)}">
										<li class="page-item"><a class="page-link" href="/answer/${id-1}"><span class="fa fa-angle-double-left"></span></a></li>
										<li class="page-item"><a class="page-link" href="/answer/1">1</a></li>
										<li class="page-item"><a class="page-link" href="/answer/2">2</a></li>
										<li class="page-item"><a class="page-link" href="/answer/3">3</a></li>
										<li class="page-item active"><a class="page-link" href="/answer/${id}">...</a></li>
										<li class="page-item disabled"><a class="page-link" href="/answer/${id+1}"><span class="fa fa-angle-double-right"></span></a></li>
									</c:if>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../basicpage/homeCopy.jsp" %>
</body>
</html>