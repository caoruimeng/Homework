<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>云作业平台后台管理系统</title>
</head>
<body>
	<div class="navbar navbar-fixed-top bs-docs-nav" role="banner" style="min-width: 800px;">
		<div class="conjtainer">
			<a href="javascript:void(0)" class="navbar-brand" style="size: 20px">云作业平台后台管理系统</a>
		</div>
		
		<!-- Navigation starts -->
		<nav class="collapse navbar-collapse bs-navbar-collapse"
			role="navigation"> <!-- Links -->
		<ul class="nav navbar-nav pull-right">
			<li class="dropdown pull-right"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#"> <i class="icon-user"></i> ${user.userName}
					<b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a href="#"><i class="icon-user"></i> 资料</a></li>
					<li><a href="#"><i class="icon-cogs"></i> 设置</a></li>
					<li><a href="/homework/admin"><i class="icon-off"></i> 退出</a></li>
				</ul></li>

		</ul>
		</nav>
	</div>
	<div class="content" style="margin-top: 10px;min-width: 800px"></div>
    <div class="sidebar">
        <ul id="nav">                  
          <li><a href="/homework/admin/user" class="open"><i class="icon-user"></i>用户管理</a></li>
          <li><a href="/homework/admin/repertory"><i class="icon-tasks"></i>题库管理</a></li>
          <li><a href="/homework/admin/subject"><i class="icon-bar-chart"></i>科目管理</a></li>    		
          <li><a href="/homework/admin/classes"><i class="icon-list-alt"></i>班级管理</a></li> 
          <li><a href="#"><i class="icon-envelope-alt"></i>公告管理</a></li>
        </ul>
    </div>
</body>
</html>