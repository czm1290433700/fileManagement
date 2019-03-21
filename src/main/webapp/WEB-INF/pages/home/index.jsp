<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../basicpage/extendFile.jsp" %>
<link href="/css/index.css" rel="stylesheet"/>
<script src="/js/index.js"></script>
<title>智存——让你的学习更有规律</title>
</head>
<body style="display:none">
	<%@include file="../basicpage/homeHead.jsp" %>
	<div class="container-fluid body" id="wall">
		<div class="container">
			<div class="row" style="padding-top:150px;">
				<div class="col-sm-7">
					<h2 id="head-section-text1">智 存</h2>
					<div class="text-center" style="padding-top:180px;">
						<h5 id="head-section-text2">打造自己的学习库<br><span style="text-indent:4em;">让你的学习更有序</span></h5>
					</div>
					<a href="/login"><button type="button" class="btn btn-warning btn-lg" style="padding:15px 20px;color:white;font-size:18px;">开始学习之路</button></a>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid" id="section"> 
		<div class="container service">
			<div class="section-head">
				<h1 class="text-center" style="margin-bottom: 20px;">我们的功能</h1>
				<div class="colored-line"></div>
				<div class="text-center">以课程，笔记，提问三个主要模块展开</div>
			</div>
			<div class="row" style="padding:0 30px;position: relative;">
				<div class="pic-module pic-module-first">
					<img class="app-pic" alt="" src="/pic/app1.jpg"/>
					<h4 class="col-sm-12">最新课程</h4>
					<div class="app-doc"><p>根据用户喜好需求，推荐相关最新课程，并且允许用户站内搜索特定视频学习</p></div>
				</div>
				<div class="pic-module">
					<img class="app-pic" alt="" src="/pic/app2.jpg"/>
					<h4 class="col-sm-12">笔记互动</h4>
					<div class="app-doc"><p>提供笔记文件管理，并且遵循用户的意愿，用户之间互相分享讨论笔记，共同提高</p></div>
				</div>
				<div class="pic-module pic-module-last" style="padding-top:8px;">
					<img class="app-pic" src="/pic/app3.jpg" alt="" style="margin-bottom: 14px;"/>
					<h4 class="col-sm-12">提问回答</h4>
					<div class="app-doc"><p>三人行必有我师。允许用户相对相关标签提问，擅长这方面用户进行回答，用户之间共同进步</p></div>
				</div>
			</div>
		</div>	
	</div>
	<div id="section" class="container-fluid team">
		<div style="background: rgba(13, 60, 85, 0.8);width:100%;height:100%;">
			<div class="container service">
				<div class="section-head">
					<h1 class="text-center" style="margin-bottom: 20px;">我们的团队</h1>
					<div class="colored-line"></div>
					<div class="text-center">麻雀虽小，五脏俱全</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<div class="rounded-circle team-pic">
							<img src="/pic/company1.jpg" alt="" style="width:150px;height:150px;"/>
							<div class="team-information">
								<div class="member-details">
									<h5 class="member-head">陈祯民</h5>
									<p>前端&负责人</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="rounded-circle team-pic">
							<img src="/pic/company2.bmp" alt="" style="width:150px;height:150px;"/>
							<div class="team-information">
								<div class="member-details">
									<h5 class="member-head">严坤</h5>
									<p>图标设计</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="rounded-circle team-pic">
							<img src="/pic/company3.jpg" alt="" style="width:150px;height:150px;"/>
							<div class="team-information">
								<div class="member-details">
									<h5 class="member-head">李春燕</h5>
									<p>后端&需求分析</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="rounded-circle team-pic">
							<img src="/pic/company4.jpg" alt="" style="width:150px;height:150px;"/>
							<div class="team-information">
								<div class="member-details">
									<h5 class="member-head">徐丽洪</h5>
									<p>后端</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid" id="section"> 
		<div class="container service">
			<div class="section-head">
				<h1 class="text-center" style="margin-bottom: 20px;">优秀笔记</h1>
				<div class="colored-line"></div>
				<div class="text-center">最受欢迎的笔记作者和他们的代表作</div>
			</div>
			<div class="row" style="padding:0 30px;">
				<c:choose>
					<c:when test="${userEntities.size()==0}">
						<span class="prompt">抱歉,暂时还没有用户`</span>
					</c:when>
					<c:when test="${userEntities.size()<3}">
						<c:forEach items="${userEntities}" var="userEntity">
							<div class="pic-module">
								<div class="pic-container">
									<img class="pic-container-inner" alt="" src="${userEntity.photo}"/>
								</div>
								<h4 style="margin-top:40px;">${userEntity.username}</h4>
								<table class="pic-table">
									<tr>
										<td>签名：</td>
										<td>${userEntity.signature}</td>
									</tr>
									<tr>
										<td>笔记：</td>
										<td>${userEntity.notesByUserId.size()}</td>
									</tr>
									<tr>
										<td>留言：</td>
										<td>${userEntity.messageNum}</td>
									</tr>
									<tr>
										<td>粉丝：</td>
										<td>${userEntity.followNum}</td>
									</tr>
									<tr>
										<td>著作：</td>
										<td>
											<ul>
												<c:if test="${userEntity.notesByUserId.size()==0}">
													暂时还没写笔记哦~
												</c:if>
												<c:if test="${userEntity.notesByUserId.size()!=0}">
													<c:forEach items="${userEntity.notesByUserId}" var="note" begin="0" end="2">
														<li><a href="/infoNote/${note.noteId}">${note.title}</a></li>
													</c:forEach>
												</c:if>
											</ul>
										</td>
									</tr>
								</table>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach items="${userEntities}" var="userEntity" begin="0" end="2">
							<div class="pic-module">
								<div class="pic-container">
									<img class="pic-container-inner" alt="" src="${userEntity.photo}"/>
								</div>
								<h4 style="margin-top:40px;">${userEntity.username}</h4>
								<table class="pic-table">
									<tr>
										<td>签名：</td>
										<td>${userEntity.signature}</td>
									</tr>
									<tr>
										<td>笔记：</td>
										<td>${userEntity.notesByUserId.size()}</td>
									</tr>
									<tr>
										<td>留言：</td>
										<td>${userEntity.messageNum}</td>
									</tr>
									<tr>
										<td>粉丝：</td>
										<td>${userEntity.followNum}</td>
									</tr>
									<tr>
										<td>著作：</td>
										<td>
											<ul>
												<c:if test="${userEntity.notesByUserId.size()==0}">
													暂时还没写笔记哦~
												</c:if>
												<c:if test="${userEntity.notesByUserId.size()!=0}">
													<c:forEach items="${userEntity.notesByUserId}" var="note" begin="0" end="2">
														<li><a href="/infoNote/${note.noteId}">${note.title}</a></li>
													</c:forEach>
												</c:if>
											</ul>
										</td>
									</tr>
								</table>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>	
	</div>
	<div class="container-fluid" id="section"> 
		<div class="container service">
			<div class="section-head">
				<h1 class="text-center" style="margin-bottom: 20px;">联系我们</h1>
				<div class="colored-line"></div>
				<div class="text-center">通过以下方式把您的意见发送给我们</div>
			</div>
			<div class="row" style="padding-bottom:60px;">
				<div class="col-sm-4 text-center" style="padding-top:50px">
					<i class="fa fa-envelope" style="font-size:35px;color:orange;margin-bottom:20px;"></i>
					<p style="color:orange;font-weight:500;">1290433700@qq.com</p>
				</div>
				<div class="col-sm-4 text-center" style="padding-top:50px">
					<i class="fa fa-qq" style="font-size:35px;color:orange;margin-bottom:20px;"></i>
					<p style="color:orange;font-weight:500;">1290433700</p>
				</div>
				<div class="col-sm-4 text-center" style="padding-top:50px">
					<i class="fa fa-whatsapp" style="font-size:35px;color:orange;margin-bottom:20px;"></i>
					<p style="color:orange;font-weight:500;">0791-123456</p>
				</div>
			</div>
		</div>	
	</div>
	<%@include file="../basicpage/homeCopy.jsp" %>
</body>
</html>