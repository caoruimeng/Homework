<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css">
		.demo{
			height: 1000px;
			background: #fff;
			padding: 2em 0;
		}
		a:hover,a:focus{
		    outline: none;
		    text-decoration: none;
		}
		.tab{ text-align: center; }
		.tab .nav-tabs{
		    display: inline-block;
		    position: relative;
		    border-bottom: none;
		}
		.tab .nav-tabs li{
		    margin: 0;
		}
		.tab .nav-tabs li a{
		    display: block;
		    padding: 0px 20px 10px;
		    background: #fff;
		    font-size: 17px;
		    font-weight: 700;
		    color: #999;
		    text-transform: uppercase;
		    text-align: center;
		    border-radius: 0;
		    border: none;
		    border-bottom: 2px solid #fff;
		    margin-right: 0;
		    overflow: hidden;
		    z-index: 1;
		    position: relative;
		    transition: all 0.3s ease 0s;
		}
		.tab .nav-tabs li.active a,
		.tab .nav-tabs li a:hover{
		    color: #999;
		    border: none;
		    border-bottom: 2px solid #fff;
		}
		.tab .nav-tabs li.active a{
		    border-bottom: 2px solid #29335c;
		}
		.tab .tab-content{
		    padding: 20px;
		    font-size: 15px;
		    color: #757575;
		    line-height: 26px;
		    text-align: left;
		    border-top: 1px solid #e5e5e5;
		}
		.tab .tab-content h3{
		    font-size: 24px;
		    margin-top: 0;
		}
		.tWidth{
			width:50%;
			text-overflow:ellipsis;
			overflow:hidden;
			white-space:nowrap;
		}
	</style>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="mainbar">   
	<div class="page-head">
	  <h2 class="pull-left"><i class="icon-bar-chart"></i> 班级管理</h2>
	   	<div class="clearfix"></div>
	</div>
	<div class="matter">		
		<div class="row" style="margin-left: 10px;margin-right: 20px;">
			<div class="demo">
				<div class="container">
					<div class="row">
					
						<div class="tab" role="tabpanel">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#Section1" aria-controls="home" role="tab" data-toggle="tab">试卷管理</a></li>
								<li role="presentation"><a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab"> 作业管理</a></li>
								<li role="presentation"><a href="#Section3" aria-controls="messages" role="tab" data-toggle="tab"> 考试管理</a></li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content tabs">
								<div role="tabpanel" class="tab-pane fade in active" id="Section1">
									<div id="testbar" style="margin-left: 30px;">
										<button type="button" onclick="openModal()" class="btn btn-primary btn-lg" data-toggle="modal">
										 新增试卷
										</button>
							   		</div>
									<table id="testTable"></table>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="Section2">		
									<div id="hwbar" style="margin-left: 30px;">
										<button type="button" onclick="openHwModal()" class="btn btn-primary btn-lg" data-toggle="modal">
										 发布作业
										</button>
									</div>
									<table id="hwTable"></table>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="Section3">
									<h3>考试管理</h3>
								</div>
						    </div>
						</div>
					</div>
				</div>
			</div>
	     </div>
	 </div>
</div>

<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
    	
    	<div class="modal-body">
    		<div class="row">
    		  
    			<div class="col-md-8">
    				<input type="text" class="form-control" id="testName" placeholder="试卷描述"> 
    			</div>
    			<div class="col-md-4">
    				<button type="button" class="btn btn-primary btn-lg btn-block" onclick="addtest()">确定</button>
    			</div>		
    		</div>
    	</div>
    </div>
  </div>
</div>

<div class="modal fade bs-example-modal-lg" id="exeModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    	<div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">题目预览</h4>
        </div>
    	<div class="modal-body">
    		<div class="row" >
    			<input type="hidden" id="testId">
    			<div id="toolbar">
    				<button class="btn btn-primary" onclick="getRow()">添加</button>
    			</div>
    			<table id="exe_table" style="width: 100%"></table>	
    		</div>
    	</div>
    </div>
  </div>
</div>

