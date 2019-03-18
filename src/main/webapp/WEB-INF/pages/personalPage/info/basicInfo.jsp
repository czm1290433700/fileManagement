<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../../basicpage/extendFile.jsp" %>
<link href="/css/person-page.css" rel="stylesheet"/>
<link href="/css/school.css" rel="stylesheet"/>
<script src="/js/Area.js"></script>
<script src="/js/AreaData_min.js"></script>
<script src="/js/basic-info.js"></script>
<script src="/js/birthday.js"></script>
<script src="/js/height.js"></script>
<title>${user.username}的个人主页-信息完善</title>
</head>
<body onpageshow="changeCity(this.value,'seachdistrict','seachdistrict');">
	<%@include file="../../basicpage/personalPageHead.jsp" %>
	<div class="container-fluid page-body clearfix">
		<%@include file="../../basicpage/personalPageLeft.jsp"%>
		<div class="page-content">
			<div class="info-table rounded">
				<div class="info-table-head">信息完善</div>
				<div class="info-content clearfix">
					<div class="info-menu">
						<div class="info-menu-title info-menu-title-active"><span style="margin-right:10px;font-size:16px;" class="fa fa-user"></span><span style="font-weight:500;font-size:16px;color:#666!important;">个人资料</span></div>
						<ul style="margin:0;padding:0;">
							<a href="/personalPage/info/basicInfo"><li class="info-item info-item-active">资料完善</li></a>
							<a href="/personalPage/info/picInfo"><li class="info-item">头像更换</li></a>
						</ul>
						<div class="info-menu-title"><span style="margin-right:10px;font-size:16px;" class="fa fa-unlock-alt"></span><span style="font-weight:500;font-size:16px;color:#666!important;">隐私设置</span></div>
						<ul style="margin:0;padding:0;">
							<a href="/personalPage/info/pwdInfo"><li class="info-item">密码修改</li></a>
						</ul>
					</div>
					<div class="info-form">
						<div class="info-form-title"><h5>基本资料</h5></div>
						<form action="" method="post" class="settings-form">
							<table>
								<input type="hidden" name="userId" value="${user.userId}">
								<tr>
									<th>性别:</th>
									<td>
										<c:if test="${user.sex.equals('man')}">
											<input type="radio" id="man" name="sex" value="man" checked/>
											<label for="man" style="margin-right:15px;">男</label>
											<input type="radio" id="woman" name="sex" value="woman"/>
											<label for="woman">女</label>
										</c:if>
										<c:if test="${user.sex.equals('woman')}">
											<input type="radio" id="man" name="sex" value="man"/>
											<label for="man" style="margin-right:15px;">男</label>
											<input type="radio" id="woman" name="sex" value="woman" checked/>
											<label for="woman">女</label>
										</c:if>
										<c:if test="${user.sex.equals('')}">
											<input type="radio" id="man" name="sex" value="man"/>
											<label for="man" style="margin-right:15px;">男</label>
											<input type="radio" id="woman" name="sex" value="woman"/>
											<label for="woman">女</label>
										</c:if>
									</td>
								</tr>
								<tr>
									<th>年龄:</th>
									<td>
										<input type="text" class="form-control select" name="age" value="${user.age}" placeholder="请输入年龄">
									</td>
								</tr>
								<tr>
									<th>生日:</th>
									<td>
										<select class="form-control select" id="sel_year" name="year">
											<c:if test="${user.year!=0}">
												<option value="${user.year}" selected>${user.year}</option>
											</c:if>
										</select>
										<select class="form-control select" id="sel_month" name="month">
											<c:if test="${user.month!=0}">
												<option value="${user.month}" selected>${user.month}</option>
											</c:if>
										</select>
	        							<select class="form-control select" id="sel_day" name="day">
											<c:if test="${user.day!=0}">
												<option value="${user.day}" selected>${user.day}</option>
											</c:if>
										</select>
									</td>
								</tr>
								<tr>
									<th>专业:</th>
									<td>
										<input type="text" class="form-control select" name="major" value="${user.major}" placeholder="请输入专业">
									</td>
								</tr>
								<tr>
									<th>学期:</th>
									<td>
										<input type="text" class="form-control select" name="semester" value="${user.semester}" placeholder="请输入学期">
									</td>
								</tr>
								<tr>
									<th>签名:</th>
									<td>
										<input type="text" class="form-control select" name="signature" value="${user.signature}" placeholder="请输入签名" style="width: 180px!important;">
									</td>
								</tr>
								<tr>
									<th>所在城市:</th>
									<td>
										<input type="hidden" id="province" value="${user.province}"/>
										<input type="hidden" id="city" value="${user.city}"/>
										<input type="hidden" id="area" value="${user.area}"/>
										<select class="form-control select" id="seachprov" name="province" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"></select>
										<select class="form-control select" id="seachcity" name="city" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"></select>
										<span id="seachdistrict_div">
											<select class="form-control select" id="seachdistrict" name="area"></select>
										</span>
									</td>
								</tr>
								<tr>
									<th>在读学校:</th>
									<td>
										<input type="text" class="form-control select" name="school" value="${user.school}" placeholder="请输入在读学校" style="width: 120px!important;">
									</td>
								</tr>
								<tr>
									<th>联系电话:</th>
									<td>
										<c:if test="${user.phone==0}">
											<input type="text" class="form-control select" name="phone" placeholder="请输入联系电话" style="width: 150px!important;">
										</c:if>
										<c:if test="${user.phone!=0}">
											<input type="text" class="form-control select" name="phone" value="${user.phone}" placeholder="请输入联系电话" style="width: 150px!important;">
										</c:if>
									</td>
								</tr>
							</table>
							<input type="submit" value="保存" class="btn btn-primary submit" style="font-size:13px;"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>