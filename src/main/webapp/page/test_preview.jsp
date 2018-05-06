<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/homework/style/bootstrap.css" rel="stylesheet">
<link href="/homework/style/square/_all.css" rel="stylesheet">
<style type="text/css">
     .div_question
     {
         border:2px solid  white;
         padding:4px;
         clear:both;
         margin:2px auto 10px;
         width:96%;
         height:auto;
         background: white
     }
     .req{
         color: red;
         font-weight: bold;
     }
     .div_topic{
         font-weight: bold;
         font-size: 16px;
     }
     .div_topic_question{
         clear:both;
         padding-top:5px;
         padding-left:24px;
         padding-bottom:2px;
         border-bottom:1px solid #EFEFEF;
         font-size:15px;
         color:#333333;
         _padding-left:27px;
         margin-top: 5px;
     }
     .question{
         list-style-type:none;
         padding-left: 10px;
     }
     .question li{
         margin-top: 3px;
     }
 </style>
</head>
<body style="background: #F5F6F7">
<div style="width: 800px;margin-left: auto;margin-right: auto;" id="testApp">
	<h2>{{test.name}}</h2>
    <div class="div_question" v-for ="(value, index) in exeList">
    	
        <div class="div_topic">
        	<div style="float: left;width: 28px;">
        	{{index+1}}、
        	</div>
        	<div style="width:720px;overflow: hidden;zoom: 1">
        	{{value.title}}<span class="req">&nbsp;*</span><span >&nbsp;[多选题]</span>
        	</div>
        </div>
        <div class="div_topic_question">
            <ul  class="question">
                <li v-if="value.type==0" v-for ="(val,key,ind) in value.option">
                    <input type="radio" v-model="value.answer" v-bind:value="key" v-bind:name="'answer'+value.id">
                    <span style="margin-left: 10px;font-size: 15px;">{{String.fromCharCode(ind+65)}}: {{val}}</span>
                </li>
            </ul>
        </div>
    </div>
</div>

<script src="/homework/js/jquery.js"></script> <!-- jQuery -->
<script src="/homework/js/icheck.min.js"></script>
<script src="/homework/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="/homework/js/vue.min.js"></script>
<script type="text/javascript" src='https://cdn.jsdelivr.net/vue.resource/1.0.3/vue-resource.min.js'></script>
<script>
	var vm=new Vue({
	    el: '#testApp',
	    data: {
	        test:{},
	        exeList:[]
	    },	   
	    created: function(){
	    	console.log(1) 
	        this.getExe()       //定义方法
	        console.log(2) 
	    },
	    methods:{	       
	        getExe: function(){	        	 
	            var that = this;    	   
	            that.$http({      //调用接口	   
	              method:'GET',	   
	              url:window.location.href+'/getExe' //this指data	   
	            }).then(function(response){ //接口返回数据
	            	this.test=response.data.test;
	                var list=response.data.list;
	            	for(var i=0;i<list.length;i++){
	            		var option = list[i].option;
	           		 	list[i].option=eval('(' + option + ')');
	            	}
	            	
	               this.exeList=list;    
	               this.$nextTick(function(){
	            	   $(":radio").iCheck({
		   	                checkboxClass: 'icheckbox_square-blue',
		   	                radioClass: 'iradio_square-blue',
		   	                increaseArea: '20%' // optional
	   	            	}) 
	   	            	$(":radio").iCheck('disable');
					});
	   
	            },function(error){
	   
	            })
	   
	          }
	    }
	
	})

    $(function(){
    	
        
    })
</script>
</body>
</html>