<div class="modal fade bs-example-modal-lg" id="hwModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    	<div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">发布作业</h4>
        </div>
    	<div class="modal-body">
    		<div class="row" >
    			   <form id="hwForm">
                      <div class="form-group col-md-6">
                          <label for="exampleInputEmail1">作业名称</label>
                          <input type="text" name="hwTitle" class="form-control" id="exampleInputEmail1" placeholder="作业名称">
                      </div>

                      <div class="form-group col-md-6">
                      	  <label for="endDate">截止日期</label>
                          <input type="text" class="form-control" name="date"  id="endDate">
                      </div>
                      
                      <div class="form-group  col-md-6">
                          <label for="testId">试卷</label>
                          <select class="form-control" id="testSelectId" name="testId" > 
	                      </select>
                      </div>
                      <div class="form-group  col-md-6">
                          <label for="secId">章节</label>
                          <select class="form-control" id="secId" name="secId" > 
	                      </select>
                      </div>
                  </form>

    		</div>
    	</div>
    	<div class="modal-footer">
        	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        	<button type="button" class="btn btn-primary" onclick="addHW()">发布</button>
        </div>
    </div>
  </div>
</div>
<!-- JS -->
<script src="/homework/js/jquery.js"></script> <!-- jQuery -->
<script src="/homework/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="/homework/js/bootstrap-table.min.js"></script>
<script src="/homework/js/bootstrap-table-zh-CN.min.js"></script>
<script src="/homework/laydate/laydate.js"></script>
<script type="text/javascript">
laydate.render({
    elem: '#endDate' //指定元素
});

function addHW(){
	var classId=${classId}
	var data=$("#hwForm").serializeArray()
	data.push({name:'classId',value:classId})
	console.log(data)
	$.post('/homework/admin/classes/addHW',data,function(data){
		if(data.status==200){
			$("#hwModal").modal("hide");
			
		}
	})
}

