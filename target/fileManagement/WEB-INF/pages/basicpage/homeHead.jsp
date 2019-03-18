<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid navbar navbar-expand-sm bg-dark navbar-dark fixed-top" style="height:80px;">
	<a href="/" class="navbar-brand col-sm-4" style="padding-left:80px;">
		<img src="/pic/head.png" style="width:110px;"/>
	</a>
	<button type="button" class="navbar-toggler" data-toggle="collapse" data-target=".collapse">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse col-sm-8 row">
		<ul class="navbar-nav col-sm-9">
			<li class="nav-item"><a href="/" class="nav-link">首页</a></li>
			<li class="nav-item"><a class="nav-link">最新课程</a></li>
			<li class="nav-item"><a href="/noteRecommend/1" class="nav-link">笔记推荐</a></li>
			<li class="nav-item"><a href="/question" class="nav-link">提个问题</a></li>
			<li class="nav-item"><a href="/answer/1" class="nav-link">回答问题</a></li>
			<li class="form-inline">
				<input type="text" class="form-control form-control-sm" placeholder="search something .." style="margin:0px 5px;font-size:13px;"/>
				<button type="button" class="btn btn-primary btn-sm" style="font-size:13px;">搜索</button>
			</li>
		</ul>
		<ul class="navbar-nav col-sm-3" style="padding-left:100px;">
			<c:if test="${user==null}">
				<li class="nav-item"><a href="/register" class="nav-link">注册</a></li>
				<li class="nav-item"><a href="/login" class="nav-link">登录</a></li>
			</c:if>
			<c:if test="${user!=null}">
				<li class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">${user.username}</a>
					<div class="dropdown-menu userMenu">
						<a class="dropdown-item userMenu-item" href="/personalPage/home">我的主页</a>
						<a class="dropdown-item userMenu-item">我的消息<span class="badge badge-info">${user.messageNum}</span></a>
						<a class="dropdown-item userMenu-item">我的关注</a>
						<div class="dropdown-divider divider"></div>
						<a href="/exit" class="dropdown-item userMenu-item">退出登录</a>
					</div>
				</li>
			</c:if>
		</ul>
	</div>
</div>