<%--
  Class Name : openapiInfoEdit.jsp
  Description : openapi 정보 수정
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
	
	<title>워크넷 구인 자료 수집 서비스 - Open Api 관리</title>

	<script type="text/javascript" src="<c:url value='/js/sgis/libs/jQuery/1.12.3/jquery.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/sgis/libs/jQuery-ui/jquery-ui.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/sgis/admin.js'/>"></script>
	
    <!--[if lt IE 9]>
		<script type="text/javascript" src="../../src/js/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script type="text/javascript" src="../../src/js/libs/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<script type="text/javascript">
		$(function() {
	    	var dt = new Date(); 
	    	var option = null; 
	    		    	
	    	for (var year=dt.getFullYear(); 2010 <= (year+1); year--){
	    		$('#year')[0].options.add(new Option(year, year)); 
	    	}
	    	
	    	var month;
	    	for (var i=1; i<=12; i++){
	    		month = i;
	    		if(month < 10){
	    			month = '0' + month;
	    		}	    		
	    		option = new Option(month,month);
	    		/* select current month
	    		if(i == dt.getMonth()){
	    			option.selected = true;
	    		}
	    		*/
	    		$('#month')[0].options.add(option);
	    	}
	    });
	</script>
	<script type="text/javascript">	    	    
	    function fn_openapi_info_modify() {
	        if (confirm('수정 할까요?')) {
	            document.importOpenApiVO.action = "<c:url value='/sgis/openapi/openApiInfoModify.do'/>";
	            document.importOpenApiVO.submit();
	        }
	    }    
	    
	    function fn_openapi_info(pageNo) {	    	
	        document.importOpenApiVO.pageIndex.value = pageNo;
	        document.importOpenApiVO.action = "<c:url value='/sgis/openapi/openApiInfoList.do'/>";
	        document.importOpenApiVO.submit();  
	    }
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
		
		<!-- Contents -->
		<section id="content" class="content">

			<!-- Open Api등록 -->
			<form:form commandName="importOpenApiVO" name="importOpenApiVO" method="post">
				<input type="hidden" name="pageIndex" value="" />
				<input type="hidden" name="openapiId" value="<c:out value="${result.openapiId}" />"/>
				<fieldset>
					<legend>Open Api등록</legend>
					<div class="table-vertical type2">
						<table>
							<caption class="blind">Open Api등록 내용</caption>
							<colgroup>
								<col style="width:15%;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="w-name">수급자료명</label></th>
									<td>
										<c:out value="${result.categoryNm}" />
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="w-ref">출처</label></th>
									<td><input type="text" id="sourceIs" name="sourceIs" value="<c:out value="${result.sourceIs}" />" style="width:550px;"></td>
								</tr>
								<tr>
									<th scope="row"><label for="w-url">URL</label></th>
									<td><input type="text" id="url" name="url" value="<c:out value="${result.url}" />" style="width:550px;"></td>
								</tr>
								<tr>
									<th scope="row"><label for="w-url">PORT</label></th>
									<td><input type="text" id="port" name="port" value="<c:out value="${result.port}" />" style="width:550px;"></td>
								</tr>
								<tr>
									<th scope="row"><label for="w-key">인증 Key</label></th>
									<td><input type="text" id="apiKey" name="apiKey" value="<c:out value="${result.apiKey}" />" style="width:550px;"></td>
								</tr>								
								<tr>
									<th scope="row"><label for="w-state">상태</label></th>
									<td>										
										<select id="usedYn" name="usedYn">
											<option value="Y" ${result.usedYn == 'Y'? 'selected' : '' } >사용</option>
											<option value="N" ${result.usedYn == 'N'? 'selected' : '' } >정지</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
			</form:form>
			<!-- /Open Api등록 -->
			
			<div class="bt-area text-right">
				<input type="reset" id="" name="" value="취소" class="bt reset" onclick="javascript:history.go(-1); return false;">
				<input type="submit" id="" name="" value="저장" class="bt submit" onclick="javascript:fn_openapi_info_modify(); return false;">
				<!--a href="list.html" class="bt list">목록</a-->
			</div>
		</section>
		<!-- /Contents -->
	</article>
	<!-- /Container -->
	
</body>
</html>