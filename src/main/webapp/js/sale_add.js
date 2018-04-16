$(function(){
  

  $("#date03").jeDate({
    isinitVal:true,
    //festival:true,
    ishmsVal:false,
    minDate: '2016-06-16',
    maxDate: $.nowDate({DD:0}),
    format:"YYYY-MM-DD",
    zIndex:3000,
  })
})

var stoveList=null;

function init(){
  
  
  $.get('/rmhfh/admin/stove/getStoveMap',{},function(data){
	  stoveList=data;
  })
}

function addtr(){
  var $select=$('<select class="form-control" name="stoveId" onchange=changeStove(this)><option value="-1">--请选择--</option></select>');
  $.each(stoveList,function(key,value){
    var $option=$('<option value="'+key+'">'+value.type+'--'+value.model+'</option>');
    $option.appendTo($select);
  })
  var $tr=$('<tr></tr>');
  var $td1=$('<td></td>');
  $select.appendTo($td1);
  var $td2=$('<td style="text-align: center;"><span name="price" style="font-size: 16px;">0</span></td>');
  var $td3=$('<td><input type="number" name="stoveNum" min="1" class="form-control" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,\'\');}).call(this)" placeholder="数量" onchange="changeNum(this)"></td>');
  var $td4=$('<td style="text-align: center;"><span name="total" style="font-size: 16px;">0</span></td>');
  var $td5=$('<td style="text-align: center;"><button class="btn btn-danger" onClick=getDel(this) >删除</button></td>');
  $tr.append($td1);
  $tr.append($td2);
  $tr.append($td3);
  $tr.append($td4);
  $tr.append($td5);
  $("#saletable").append($tr);
}

function changeStove(k){
  var stoveId=$(k).val();
  var $price=$(k).parent().parent().find('[name=price]'); 
  if(stoveId!=-1){
    $price.html(stoveList[stoveId].sellPrice);
  }else{
    $price.html(0);
  }
}

function setTotal(){
	var num=0;
	$("#saletable").find('[name=total]').each(function(){
		num+=Number($(this).html())
	})
	var discount=$("#discount").val();
	num-=Number(discount);
	$("#total").html("总价:"+num);
	$("#totalMoney").val(num);
}


function changeNum(p){
  var price=$(p).parent().parent().find('[name=price]').html();
  console.log(price);
  var num=$(p).val();
  var total=Number(num)*Number(price);
  $(p).parent().parent().find('[name=total]').html(total);
  setTotal();
}


function getDel(k){
    $(k).parent().parent().remove();
    setTotal();
}

function submitFrom(){
	setTotal();
	console.log($("#addsale").serializeArray());
	$.post('fahuo',$("#addsale").serializeArray(),function(data){
		
	})
}

	

