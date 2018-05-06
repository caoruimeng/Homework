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
<style type="text/css">
.tWidth{
	width:50%;
	text-overflow:ellipsis;
	overflow:hidden;
	white-space:nowrap;
}
</style>
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
			<table id="repertory" ></table>
	     </div>
	 </div>
</div>


<!-- model -->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" id="repAddModel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">新增习题</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="exercisesForm">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">题目描述</label>
                        <div class="col-sm-10">
                        	<input name="subId" id="subId" type="hidden">
                            <textarea class="form-control" rows="3" id="inputEmail3" name="title"  placeholder="题目描述"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">类型</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="inputPassword3" name="type" onchange="changeType()">
                                <option value="0">选择</option>
                                <option value="1">判断</option>
                                <option value="2">简答</option>
                            </select>
                        </div>
                        <label for="inputPassword4" class="col-sm-2 control-label">难度</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="grade" id="inputPassword4">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                    </div>
                    <div id="section" class="col-sm-offset-2" >
                       <table class="table" >
                           <tr><td><input class="form-control option"   placeholder="选项A"></td></tr>
                           <tr><td><input class="form-control option"   placeholder="选项B"></td></tr>
                           <tr><td><input class="form-control option"   placeholder="选项C"></td></tr>
                           <tr><td><input class="form-control option"   placeholder="选项D"></td></tr>
                       </table>
                    </div>
                    <div class="form-group" id="sectionAnswer">
                        <label  class="col-sm-2 control-label">正确选项</label>
                        <div class="col-sm-10">
                            <div class="form-group">
                                <label class="radio-inline">
                                    <input type="radio" value="0" name="answer">A
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" value="1" name="answer">B
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" value="2" name="answer">C
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" value="3" name="answer">D
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" id="judgeAnswer">
                        <label  class="col-sm-2 control-label">正确选项</label>
                        <div class="col-sm-10">
                            <div class="form-group">
                                <label class="radio-inline">
                                    <input type="radio" value="0" name="answer">true
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" value="1" name="answer">false
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addExercises()">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- end model-->

<!-- Large modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="exePreview">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">题目预览</h4>
            </div>
            <div class="modal-body">
                <div style="margin: 20px;">
                    <p style="font-size: 16px">{{exe.title}}</p>
                    
                    <p v-if="exe.type==0" v-for ="(value, key, index) in exe.option" style="font-size: 15px;margin-top: 5px;">
                        {{String.fromCharCode(index+65)}}: {{value}}
                    </p>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- JS -->
<script src="/homework/js/jquery.js"></script> <!-- jQuery -->
<script src="/homework/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="/homework/js/bootstrap-table.min.js"></script>
<script src="/homework/js/bootstrap-table-zh-CN.min.js"></script>
<script src="/homework/js/vue.min.js"></script>

<!-- Script for this page -->
<script type="text/javascript">
var vm=new Vue({
    el: '#exePreview',
    data: {
        exe:{}
    }
})
$(function(){
    $("#judgeAnswer").hide();
    $("#repertory").bootstrapTable({
        url:'/homework/admin/subject/all',
        method: 'get',
        striped: 'true',
        detailView: true,//父子表
        pagination: true,
        search: true,
        pageSize: 20,
        pageList: [20, 30, 40],
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
        }, {
            field: 'subNo',
            title: '科目编号',
            width: '25%',
            align: 'center'
        }, {
            field: 'subImg',
            title: '图片',
            width: '25%',
            align: 'center',
            formatter:function (value,row){
                return [
                    '<img src="/homework/img/photos/s1.jpg" style="width: 100px;">'
                ].join('');
            }
        }, {
            field: '',
            title: '操作',
            align: 'center',
            width: '20%',
            formatter: function (value, row) {
                return [
                    '<button type="button" class="btn btn-primary" data-toggle="modal" onclick="openTable('+row.subId+')">添加习题</button>'
                ].join('');
            }
        }],
        //注册加载子表的事件。注意下这里的三个参数！
        onExpandRow: function (index, row, $detail) {

            var parentid = row.MENU_ID;
            var cur_table = $detail.html('<table style="table-layout:fixed"></table>').find('table');
            $(cur_table).bootstrapTable({
                url: '/homework/admin/repertory/'+row.subId,
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
})

function openTable(id){
    console.log(id)
    $("#subId").val(id)
    $("#repAddModel").modal("show");
}

function changeType(){
    var type=$("#inputPassword3").val();
    switch (type){
        case '0':
            $("#section").show();
            $("#sectionAnswer").show();
            $("#judgeAnswer").hide();
            break;
        case '1':
            $("#section").hide();
            $("#sectionAnswer").hide();
            $("#judgeAnswer").show();
            break;
        default:
            $("#section").hide();
            $("#sectionAnswer").hide();
            $("#judgeAnswer").hide();
            break;
    }
}

function addExercises(){
	var data=$("#exercisesForm").serializeArray()
	var type = $("#inputPassword3").val()
	if(type === '0'){
		var option={}
		$("input.option").each(function(index,element){
			option[index]=$(this).val()
		})
		var op=JSON.stringify(option)
		data.push({'name':'option','value':op})
	}
	$.post('/homework/admin/repertory/add',data,function(data){
		if(data.status==200){
			alert("添加成功")
			$("#repAddModel").modal("hide");
		}else{
			alert(data.msg)
		}
	})
}
function preview(data){
    console.log(data)
    var json = eval('(' + data.option + ')');
    data.option=json
    vm.exe=data
    $("#exePreview").modal("show")
}


</script>
</body>
</html>