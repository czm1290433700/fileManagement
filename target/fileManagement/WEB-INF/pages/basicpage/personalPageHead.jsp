<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="navbar navbar-expand-sm fixed-top container-fluid" style="background-color:white;">
	<div class="head-brand col-sm-2">
		<a class="navbar-brand" href="/"><img src="/pic/head2.png" style="width:110px;"></a>
	</div>
	<div class="head-form col-sm-7">
	<form action="" method="post">
		<i class="fa fa-search" style="color:#9C9FB1;"></i>
		<input type="text" placeholder="Search projects" name="projects" style="border:none;width:180px;"/>
		<input type="submit" class="btn btn-primary btn-sm" value="Go"/>
	</form>
	</div>
	<ul class="navbar-nav head-list col-sm-3" style="padding-right:0;">
		<li class="nav-item dropdown">
			<img src="${user.photo}" class="rounded-circle" style="width:30px;float:left;" data-toggle="dropdown">
			<a class="nav-link dropdown-toggle" href="#" style="float:left;color:#747476;" data-toggle="dropdown">${user.username}</a>
			<div class="dropdown-menu menu1">
				<a class="dropdown-item menu1-item" href="/personalPage/home"><span class="fa fa-home" style="font-size:18px;"></span>我的主页</a>
					<div class="dropdown-divider divider"></div>
				<a class="dropdown-item menu1-item" href="/personalPage/addCourse"><span class="fa fa-mortar-board"></span>添加课程</a>
				<div class="dropdown-divider divider"></div>
		        <a class="dropdown-item menu1-item" href="/personalPage/addNote"><span class="fa fa-tags"></span>写笔记</a>
		        <div class="dropdown-divider divider"></div>
		        <a class="dropdown-item menu1-item" href="/personalPage/addDocument"><span class="fa fa-cloud-upload"></span>上传文件</a>
		    </div>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link" href="#" data-toggle="dropdown"><i class="fa fa-envelope-o"></i><span class="badge badge-warning rounded-circle">1</span></a>
			<div class="dropdown-menu dropdown-menu-right menu2">
				<h6 class="menu2-head">消息箱</h6>
				<div class="dropdown-divider divider"></div>
				<a class="dropdown-item" href="#" style="padding:15px 20px;">
					<div class="clearfix">
						<img src="/pic/1.jpg" class="rounded-circle menu2-pic">
						<div class="menu2-text">超级玛丽给你留言了<br/><span style="color:#AFB2B4;">1分钟以前</span></div>
					</div>
				</a>
				<div class="dropdown-divider divider"></div>
		        <div class="menu2-info">共有一条未读消息</div>
		    </div>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link" href="#" data-toggle="dropdown"><i class="fa fa-bell-o"></i><span class="badge badge-warning rounded-circle">1</span></a>
			<div class="dropdown-menu dropdown-menu-right menu2">
				<h6 class="menu2-head">备忘箱</h6>
				<div class="dropdown-divider divider"></div>
				<a class="dropdown-item" href="#" style="padding:15px 20px;">
					<div class="clearfix">
						<div class="menu2-text">8点半有大数据讲座<br/><span style="color:#AFB2B4;">距事件10分钟</span></div>
					</div>
				</a>
				<div class="dropdown-divider divider"></div>
		        <div class="menu2-info">共有一个待完成事件</div>
		    </div>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/exit"><i class="fa fa-power-off"></i></a>
		</li>
	</ul>
</div>