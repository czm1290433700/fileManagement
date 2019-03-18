<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="nav-left clearfix">
	<ul class="nav">
		<li class="nav-item clearfix">
			<a href="/personalPage/home" class="nav-link">
				<div class="person-info">
					<img src="${user.photo}" class="rounded-circle" style="width:50px;height:50px;margin-right:10px;">
					<span style="color:black;">${user.username}</span>
				</div>
				<span class="fa fa-home" style="font-size:20px;color:#B66DFF;float:right;padding-top:15px;"></span>
			</a>
		</li>
		<li class="nav-item">
			<a href="/personalPage/info/basicInfo" class="nav-link">
				<span>信息完善</span>
				<span class="fa fa-user-circle icon"></span>
			</a>
		</li>
		<li class="nav-item">
			<a href="/personalPage/course/1" class="nav-link">
				<span>我的课程</span>
				<span class="fa fa-mortar-board icon"></span>
			</a>
		</li>
		<li class="nav-item">
			<a href="/personalPage/note/0/1" class="nav-link">
				<span>我的笔记</span>
				<span class="fa fa-tags icon"></span>
			</a>
		</li>
		<li class="nav-item">
			<a href="/personalPage/folder/1" class="nav-link">
				<span>我的文件夹</span>
				<span class="fa fa-folder-open icon"></span>
			</a>
		</li>
		<li class="nav-item">
			<a href="/personalPage/favorite/1" class="nav-link">
				<span>我的收藏夹</span>
				<span class="fa fa-folder icon"></span>
			</a>
		</li>
	</ul>
</div>