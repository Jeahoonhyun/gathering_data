/**
*
*	레이더차트 api
*
*/

var plus_values = [];
var plus_valueField=[];
var minus_values = [];
var minus_valueField=[];
var sigun_values =  [];
var sigun_valueField=[];
var selectIemvalues = [];
var selectSigunvalues = [];




$(function(){
	
	
	//셀렉트박스 선택시 메뉴 드롭다운
	$(document).on('click touchstart', '.fs-label', function() {
		var $wrap = $(this).closest('.fs-wrap');
		$wrap.find('.fs-dropdown').toggleClass('hidden');
   
	});
	//	셀렉트박스 선택시 메뉴 드롭다운
	$(document).on('click touchstart', '.fs-arrow', function() {
	      
	    var $wrap = $(this).closest('.fs-wrap');
	    $wrap.find('.fs-dropdown').toggleClass('hidden');
	});

	
	//드롭다운 메뉴 선택 시 실행
	$(document).on('click touchstart', '.fs-option', function() {
	
	  var dataset = {};
	  var $this = this;
	  var $wrap = $(this).closest('.fs-wrap');
	  var command = "";
	  
	  
	  // Multiple select
	  if ($wrap.hasClass('multiple')) {
		  selectIemvalues=[];
	      
		  $(this).toggleClass('selected');
		  $wrap.find('.selected').each(function(index){
			  if($wrap.find('.selected').length > 5){
				  selectIemvalues[index] = $(this).text().replace(/ /g,"_");
			  }else{
				  selectIemvalues[index] = $(this).text().replace(/ /g,"_");
			  }
		  });
	      
	      if($(this).parents().attr('class') == 'fs-optgroup r1'){
	    	 dataset.year = $("#pm_year").val();
	    	 dataset.divId = $("#mrrg_plus_chart").attr('id');
	    	 dataset.selectChart = "mp";
	    	 dataset.selectIemValue = selectIemvalues; 
	    	 
	    	 if(selectIemvalues.length > 0 ){
	    		 updateRadarChart(dataset);
	    		 
	    	 }else if(selectIemvalues.length  == 0){
	    		 plus_valueField = [];
	    	 }
	      }else if($(this).parents().attr('class') == 'fs-optgroup r2'){
	    	 dataset.year = $("#pm_year").val();
	    	 dataset.divId = $("#mrrg_minus_chart").attr('id');
	    	 dataset.selectChart = "mm";
	    	 dataset.selectIemValue = selectIemvalues; 
	    	 
	    	 if(selectIemvalues.length > 0 ){
	    		 updateRadarChart(dataset);
	    	 }else if(selectIemvalues.length  == 0){
	    		 minus_valueField = [];
	    	 }
	    	  
	      }else if($(this).parents().attr('class') == 'fs-optgroup r3'){
	    	  dataset.year = $("#cty_pm_year").val();
	    	  dataset.divId = $("#cty_plus_chart").attr('id');
	    	  dataset.selectChart = "cp";
	    	  dataset.selectIemValue = selectIemvalues; 
	    	 
	    	  if(selectIemvalues.length > 0 ){
	    		  updateRadarChart(dataset);
	    		 
	    	  }else if(selectIemvalues.length  == 0){
	    		  plus_valueField = [];
	    	  }
	      }else if($(this).parents().attr('class') == 'fs-optgroup r4'){
	    	  dataset.year = $("#cty_pm_year").val();
	    	  dataset.divId = $("#cty_minus_chart").attr('id');
	    	  dataset.selectChart = "cm";
	    	  dataset.selectIemValue = selectIemvalues; 
	    	 
	    	  if(selectIemvalues.length > 0 ){
	    		  updateRadarChart(dataset);
	    	  }else if(selectIemvalues.length  == 0){
	    		  minus_valueField = [];
	    	  }
	      }else if($(this).parents().attr('class') == 'fs-optgroup mr_sigun'){
	    	  dataset.year = $("#pm_year").val();
	    	  dataset.divId = $("#mrrg_sigun_chart").attr('id');
	    	  dataset.selectChart = "mr_sigun";
	    	  dataset.selectIemValue = selectIemvalues; 
	    	 
	    	  if(selectIemvalues.length > 0 ){
	    		  updateRadarChart(dataset);
	    	  }else if(selectIemvalues.length  == 0){
	    		  sigun_valueField = [];
	    	  }
	    	  
	    	  
	      }else if($(this).parents().attr('class') == 'fs-optgroup cty_sigun'){
	    	  dataset.year = $("#cty_pm_year").val();
	    	  dataset.divId = $("#cty_sigun_chart").attr('id');
	    	  dataset.selectChart = "cty_sigun";
	    	  dataset.selectIemValue = selectIemvalues; 
	    	 
	    	  if(selectIemvalues.length > 0 ){
	    		  updateRadarChart(dataset);
	    	  }else if(selectIemvalues.length  == 0){
	    		  sigun_valueField = [];
	    	  }
	      }
	  }
	});
	
	
	// 시군별 출산혼인 년도 선택 시 차트 변경 
	$("#pm_year").on("change",function(){
		makeMrrgChart();
	});

	// 시군별 도시특성 년도 선택 시 차트 변경
	$("#cty_pm_year").on("change",function(){
		makeCtyChart();
	});

	
	// 시군내 출산혼인 시군 선택 시 차트 변경
	$("#sigun_select").on("change",function(){
		createRadarChart("mrrg");
	});
 
	// 시군내 출산혼인 년도 선택 시 차트 변경
 	$("#sigun_year").on("change",function(){
		createRadarChart("mrrg");
	});
 	
 	// 시군내 도시특성 시군 선택 시 차트 변경
	$("#cty_sigun_select").on("change",function(){
		createRadarChart("cty");
	});
 
	// 시군내 도시특성 년도 선택 시 차트 변경
 	$("#cty_sigun_year").on("change",function(){
		createRadarChart("cty");
	});
	
	
});

