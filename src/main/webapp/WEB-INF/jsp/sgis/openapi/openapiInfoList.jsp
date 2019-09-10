<%--
  Class Name : openapiInfoList.jsp
  Description : openapi 정보 목록
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2018.06.22   현팀장              최초 생성
 
    author   : 올포랜드
    since    : 2018.06.22
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="loginName" value="관리자"/>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/x-icon" href="<c:url value='/images/sgis/favicon.ico'/>">
	<link rel="apple-touch-icon-precomposed" type="image/x-icon" href="<c:url value='/images/sgis/favicon.ico'/>">
	<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/images/sgis/favicon.ico'/>">
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/js/sgis/libs/jQuery-ui/jquery-ui.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/sgis/admin.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/sgis/admin_com.css'/>">
	
	<title>워크넷 구인 자료 수집 서비스 - Open Api 관리</title>

	<script type="text/javascript" src="<c:url value='/js/sgis/libs/jQuery/1.12.3/jquery.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/sgis/libs/jQuery-ui/jquery-ui.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/sgis/admin.js'/>"></script>
	
    <!--[if lt IE 9]>
		<script type="text/javascript" src="../../src/js/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script type="text/javascript" src="../../src/js/libs/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<script type="text/javascript">
	$(window).load(function() {    
     $('#loading').hide();  
    });
	</script>
	<script type="text/javascript">	
	    function press(event) {
	        if (event.keyCode==13) {
	        	fn_openapi_info('1');
	        }
	    }
	
	    function fn_openapi_info_regist() {
	        document.frm.action = "<c:url value='/sgis/openapi/openApiInfoRegist.do'/>";
	        document.frm.submit();
	    }
	    
	    function fn_openapi_info(pageNo) {
	    	if(document.frm.searchCondition.value == ""){
	    		alert("검색조건을 선택하시기 바랍니다.");
	    		document.frm.searchCondition.focus();
	    		return;
	    	}
			if(document.frm.searchKeyword.value == ""){
				alert("검색단어를 입력하시기 바랍니다.");
				document.frm.searchKeyword.focus();
	    		return;
	    	}
	        document.frm.pageIndex.value = pageNo;
	        document.frm.action = "<c:url value='/sgis/openapi/openApiInfoList.do'/>";
	        document.frm.submit();  
	    }
	    
	    function fn_openapi_info_next(pageNo) {	    	
	        document.frm.pageIndex.value = pageNo;
	        document.frm.action = "<c:url value='/sgis/openapi/openApiInfoList.do'/>";
	        document.frm.submit();  
	    }
	    
	    function fn_openapi_info_detail(openapiId) {
	        document.frm.openapiId.value = openapiId;
	        document.frm.action = "<c:url value='/sgis/openapi/openApiInfoDetail.do'/>";
	        document.frm.submit();          
	    }
	    
	    function fn_openapi_execute(openapiId, category, categoryNm, url) {
	    	if (confirm(categoryNm + '['+ category + '] 자료수급 실행합니까?')) {
		    	$('#loading').show();
		        document.frm.openapiId.value = openapiId;	        
		        document.frm.category.value = category;
		        document.frm.categoryNm.value = categoryNm;
		        if(category == "API90"){
		        	document.frm.url.value = "http://openapi.work.go.kr/opi/opi/opia/wantedApi.do";
			        document.frm.authKey.value = "WNJCQWWNSBJ0Y7F16CGHU2VR1HK";	
			        document.frm.startPage.value = "1";
			        document.frm.display.value = "100";
			        document.frm.regDate.value = "";	// D-0, D-3, W-1, W-2
			        document.frm.action = "<c:url value='/sgis/openapi/importOpenApi.do'/>";
		        }else if(category == "API95"){
		        	document.frm.url.value = "https://cpapi.incruit.com/joblistall";
			        document.frm.incCpClientkey.value = "yMyIsImlwIjoiMTc1LjIwMy4xMjUuMTIzIiwidGltZXN0YW1wIjoiMTUzNjI5NzUzMDI4MSJ9.-i4KLvzE1tb6ROBwtI1dteHlK4rWDUuf52BClgNc5iU";	
			        document.frm.start.value = "0";
			        document.frm.size.value = "20";
			        document.frm.action = "<c:url value='/sgis/openapi/importIncruitApi.do'/>";
		        }else{
		        	// KOSIS info used URL, category => link_id
		        	document.frm.url.value = url;	
			        document.frm.action = "<c:url value='/sgis/openapi/importKosisApi.do'/>";
		        }		        	        	        		        
		        document.frm.submit();
	    	}
	    }	
	    <c:if test="${!empty resultMsg}">alert("<c:out value="${resultMsg}" />");</c:if>
	</script>
