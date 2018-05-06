<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="hw" uri="/hwtag" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/homework/style/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="/homework/style/font-awesome.css">
<link rel="stylesheet" href="/homework/style/jquery-ui.css">
<link href="/homework/style/style.css" rel="stylesheet">
<link href="/homework/style/widgets.css" rel="stylesheet">
<link rel="shortcut icon" href="/homework/img/favicon/favicon.png">
<link rel="stylesheet" type="text/css" href="/homework/style/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/homework/style/bootstrap-table.min.css">
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="mainbar">   
	<div class="page-head">
	  <h2 class="pull-left"><i class="icon-bar-chart"></i> 班级管理</h2>
	   	<div class="clearfix"></div>
	</div>
	<div class="matter">		
		<div class="row" style="margin-left: 10px;margin-right: 20px;">
			<table id="myclasses" ></table>
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
	$("#myclasses").bootstrapTable({
	    url: '/homework/admin/classes/my',
	    method: 'get',
	    striped:'true',
	    detailView: true,//父子表
	    pagination:true,
	    search:true,
	    pageSize: 20,
        pageList: [20,30,40],	    
	    columns: [{
	        field: 'classId',
	        title: 'ID',
	        width: '10%',
	        align: 'center'

	    }, {
	        field: 'classImg',
	        title: '图片',
	        width: '20%',
	        align: 'center'
	    },{
	      field:'className',
	      title:'描述',
	      width: '30%',
	      align: 'center'
	    },{
    	  field:'beginDate',
	      title:'开始时间',
	      width: '25%',
	      align: 'center',
	      formatter:function(value){
          	return formatDate(value);
          }
	    },{
	      field:'',
	      title:'操作',
	      align: 'center',
	      width: '20%',
	      formatter:function(value,row){
	          return [
	        	  '<a class="btn btn-default btn-sm" href="/homework/admin/classes/'+row.classId+'" >班级管理</a>'
	            ].join('');
	        }
	      
	    }],
        //注册加载子表的事件。注意下这里的三个参数！
        onExpandRow: function (index, row, $detail) {

            var parentid = row.MENU_ID;
            var cur_table = $detail.html('<table></table>').find('table');
            $(cur_table).bootstrapTable({
                url: '/homework/admin/classes/'+row.classId,
                method: 'get',
                pagination:'true',
                ajaxOptions: { strParentID: parentid },
                uniqueId: "MENU_ID",
                pageSize: 10,
                pageList: [10, 25],
                columns: [{
                    field: 'userNo',
                    title: '学号',
                    align:'center',
                    width: '5%'
                }, {
                    field: 'userName',
                    title: '姓名',
                    align:'center',
                    width: '25%'
                },{
                	
                }],
               

            });

        }	     
  })
})
function formatDate(time){
  	var JsonDateValue = new Date(time);

  	var text = JsonDateValue.getFullYear()+"-"+MonthAddOne(JsonDateValue.getMonth())+"-"
  			  +JsonDateValue.getDate();
  	return text;		  
}
function MonthAddOne(month){
	return month+Number(1);
}
</script>
</body>
</html>