//출산율 출산혼인 상관분석 radar 차트 생성
function makeMrrgChart(){
	
	var year = $("#pm_year").val();
	var plusDiv = $("#mrrg_plus_chart").attr('id');
	var minusDiv = $("#mrrg_minus_chart").attr('id');
	var selectboxId = "";
	
	$.ajax({
		url: '/ppa/ppa/viz/pop/MrrgPlusChart.do',
		data:year,
		contentType: "application/json",
		type: 'POST',
		async: false,
	    success: function(data){
	    	if(data != ""){
	    		$("#"+plusDiv+"").show();
	    		$("#"+minusDiv+"").show();
	    		//selectboxId = $("#radar1_selectBox").attr("id");
	    		selectboxId = $('.fs-optgroup.r1').attr('class');
	    		makeRadarChart(plusDiv,data,selectboxId);
	    	}else{
	    		$("#"+plusDiv+"").hide();
	    		$("#"+minusDiv+"").hide();
	    	}
	    }
	});

	$.ajax({
		url: '/ppa/ppa/viz/pop/MrrgMinusChart.do',
		contentType: "application/json",
		data:year,
		type: 'POST',
		async: false,
	    success: function(data){
	    	if(data != ""){
	    		$("#"+plusDiv+"").show();
	    		$("#"+minusDiv+"").show();
//	    		selectboxId = $("#radar2_selectBox").attr("id");
	    		selectboxId = $('.fs-optgroup.r2').attr('class');
	    		makeRadarChart(minusDiv,data,selectboxId);
	    	}else{
	    		$("#"+plusDiv+"").hide();
	    		$("#"+minusDiv+"").hide();
	    	}
	    }
	});
}


//출산혼인 도시프로파일 radar 차트 생성
function makeCtyChart(){
	
	var selectboxId = "";
	var year = $("#cty_pm_year").val();
	var plusDiv = $("#cty_plus_chart").attr('id');
	var minusDiv = $("#cty_minus_chart").attr('id');
	
	$.ajax({
		url: '/ppa/ppa/viz/pop/CtyPlusChart.do',
		data:year,
		contentType: "application/json",
		type: 'POST',
		async: false,
	    success: function(data){
	    	if(data != ""){
	    		$("#"+plusDiv+"").show();
	    		$("#"+minusDiv+"").show();
	    		selectboxId = $('.fs-optgroup.r3').attr('class');
	    		makeRadarChart(plusDiv,data,selectboxId);
	    	}else{
	    		$("#"+plusDiv+"").hide();
	    		$("#"+minusDiv+"").hide();
	    	}
	    }
	});

	$.ajax({
		url: '/ppa/ppa/viz/pop/CtyMinusChart.do',
		contentType: "application/json",
		data:year,
		type: 'POST',
		async: false,
	    success: function(data){
	    	if(data != ""){
	    		$("#"+plusDiv+"").show();
	    		$("#"+minusDiv+"").show();
	    		selectboxId = $('.fs-optgroup.r4').attr('class');
	    		makeRadarChart(minusDiv,data,selectboxId);
	    	}else{
	    		$("#"+plusDiv+"").hide();
	    		$("#"+minusDiv+"").hide();
	    	}
	    }
	});
}