</head>
<body>
	<!-- Skip Navigation -->
	<a href="#content" class="nav-skip">본문바로가기</a>
	<a href="#gnb" class="nav-skip">주메뉴 바로가기</a>
	<a href="#lnb" class="nav-skip">서브메뉴 바로가기</a>
    <!-- /Skip Navigation -->
	
	<!-- Header -->
    <header>
		<hgroup>
			<h1 class="logo"><a href="<c:url value='/sgis/openapi/openApiInfoList.do'/>"><i></i><em>일자리</em> 분석 서비스</a></h1>
			<div class="user-info">
				<span><i class="ico user"></i><strong><c:out value="${loginName}"/></strong> 님 (<em>사업단</em>)</span>				
			</div>
		</hgroup>
		
        <nav id="gnb">
			<ul role="menu">
				<li class="current"><a href="<c:url value='/sgis/openapi/openApiInfoList.do'/>"><i class="ico m1"></i><span>OPEN API<br>관리</span></a></li>
				<li></li>
				<li></a></li>
			</ul>
        </nav>
    </header>
    <!-- /Header -->
	
	<!-- Container -->
	<article class="container">
		<!-- Sub Menu -->
		<section id="lnb" class="lnb">
			<h2 class="blind">Open Api 관리</h2>
			<ul role="menu">
				<li class="current"><a href="<c:url value='/sgis/openapi/openApiInfoList.do'/>">등록 목록</a></li>
				<li></li>
			</ul>
		</section>
		<!-- /Sub Menu -->

		<!-- Search -->
		<div class="search-form">
			<form name="frm" action ="" method="post" class="float-right">
				<input type="hidden" name="openapiId" value="" />
				<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
				<input type="hidden" name="categoryNm" value="" />				
				<input type="hidden" name="category" value="" />
				<input type="hidden" name="url" value="" />
				<input type="hidden" name="authKey" value="" />
				<input type="hidden" name="startPage" value="" />
				<input type="hidden" name="display" value="" />
				<input type="hidden" name="regDate" value="" />
				<input type="hidden" name="incCpClientkey" value="" />
				<input type="hidden" name="start" value="" />
				<input type="hidden" name="size" value="" />
				<fieldset>
					<legend>리스트 검색</legend>					
					<label for="s-require" class="blind">검색 조건 선택</label>
					<select id="searchCondition" name="searchCondition" title="검색조건 선택">
						<option value="">선택</option>
						<option value="0" <c:if test="${searchVO.searchCondition == '0'}">selected="selected"</c:if> >자료명</option>
						<option value="1" <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if> >출처</option>						
					</select>
					
					<label for="s-input" class="blind">검색어 입력</label>
					<input type="text" id="searchKeyword" name="searchKeyword" value="<c:out value="${searchVO.searchKeyword}"/>" onkeypress="press(event);" title="검색어 입력">
					<button type="button" class="bt search" onclick="javascript:fn_openapi_info('1'); return false;">조회</button>
				</fieldset>
			</form>
		</div>
		<!-- /Search -->
		
		<!-- Contents -->
		<section id="content" class="content">

			<!-- Open Api 등록 목록 -->
			<div class="table-horizontal hover">
				<table>
					<caption class="blind">Open Api 등록 목록</caption>
					<colgroup>
						<col style="width:5%;">
						<col>
						<col style="width:15%;">
						<col style="width:10%;">
						<col style="width:10%;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">수급자료명</th>
							<th scope="col">출처</th>
							<th scope="col">상태</th>
							<th scope="col">수동</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
							<td><span class="txt-gray"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></span></td>
							<td class="subject"><a href="#LINK" onclick="javascript:fn_openapi_info_detail('<c:out value="${result.openapiId}"/>')"><c:out value="${result.categoryNm}"/></a></td>
							<td><c:out value="${result.sourceIs}"/></td>
							<td>
								<c:if test="${result.usedYn == 'Y'}"><span class="txt-blue">사용</span></c:if>
								<c:if test="${result.usedYn == 'N'}"><span class="txt-red">정지</span></c:if>
							</td>
							<td>								
								<c:if test="${result.usedYn == 'Y'}">
								<button type="button" class="bt table" onclick="javascript:fn_openapi_execute('<c:out value="${result.openapiId}"/>','<c:out value="${result.category}"/>','<c:out value="${result.categoryNm}"/>','<c:out value="${result.url}"/>'); return false;">실행</button>
								</c:if>
								<c:if test="${result.usedYn == 'N'}">
								<button type="button" class="bt table" onclick="javascript:alert('정지 상태로 실행할 수 없습니다.'); return false;">정지</button>
								</c:if>								
							</td>														
						</tr>
						</c:forEach>
						<c:if test="${fn:length(resultList) == 0}">
						<tr>
							<td colspan="5" >데이터가 없습니다.</td>
						</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<!-- /Open Api 등록 목록 -->

			<!-- Pagination -->
			<div id="paging_div" class="pagination">
                <ul class="paging_align">
                    <ui:pagination paginationInfo="${paginationInfo}" type="button" jsFunction="fn_openapi_info_next" />  
                </ul>
            </div>
            <!-- 
			<div class="pagination">
				<button type="button" class="prev">이전</button>	
				<div>
					<button type="button" class="current">1</button>
					<button type="button">2</button>
					<button type="button">3</button>
					<button type="button">4</button>
					<button type="button">5</button>
					<button type="button">6</button>
					<button type="button">7</button>
					<button type="button">8</button>
					<button type="button">9</button>
					<button type="button">10</button>
				</div>
				<button type="button" class="next">다음</button>
			</div>
			 -->
			<!-- /Pagination -->

			<div class="bt-area text-right">
				<a href="#LINK" onclick="javascript:fn_openapi_info_regist(); return false;" class="bt submit">등록</a>
			</div>
		</section>
		<!-- /Contents -->
	</article>
	<!-- /Container -->
	<div id="loading"><img id="loading-image" src="<c:url value='/images/sgis/loading.gif'/>" alt="Loading..." /></div>
</body>
</html>