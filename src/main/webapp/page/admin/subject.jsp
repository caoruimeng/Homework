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
	  <h2 class="pull-left"><i class="icon-bar-chart"></i> 科目管理</h2>
	   	<div class="clearfix"></div>
	</div>
	<div class="matter">
		
		<div class="row" style="margin-left: 10px;margin-right: 20px;">
	   		<div style="margin-left: 30px;">
				<button type="button" onclick="openModal()" class="btn btn-primary btn-lg" data-toggle="modal">
				 新增科目
				</button>
				
	   		</div>
			<table id="sub_table">
			</table>
	     </div>
	 </div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">科目管理</h4>
      </div>
      <div class="modal-body" id="app">
      	<div class="row" style="margin-left: 10px;margin-right: 10px;">
        	<form action="" id="subform" class="form-inline"   enctype="multipart/form-data">
        		<div class="row" style="margin-top: 5px;">
                  <div class="col-md-6" >
                      <label>科目名称:</label>
                      <div class="indiv">
                          <input type="text" name="subName" id="subName" class="form-control" placeholder="科目名称">
                      </div>
                  </div>
                  <div class="col-md-6" >
                      <label>科目编号:</label>
                      <div class="indiv">
                          <input type="text" name="subNo" id="subNo" class="form-control"  placeholder="科目编号">
                      </div>
                  </div>
                </div>
                
                <div  class="row" style="margin-top: 5px;"> 
                  <div class="col-md-12">
                      <label>图片:</label>
                      <div class="indiv">
                          <input type="file" name="file">
                      </div>
                  </div>
                </div>
                <div  class="row" style="margin-top: 5px;">  
                  <div class="col-md-12" >
                      <label>描述:</label>
                      <div class="indiv">
                      	  <textarea class="form-control" rows="3" id="subInfo" name="subInfo"></textarea>
                      </div>
                  </div>
                               
                </div>
                           
            </form>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="addSubject()">保存</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade bs-example-modal-sm" id="sectionModel" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
    	<div class="modal-body">
    		<div class="row">
    		  
    			<div class="col-md-8">
    				<input type="hidden" name="subId" id="subId">
    				<input type="text" class="form-control" id="secName" placeholder="章节名称"> 
    			</div>
    			<div class="col-md-4">
    				<button type="button" class="btn btn-primary btn-lg btn-block" onclick="addSection()">确定</button>
    			</div>		
    		</div>
    	</div>
    </div>
  </div>
</div>
<!-- JS -->
<script src="/homework/js/jquery.js"></script> <!-- jQuery -->
<script src="/homework/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="/homework/js/bootstrap-table.min.js"></script>
<script src="/homework/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="/homework/js/jquery.form.js"></script>
<script type="text/javascript">
$(function(){
	$("#sub_table").bootstrapTable({
	    url: '/homework/admin/subject/all',
	    method: 'get',
	    striped:'true',
	    detailView: true,//父子表
	    pagination:true,
	    search:true,
	    pageSize: 20,
        pageList: [20,30,40],	    
	    columns: [{
	        field: 'subId',
	        title: 'ID',
	        width: '10%',
	        align: 'center'

	    }, {
	        field: 'subName',
	        title: '科目名称',
	        width: '20%',
	        align: 'center'
	    },{
	      field:'subNo',
	      title:'科目编号',
	      width: '25%',
	      align: 'center'
	    },{
    	  field:'subImg',
	      title:'图片',
	      width: '25%',
	      align: 'center',
	      
	    
	    },{
	      field:'',
	      title:'操作',
	      align: 'center',
	      width: '20%',
	      formatter:function(value,row){
	          return [
	        	  
	        	  '<button class="btn btn-default btn-sm" onclick="viewSubject('+row.subId+')" >添加章节</button>'
	            ].join('');
	        }
	      
	    }],
        //注册加载子表的事件。注意下这里的三个参数！
        onExpandRow: function (index, row, $detail) {

            var parentid = row.MENU_ID;
            var cur_table = $detail.html('<table></table>').find('table');
            $(cur_table).bootstrapTable({
                url: '/homework/admin/subject/'+row.subId,
                method: 'get',
                pagination:'true',
                ajaxOptions: { strParentID: parentid },
                uniqueId: "MENU_ID",
                pageSize: 10,
                pageList: [10, 25],
                columns: [{
                    field: 'secId',
                    title: 'ID',
                    align:'center',
                    width: '5%'
                }, {
                    field: 'secName',
                    title: '标题',
                    align:'center',
                    width: '25%'
                }],
               

            });

        }	     
  })
})

function addSubject(){
	console.log("111")
 	$("#subform").ajaxSubmit({
 		url:"/homework/admin/subject/addSubject",
 		type:"post",
 		success:function(data){
 			if(data.status==200){
 				$("#sub_table").bootstrapTable("refresh",{url:"/homework/admin/subject/all"})
 				$("#myModal").modal("hide");			
 			}
 		}
 	})
}

function openModal(){
	$("#myModal").modal("show");
}
function viewSubject(subId){
	$("#subId").val(subId);
	$("#sectionModel").modal("show");
}
function addSection(){
	
	var subId=$("#subId").val();
	var secName=$("#secName").val();
	var data={"subId":subId,"secName":secName};
	console.log(subId,secName)
	$.post('/homework/admin/subject/addSection',data,function(data){
		if(data.status==200){
			$("#sectionModel").modal("hide");
			alert("添加成功")
		}else{
			alert("添加失败")
		}
	})
}
</script>
</body>
</html>