function getRow(){
    var list = $("#exe_table").bootstrapTable('getSelections', function (row) {
        return row.id;
    });
    var testId=$("#testId").val();
    var ids=[]
    for(var i=0;i<list.length;i++){
    	ids.push(list[i].id)
    }
    console.log(ids)
    $.post('/homework/admin/classes/addTestExe',{'testId':testId,'idList':ids},function(data){
    	if(data.status==200){
    		$("#exeModal").modal("hide");
    	}
    })
}
$(function(){
	
	
	$("#exe_table").bootstrapTable({
		url: '/homework/admin/repertory/getExe/'+${classId},
        method: 'get',
        striped: 'true',
        pagination: true,
        data:[],
        search: true,
        pageSize: 20,
        pageList: [20, 30, 40],
        toolbar:'#toolbar',
        clickToSelect: true,
        columns: [{
        	checkbox:'true'
        },{
            field: 'id',
            title: 'ID',
            align:'center',
            width: '5%'
        }, {
            field: 'title',
            title: '题目',
            align:'center'
        },{
            field: 'type',
            title: '类型',
            align:'center',
            width: '10%',
            formatter:function(value, row){
                var type
                console.log(row.type)
                switch(row.type){
                    case 0:
                        type='选择题'
                        break
                    case 1:
                        type='判断题'
                        break
                    case 2:
                        type='简答题'
                        break
                }
                return type
            }
        }, {
            field: 'grade',
            title: '难度',
            align:'center',
            width: '10%'
        },{
            field: '',
            title: '操作',
            align: 'center',
            width: '20%',
            formatter:function(value, row){
                var $row = JSON.stringify(row).replace(/\"/g,"'")
                return [
                    '<button type="button" class="btn btn-primary" data-toggle="modal" onclick="preview('+$row+')">预览</button>'
                ].join('');
            }
        }]
    });
	$("#hwTable").bootstrapTable({
		url:'/homework/admin/classes/getHw/'+${classId},
		method:'get',
		detailView: true,//父子表
        pagination: true,
        data:[],
        search: true,
        pageSize: 20,
        pageList: [20, 30, 40],
        toolbar:'#hwbar',
        columns: [{
            field: 'hwId',
            title: 'ID',
            width: '10%',
            align: 'center'

        }, {
            field: 'hwTitle',
            title: '科目名称',
            width: '20%',
            align: 'center',
        }, {
            field: 'endDate',
            title: '截止时间',
            align: 'center',
            width: '20%',
            formatter:function(value){
              	return formatDate(value);
            }
        }, {
            field: 'testName',
            title: '试卷',
            align: 'center',
            width: '20%',
        },{
            field: 'sectionName',
            title: '章节',
            align: 'center',
            width: '20%',
        },{
        	field: '',
            title: '操作',
            align: 'center',
            width: '10%',
            formatter: function (value, row) {
                return [
                    '<a href="/homework/admin/classes/test/'+row.testId+'" class="btn btn-primary">预览</a>'
                ].join('');
            }
        }]
	})
	
	$("#testTable").bootstrapTable({
        url:'/homework/admin/classes/getTest/'+${classId},
        method: 'get',
        striped: 'true',
        detailView: true,//父子表
        pagination: true,
        data:[],
        search: true,
        pageSize: 20,
        pageList: [20, 30, 40],
        toolbar:'#testbar',
        columns: [{
            field: 'id',
            title: 'ID',
            width: '20%',
            align: 'center'

        }, {
            field: 'name',
            title: '科目名称',
            width: '60%',
            align: 'center',
            class:'tWidth'
        }, {
            field: '',
            title: '操作',
            align: 'center',
            width: '20%',
            formatter: function (value, row) {
                return [
                    '<button type="button" class="btn btn-primary" data-toggle="modal" onclick="openTable('+row.id+')">添加习题</button>'
                ].join('');
            }
        }],
        //注册加载子表的事件。注意下这里的三个参数！
        onExpandRow: function (index, row, $detail) {

            var parentid = row.MENU_ID;
            var cur_table = $detail.html('<table style="table-layout:fixed"></table>').find('table');
            $(cur_table).bootstrapTable({
                url: '/homework/admin/classes/getTestExe/'+row.id,
                method: 'get',
                pagination:'true',
                ajaxOptions: { strParentID: parentid },
                uniqueId: "MENU_ID",
                pageSize: 10,
                pageList: [10, 25],
                columns: [{
                    field: 'id',
                    title: 'ID',
                    align:'center',
                    width: '5%'
                }, {
                    field: 'title',
                    title: '题目',
                    align:'center',
                    class:'tWidth'
                },{
                    field: 'type',
                    title: '类型',
                    align:'center',
                    width: '10%',
                    formatter:function(value, row){
                        var type
                        console.log(row.type)
                        switch(row.type){
                            case 0:
                                type='选择题'
                                break
                            case 1:
                                type='判断题'
                                break
                            case 2:
                                type='简答题'
                                break
                        }
                        return type
                    }
                }, {
                    field: 'grade',
                    title: '难度',
                    align:'center',
                    width: '10%'
                },{
                    field: '',
                    title: '操作',
                    align: 'center',
                    width: '20%',
                    formatter:function(value, row){
                        var $row = JSON.stringify(row).replace(/\"/g,"'")
                        return [
                            '<button type="button" class="btn btn-primary" data-toggle="modal" onclick="preview('+$row+')">预览</button>'
                        ].join('');
                    }
                }]
            });

        }
    })
    $.get('/homework/admin/subject/getSectionByClassId/'+${classId},function(data){
    	for(var i=0;i<data.length;i++){
    		$("#secId").append('<option value="'+data[i].secId+'">'+data[i].secName+'</option>')
    	}
    })
    $.get('/homework/admin/classes/getTest/'+${classId},function(data){
    	for(var i=0;i<data.length;i++){
    		$("#testSelectId").append('<option value="'+data[i].id+'">'+data[i].name+'</option>')
    	}
    })
    
})

function openModal(){
	$("#myModal").modal("show");
}
function addtest(){
	var testName=$("#testName").val();
	var classId=${classId}
	var data={"name":testName,"classId":classId};
	$.post('/homework/admin/classes/addTest',data,function(data){
		if(data.status==200){
			$("#myModal").modal("hide");
			alert("添加成功")
		}else{
			alert("添加失败")
		}
	})
}

function openTable(id){
	console.log(id)
	$("#testId").val(id);
	$("#exeModal").modal("show");
}

function openHwModal(){
	$("#hwModal").modal("show");
}
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