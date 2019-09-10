/**
 * 
 */
var viz;
var currentMenuNum=0;
var ctyPro = ["시군별 출산혼인 연관성 분석","시군내 출산혼인 연관성 분석","시군별 도시특성 연관성 분석","시군내 도시특성 연관성 분석"];
//var plus_values = [];
//var plus_valueField=[];
//var minus_values = [];
//var minus_valueField=[];
//도시프로파일 뷰 네임 json 배열
var pf_viewNmJson=[
                   	{
                		"viewType":"합계출산율",
                		"viewNm":"___2/__1",
                		"hideTab":true
                   	},
                   	{
                 		"viewType":"연령별출산율",
                 		"viewNm":"___2/_",
                		"hideTab":true
                    },
                    {
                   		"viewType":"지역별 전입 조회",
                   		"viewNm":"__0/_",
                 		"hideTab":true
                   	},
                   	{
                   		"viewType":"지역별 인구변화 조회",
                   		"viewNm":"___3/sheet0",
                 		"hideTab":true
                   	},
                   	{
                   		"viewType":"인구",
                   		"viewNm":"___5/_",
                 		"hideTab":false
                   	},
                   	{
                   		"viewType":"세대",
                   		"viewNm":"___7/_",
                  		"hideTab":false
                   	},
                   	{
                   		"viewType":"연앙인구",
                   		"viewNm":"___8/_",
                  		"hideTab":false
                   	},
                   	{
                   		"viewType":"출산율 출산혼인 상관분석",
                   		"viewNm":"___13/sheet0",
                  		"hideTab":true
                   	},
                   	{
                   		"viewType":"출산율 도시특성 상관분석",
                   		"viewNm":"___13/sheet1",
                  		"hideTab":true
                   	},
                   	{
                   		"viewType":"등록외국인수",
                   		"viewNm":"___9/_",
                  		"hideTab":true
                   	},
                   	{
                   		"viewType":"국민의배우자수",
                   		"viewNm":"___10/_",
                   		"hideTab":true
                   	},
                   	{
                   		"viewType":"거래건수",
                   		"viewNm":"___11/_",
                   	   "hideTab":false
                   	},
                   	{
                   		"viewType":"실거래가",
                   		"viewNm":"___12/_",
                   		"hideTab":false
                   	}
                   ];
//전입전출 뷰 네임 json 배열
var io_viewNmJson=[
                   	{
                   		"viewType":"지역별 전입 조회",
                   		"viewNm":"___4/1"
                   	}
                  ];
//인구변화 뷰 네임 json 배열
var ch_viewNmJson=[
                   	{
                   		"viewType":"지역별 조회",
                   		"viewNm":"___3/sheet0"
                   	}
                  ];
//보육사각지대 뷰 네임 json 배열
var by_viewNmJson=[
                   	{
                   		"viewType":"시군구별 조회",
                   		"viewNm":"___/__",
                   		"hideTab":true
                   	},
                   	{
                   		"viewType":"지역별 조회",
                   		"viewNm":"___/4",
                   		"hideTab":true
                   	}
                  ];
//출산사각지대 뷰 네임 json 배열
var cs_viewNmJson=[
                   	{
                   		"viewType":"시군구별 조회",
                   		"viewNm":"___1/1",
                   		"hideTab":true
                   	}
                  ];


$(function(){
	viewViz(pf_viewNmJson[0].viewType);
	
	//좌측 메뉴 클릭 이벤트
	$('#gnb ul li').click(function(e){ 
		e.preventDefault();
		$('#gnb ul li').removeClass('current');
		$(this).addClass('current');
		//좌측 메뉴 타입 결정
		currentMenuNum=$('#gnb ul li.current').index();
		//메뉴 이동시 대시보드 지우기
		clearViz();
		//메뉴에 해당하는 서브 메뉴 출력
		showSubMenu();
		showContents("tableau");
		
		//메뉴에 따른 default 대시보드 호출
		if(currentMenuNum==0){
			viewViz(pf_viewNmJson[0].viewType);
		}else if(currentMenuNum==1){
			viewViz(by_viewNmJson[0].viewType);
		}else if(currentMenuNum==2){
			viewViz(cs_viewNmJson[0].viewType);
		}
	});
	
	//서브 메뉴의 하위 항목 선택 이벤트
	$(".lnb > li > ul > li > a").click(function(e){
		e.preventDefault();
		$('.lnb > li.current > ul > li').removeClass('current');
		$(this).addClass('current');
		
		//서브 메뉴 이름 가져옴
		var subMenuNm = $(this).html();
		var isRadarMenu=false;
		
		for (var int = 0; int < ctyPro.length; int++) {
			if(ctyPro[int]==subMenuNm){
				isRadarMenu=true;
			}
		}
		
		if(isRadarMenu){
			clearViz();
			
			if(subMenuNm=="시군별 출산혼인 연관성 분석"){
				showContents("radar_1");
				getYearList("mrrg");
				makeMrrgChart();
			}else if(subMenuNm=="시군내 출산혼인 연관성 분석"){
				showContents("radar_2");
				getYearList("mrrg");
				getSigunList("mrrg");
				createRadarChart("mrrg");
			}else if(subMenuNm=="시군별 도시특성 연관성 분석"){
				showContents("radar_3");
				getYearList("cty");
				makeCtyChart();
			}else if(subMenuNm=="시군내 도시특성 연관성 분석"){
				showContents("radar_4");
				getYearList("cty");
				getSigunList("cty");
				createRadarChart("cty");
			}
		}else{
			
			if($(this).hasClass('heatmap')){
				showContents("heatmap");
			}else{
				showContents("tableau");
				//대시보드 호출하는 부분 넣으면됨
				viewViz(subMenuNm);
			}
		}
	})
});