//시군 리스트 출력
function getSigunList(check){
	
	var selectboxId ="";
	
	if(check == "mrrg"){
		selectboxId = ".fs-optgroup.mr_sigun";
	}else if(check == "cty"){
		selectboxId = ".fs-optgroup.cty_sigun";
	}
	
	
	$.ajax({
		url: '/ppa/ppa/viz/pop/sigunList.do',
		type: 'GET',
		async: false,
	    success: function(data){
	    	
	    	var html = "";
	    	$.each(data,function(index,value){
	    		//5개 항목 선택하여 생성
	    		if(index < 5){
	    			html+="<div class='fs-option selected' data-value='"+value.sigunNM+"'>"
						+"<span class='fs-checkbox'><i></i></span>"
						+"<div class='fs-option-label'>"+value.sigunNM+"</div>"
						+"</div>";
	    		}else{
	    			html+="<div class='fs-option' data-value='"+value.sigunNM+"'>"
						+"<span class='fs-checkbox'><i></i></span>"
						+"<div class='fs-option-label'>"+value.sigunNM+"</div>"
						+"</div>";
	    		}
	    	});
	    	$(selectboxId).append(html);
	    }
	});
}

// 년도 조회
function getYearList(check){
	var command = "/ppa/ppa/viz/pop/yearList.do";
	var divId = "";
	
	
	if(check == 'mrrg'){
		divId = ["#pm_year","#mr_sigun_year"];
		$(divId[0]).html("");
    	$(divId[1]).html("");
	}else if(check == 'cty'){
		divId = ["#cty_pm_year","#cty_sigun_year"];
		$(divId[0]).html("");
    	$(divId[1]).html("");
	}
	
	$.ajax({
		url: command,
		data: JSON.stringify({selectYear:check}),
		contentType: "application/json; charset=UTF-8",  
		type: 'POST',
		async: false,
	    success: function(data){
	    	console.log(data);
	    	
	    	var html = "";
	    	$.each(data,function(index,value){
	    			html+="<option value='"+value+"'>"+value+"</option>"
	    	});
	    	$(divId[0]).append(html);
	    	$(divId[1]).append(html);
	    
	    	
	    
	    }
	});
	
	
	
	
}

//시군내 차트 생성
function createRadarChart(check){
	
	var command = "";
	var divId = "";
	var selectedValue = "";
	var sigun_year= "";
	var sId = "";
	
	if(check == "mrrg"){  	//시군내 출산혼인 연관성분석
		command = '/ppa/ppa/viz/pop/getMrrgRadarCharBySigun.do';
		divId = $("#mrrg_sigun_chart").attr('id');
		sid = $('.fs-optgroup.mr_sigun').attr('class');
		sigun_year= $("#mr_sigun_year option:selected").val();
	}else if(check == "cty"){ 	//시군내 도시특성 연관성분석
		command = '/ppa/ppa/viz/pop/getCtyRadarCharBySigun.do'
		divId = $("#cty_sigun_chart").attr('id');
		sid = $('.fs-optgroup.cty_sigun').attr('class');
		sigun_year= $("#cty_sigun_year option:selected").val();
	}
	
	
	$.ajax({
		url: command,
		data: JSON.stringify({year:sigun_year}),
		contentType: "application/json; charset=UTF-8",  
		type: 'POST',
		async: false,
	    success: function(data){
	    	if(data != ""){
	    		$("#"+divId+"").show();
	    		setGraphvalueField(data[0],3,sId);
	    		makeRadarChart(divId,data);
	    	}else{
	    		$("#"+divId+"").hide();
	    	}
	    }
	});
};


