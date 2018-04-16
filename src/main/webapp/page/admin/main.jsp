<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${webRoot}/style/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${webRoot}/style/font-awesome.css">
<link rel="stylesheet" href="${webRoot}/style/jquery-ui.css">
<link href="${webRoot}/style/style.css" rel="stylesheet">
<link href="${webRoot}/style/widgets.css" rel="stylesheet">
<link rel="shortcut icon" href="${webRoot}/img/favicon/favicon.png">
<link rel="stylesheet" type="text/css" href="${webRoot}/style/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${webRoot}/style/bootstrap-table.min.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="mainbar">   
    <div class="page-head">
      <h2 class="pull-left"><i class="icon-user"></i>客户管理</h2>
       	<div class="clearfix"></div>
    </div>
    <div class="matter">
	   <div class="row" style="margin-left: 10px;margin-right: 20px;">
	   		
	        <div class="container">
				<table id="customer_table">
				</table>
	        </div>
	   </div>
     </div>
    </div>
</body>
</html>