<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/homework/style/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="/homework/style/font-awesome.css">
<link rel="stylesheet" href="/homework/style/jquery-ui.css">
<link href="/homework/style/style.css" rel="stylesheet">
<link href="/homework/style/widgets.css" rel="stylesheet">
<link rel="shortcut icon" href="/homework/img/favicon/favicon.png">
<link rel="stylesheet" type="text/css" href="/homework/style/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/homework/style/bootstrap-table.min.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="mainbar">   
	<div class="page-head">
	  <h2 class="pull-left"><i class="icon-user"></i> 科目管理</h2>
	   	<div class="clearfix"></div>
	</div>
	<div class="matter">
		<div class="row" style="margin-left: 10px;margin-right: 20px;">
		     <div class="container">
				<table id="user_table">
				</table>
		     </div>
		</div>
	 </div>
</div>
<!-- JS -->
<script src="/homework/js/jquery.js"></script> <!-- jQuery -->
<script src="/homework/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="/homework/js/bootstrap-table.min.js"></script>
<script src="/homework/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#user_table").bootstrapTable({
	    url: '/homework/admin/user/getAll',
	    method: 'get',
	    striped:'true',
	    pagination:true,
	    search:true,
	    pageSize: 20,
        pageList: [20, 30,40],	    
	    columns: [{
	        field: 'userId',
	        title: 'Id',
	        width: '10%',
	        align: 'center'

	    }, {
	        field: 'userName',
	        title: '姓名',
	        width: '20%',
	        align: 'center'
	    },{
	      field:'userNo',
	      title:'学号/教工号',
	      width: '25%',
	      align: 'center'
	    },{
    	  field:'email',
	      title:'邮箱',
	      width: '25%',
	      align: 'center'
	    },{
    	  field:'role',
	      title:'角色',
	      width: '10%',
	      align: 'center',
	      formatter:function(value,row){
	    	  var val=''
	    	  switch(value){
	    	   case 0:val='学生'
	    	   		break
	    	   case 1:val='教师'
	    	   		break
	    	   case 2:val='管理员'
	    	   		break
	    	   default:break		
	    	  }
	    	  return val
	      }
	    },{
	      field:'',
	      title:'操作',
	      align: 'center',
	      width: '10%',
	      formatter:function(value,row){
	    	  console.log(row.stoveId)
	          return [
	                '<a class="glyphicon glyphicon-trash" onclick="" href="#" title="操作">',
	                '',
	                '</a>'
	            ].join('');
	        }
	      
	    }]	     
  })
})	

</script>
</body>
</html>