//시군별 차트 생성
function makeRadarChart(id,data,selectboxId){
	
	var sId = selectboxId;
	var divId = id;
	var dataset = data;
	var valueField = "";
	var guides = "";
	var title = {"text":""};
	
	if(data == ""){
		dataset = [];
	}
	
	
	if(id=='mrrg_plus_chart'){
		setGraphvalueField(dataset[0],1,sId);
		valueField = plus_valueField;
		title.text = "출산율과 (+)연관성 대표항목";
	}else if(id=='mrrg_minus_chart'){
		setGraphvalueField(dataset[0],2,sId);
		valueField = minus_valueField;
		title.text = "출산율과 (-)연관성 대표항목";
	}else if(id=='mrrg_sigun_chart'){
		setGraphvalueField(dataset[0],3);
		valueField = sigun_valueField;
		title.text = "시군내 출산혼인 연관성 분석";
	}else if(id=='cty_plus_chart'){
		setGraphvalueField(dataset[0],1,sId);
		valueField = plus_valueField;
		title.text = "출산율과 (+)연관성 도시PROFILE";
	}else if(id=='cty_minus_chart'){
		setGraphvalueField(dataset[0],2,sId);
		valueField = minus_valueField;
		title.text = "출산율과 (-)연관성 도시PROFILE";
	}else if(id=='cty_sigun_chart'){
		setGraphvalueField(dataset[0],3);
		valueField = sigun_valueField;
		title.text = "시군내 도시특성 연관성 분석";
	}
	
	var chart = AmCharts.makeChart(divId, {
		"type" : "radar",
		"titles": [title],
		"legend" : {
			"useGraphSettings" : false,
			"align" : "center",
			
		},
		"includeInMinMax":false,
		"dataProvider":dataset,
		"guides":guides,
		"valueAxes" :[{
			"gridType": "circles",
			"axisAlpha": 0.2,
			"lineThickness":2,
		}],
		"graphs" :valueField,
		"categoryField" : "category",

	});
	
}

// 체크박스 선택 시 차트 업데이트
function updateRadarChart(dataset){
	
	
	$.ajax({
		 url: '/ppa/ppa/viz/pop/upateRadarChart.do',
		 data:JSON.stringify({selectIemValue:dataset.selectIemValue,year:dataset.year,selectChart:dataset.selectChart}),
		 contentType: "application/json",
		 type: 'POST',
		 async: false,
		 success: function(data){
			 if(dataset.selectChart == 'mp' || dataset.selectChart == 'cp'){
				plus_valueField = [];
			}else if(dataset.selectChart == 'mm' || dataset.selectChart == 'cm'){
				minus_valueField = [];
			}else if(dataset.selectChart == 'mr_sigun' || dataset.selectChart == 'cty_sigun'){
				sigun_valueField = [];
			}
			 
			 makeRadarChart(dataset.divId,data,"");
		 }
	 });
} 


// 셀렉트박스 메뉴 생성 
function setSelectBox(check,selectboxId){
	if(check==1){
		if(selectboxId == "fs-optgroup r1"){
			$(".fs-optgroup.r1").html("");
			for(var i=0; i< plus_values.length; i++){
				if( i < 5){
					$(".fs-optgroup.r1").append("<div class='fs-option selected' data-value='"+plus_values[i]+"'>"
							+"<span class='fs-checkbox'><i></i></span>"
							+"<div class='fs-option-label'>"+plus_values[i].replace(/_/g,' ')+"</div>"
							+"</div>");
				}else if( i > 5 && i < plus_values.length){
					$(".fs-optgroup.r1").append("<div class='fs-option' data-value='"+plus_values[i]+"'>"
							+"<span class='fs-checkbox'><i></i></span>"
							+"<div class='fs-option-label'>"+plus_values[i].replace(/_/g,' ')+"</div>"
							+"</div>");
				}
			}
			
			
			
		}else if(selectboxId == "fs-optgroup r3"){
			$(".fs-optgroup.r3").html("");
			for(var i=0; i< plus_values.length; i++){
				if(i<5){
					$(".fs-optgroup.r3").append("<div class='fs-option selected' data-value='"+plus_values[i]+"'>"
			                +"<div class='fs-option-label'>"+plus_values[i].replace(/_/g,' ')+"</div>"
			                +"<span class='fs-checkbox'><i></i></span>"
			                +"</div>");
				}else if( i > 5 && i < plus_values.length){
					$(".fs-optgroup.r3").append("<div class='fs-option' data-value='"+plus_values[i]+"'>"
			                +"<div class='fs-option-label'>"+plus_values[i].replace(/_/g,' ')+"</div>"
			                +"<span class='fs-checkbox'><i></i></span>"
			                +"</div>");
				}
			}
		}
																						
	}else if(check ==2){
		if(selectboxId == "fs-optgroup r2"){
			$(".fs-optgroup.r2").html("");
			for(var i=0; i< minus_values.length; i++){
				if(i<5){
					$(".fs-optgroup.r2").append("<div class='fs-option selected' data-value='"+minus_values[i]+"'>"
			                +"<span class='fs-checkbox'><i></i></span>"
			                +"<div class='fs-option-label'>"+minus_values[i].replace(/_/g,' ')+"</div>"
			                +"</div>");
				}else if( i > 5 && i < minus_values.length){
					$(".fs-optgroup.r2").append("<div class='fs-option' data-value='"+minus_values[i]+"'>"
			                +"<span class='fs-checkbox'><i></i></span>"
			                +"<div class='fs-option-label'>"+minus_values[i].replace(/_/g,' ')+"</div>"
			                +"</div>");
				}
			
			}
			
		}else if(selectboxId == "fs-optgroup r4"){
			$(".fs-optgroup.r4").html("");
			for(var i=0; i< minus_values.length; i++){
				if(i<5){
					$(".fs-optgroup.r4").append("<div class='fs-option selected' data-value='"+minus_values[i]+"'>"
			                +"<div class='fs-option-label'>"+minus_values[i].replace(/_/g,' ')+"</div>"
			                +"<span class='fs-checkbox'><i></i></span>"
			                 +"</div>");
				}else if( i > 5 && i < minus_values.length){
					$(".fs-optgroup.r4").append("<div class='fs-option' data-value='"+minus_values[i]+"'>"
			                +"<div class='fs-option-label'>"+minus_values[i].replace(/_/g,' ')+"</div>"
			                +"<span class='fs-checkbox'><i></i></span>"
			                 +"</div>");
				}
				
			}
		}
	}
}

