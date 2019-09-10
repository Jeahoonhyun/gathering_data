/**
 * Amchart 사용 https://www.amcharts.com/
 * 
 */

// $("#chartdiv a").hide();
// $("#chartdiv>.amcharts-main-div>.amcharts-chart-div>a").hide();


$(function(){
	
	
	
	var plus_values = [];
	var plus_valueField=[];

	var minus_values = [];
	var minus_valueField=[];
	
	
	
	$.ajax({
		url: 'http://localhost:8080/ppa/getPlusRadarChart.do',
		contentType: "application/json",
		type: 'POST',
		async: false,
	    success: function(data){
	    	setGraphvalueField(data[0],1);
	    	
	    	var chart = AmCharts.makeChart("chartdiv", {
	    		"type" : "radar",
	    		 "titles": [
	    				{
	    					"text": "출산율과 +연관성 대표항목",
	    					"size": 15
	    				}
	    			],

	    		"legend" : {
	    			"useGraphSettings" : true,
	    			"align" : "center",

	    		},
	    		"dataProvider":data,
	    		"valueAxes" :[{
	    			"gridType": "circles",
	    			"axisAlpha": 0.2,
	    			"lineThickness":2,
	    		}],
	    		"graphs" : plus_valueField,
	    		"categoryField" : "direction",

	    	});
	    	
	    	
	    	
	    }
	});
	
	
	function setSelectBox(check){
		if(check==1){
			for(var i=0; i < plus_values.length; i++){
				$("#radar1_selectBox").append("<option value='1'>"+plus_values[i]+"</option>");
			}
		}else if(check ==2){
			for(var i=0; i < minus_values.length; i++){
				$("#radar2_selectBox").append("<option value='1'>"+minus_values[i]+"</option>");
			}
		}
	}
	
	function setGraphvalueField(keyValue,check){

		if(check == 1){
			var keys = Object.keys(keyValue);
			var str = "";
			var jsonStr = {};
			//항목명 가져오기
			for(var i=0; i < keys.length-1; i++){
				plus_values[i] = keys[i];
				str="{\"bullet\""+":"+"\"round\""+","+"\"valueField\""+":\""+plus_values[i]+"\","+"\"title\""+":\""+plus_values[i]+"\"}";
				console.log(str);
				jsonStr = JSON.parse(str)
				console.log(jsonStr);
				plus_valueField[i] = jsonStr;
				
			}
			
			setSelectBox(1);
		}else if (check == 2){
			var keys = Object.keys(keyValue);
			var str = "";
			var jsonStr = {};
			//항목명 가져오기
			for(var i=0; i < keys.length-1; i++){
				minus_values[i] = keys[i];
				str="{\"bullet\""+":"+"\"round\""+","+"\"valueField\""+":\""+minus_values[i]+"\","+"\"title\""+":\""+minus_values[i]+"\"}";
				jsonStr = JSON.parse(str)
				minus_valueField[i] = jsonStr;
				
			}
			
			setSelectBox(2);
		}
	}
	
	$.ajax({
		url: 'http://localhost:8080/ppa/getMinusRadarChart.do',
		contentType: "application/json",
		type: 'POST',
		async: false,
	    success: function(data){
	    	
	    	console.log(data);
	    	setGraphvalueField(data[0],2);
	    	
	    	var chart = AmCharts.makeChart("chartdiv2", {
	    		"type" : "radar",
	    		"titles": [
    				{
    					"text": "출산율과 -연관성 대표항목",
    					"size": 15
    				}
    			],
	    		"legend" : {
	    			"useGraphSettings" : true,
	    			"align" : "center",

	    		},
	    		"dataProvider":data,
	    		"valueAxes" :[{
	    			"gridType": "circles",
	    			"axisAlpha": 0.2,
	    			"lineThickness":2,
	    		}],
	    		"graphs" : minus_valueField,
	    		"categoryField" : "direction",

	    	});
	    	
	    	
	    }
	});

})