// 1차 메뉴 클릭시 2차 메뉴의 첫 번째 항목 보여주기
function selectFirstSubMenu(obj){
	obj.parent().find("ul li").removeClass('current');
	var subMenuNm = obj.parent().find("ul li a")[0].text;
	
	if(obj.html()=='유동인구분석'){
		//히트맵
		showContents("heatmap");
		$('.heatmap').trigger('click');
	}else{
		obj.parent().find("ul li").first().addClass('current');
		//태블로
		viewViz(subMenuNm);
	}
}






//메뉴 타입 및 서브 메뉴에 따라 해당 대시보드 호출
function viewViz(subMenuNm){
	var viewNmJson;
	if(currentMenuNum==0){
		viewNmJson=pf_viewNmJson;
	}else if(currentMenuNum==1){
		viewNmJson=by_viewNmJson;
	}else if(currentMenuNum==2){
		viewNmJson=cs_viewNmJson;
	}
	
	for (var i = 0; i < viewNmJson.length; i++) {
		var array_element = viewNmJson[i].viewType;
		var viewNm = '';
		var hideTab = true;
		if(array_element==subMenuNm){
			viewNm = viewNmJson[i].viewNm;
			hideTab = viewNmJson[i].hideTab;
			initViz(viewNm,hideTab);
        }
		
	}
}


//대시보드 지우기
function clearViz(){
	viz.dispose();
}

//좌측 메뉴 클릭시 해당 서브 메뉴 출력
function showSubMenu(){
	var index = $('#gnb ul li.current').index() + 1;
	$(".submenu_div").hide();
	var subId = '#sub_'+index;
	$(subId).show();
}

//컨텐츠 영역 보이기/숨김
function showContents(type){
	var contentsId="";
	if(type=="tableau"){
		contentsId="#contents_1";
	}else if(type=="radar_1"){
		contentsId="#contents_2";
	}else if(type=="radar_2"){
		contentsId="#contents_3";
	}else if(type=="radar_3"){
		contentsId="#contents_5";
	}else if(type=="radar_4"){
		contentsId="#contents_6";
	}else if(type=="heatmap"){
		contentsId="#contents_map";
	}
	
	$(".contents_div").hide();
	$(contentsId).show();
}

//태블로 대시보드 조회
function initViz(viewNm,hideTab) {
	if(viz!=undefined){
		clearViz();
	}
	
    var containerDiv = document.getElementById("vizContainer"),
        /* url = "http://public.tableau.com/views/RegionalSampleWorkbook/Storms", */
        url = "http://211.253.139.107:8000/views/"+viewNm,
//        url = "http://211.253.139.107:8000/views/___0/_",
        options = {
            hideTabs: hideTab,
            hideToolbar: false,
            onFirstInteractive: function () {
                console.log("Run this code when the viz has finished loading.");
             	// Listen for toolbar events
                viz.addEventListener(tableau.TableauEventName.TOOLBAR_STATE_CHANGE, onToolbarStateChange);
            }
        };
    viz = new tableau.Viz(containerDiv, url, options); 
    // Create a viz object and embed it in the container div.
}

function onToolbarStateChange(toolbarEvent) {
    // when event occurs, get state and update custom buttons
    var toolbarState = toolbarEvent.getToolbarState();
    updateToolbarState(toolbarState)
}

function updateToolbarState(toolbarState) {
    $('#revertAllButton').prop('disabled', !toolbarState.isButtonEnabled(tableau.ToolbarButtonName.UNDO));
    $('#undoButton').prop('disabled', !toolbarState.isButtonEnabled(tableau.ToolbarButtonName.UNDO));
    $('#redoButton').prop('disabled', !toolbarState.isButtonEnabled(tableau.ToolbarButtonName.REDO));
}
   
//처음으로 되돌리기
function revertAll() {
	viz.revertAllAsync().then(function(t) {
//		console.log("revertAll");
	});
}
//다시 실행
function redo() {
    viz.redoAsync().then(function(t) {
//        console.log("redo");
	});
}
//실행 취소
function undo() {
    viz.undoAsync().then(function(t) {
//        console.log("undo");
	});
}
//새로고침
function refresh() {
    viz.refreshDataAsync().then(function(t) {
//        console.log("refresh");
	});
}
//이미지 다운로드
function epImg() {
    viz.showExportImageDialog();
}
//PDF 다운로드
function epPdf() {
    viz.showExportPDFDialog();
}
//Data 다운로드
function epData() {
    viz.showExportDataDialog();
}