function setGraphvalueField(keyValue,check,sId){

	
	if(check == 1){
		
		var keys = Object.keys(keyValue);
		var str = "";
		var jsonStr = {};
		//항목명 가져오기
		for(var i=0; i < keys.length-1; i++){
			if(i<5){
				plus_values[i] = keys[i+1];
				str="{\"bullet\""+":"+"\"round\""+","
					+"\"balloonText\""+": \"[[category]] \n "+plus_values[i]+" : [["+plus_values[i]+"]]\","	
					+"\"valueField\""+":\""+plus_values[i]+"\","
					+"\"title\""+":\""+plus_values[i].replace(/_/g,' ')+"\"}";
				jsonStr = JSON.parse(str.replace('\n','\\r\\n'))
				plus_valueField[i] = jsonStr;
			}else{
				plus_values[i] = keys[i+1];
			}
			
		}
		if(sId != ""){
			setSelectBox(1,sId);
		}
	}else if (check == 2){
		var keys = Object.keys(keyValue);
		var str = "";
		var jsonStr = {};
		//항목명 가져오기
		for(var i=0; i < keys.length-1; i++){
			if(i<5){
				minus_values[i] = keys[i+1];
				str="{\"bullet\""+":"+"\"round\""+","
					+"\"balloonText\""+": \"[[category]] \n "+minus_values[i]+" : [["+minus_values[i]+"]]\","	
					+"\"valueField\""+":\""+minus_values[i]+"\","
					+"\"title\""+":\""+minus_values[i].replace(/_/g,' ')+"\"}";
				jsonStr = JSON.parse(str.replace('\n','\\r\\n'));
				minus_valueField[i] = jsonStr;
			}else{
				minus_values[i] = keys[i+1];
			}
		}
		
		if(sId != ""){
			setSelectBox(2,sId);
		}
		
	}else if (check == 3){
		sId = "";
		sigun_valueField = [];
		var keys = Object.keys(keyValue);
		var str = "";
		var jsonStr = {};
		//항목명 가져오기
		for(var i=0; i < keys.length-1; i++){
			if(i < 5){
				sigun_values[i] = keys[i+1];
				str="{\"bullet\""+":"+"\"round\""+","
					+"\"balloonText\""+": \"[[category]] \n "+sigun_values[i]+" : [["+sigun_values[i]+"]]\","	
					+"\"valueField\""+":\""+sigun_values[i]+"\","
					+"\"title\""+":\""+sigun_values[i].replace(/_/g,' ')+"\"}";
				jsonStr = JSON.parse(str.replace('\n','\\r\\n'));
				sigun_valueField[i] = jsonStr;
			}
			
		}
		
	}
}