<%--
  Class Name : openapiInfoDetail.jsp
  Description : openapi 정보 상세
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
	
	    function fn_openapi_info_edit() {
	    	document.frm.pageIndex.value = 0;
	        document.frm.action = "<c:url value='/sgis/openapi/openApiInfoEdit.do'/>";
	        document.frm.submit();
	    }
	    
	    function fn_openapi_info(pageNo) {	    	
	        document.frm.pageIndex.value = pageNo;
	        document.frm.action = "<c:url value='/sgis/openapi/openApiInfoList.do'/>";
	        document.frm.submit();  
	    }
	    
	    function fn_openapi_info_detail(requestId) {	        
	        document.frm.requestId.value = requestId;
	        document.frm.action = "<c:url value='/sgis/openapi/openApiInfoDetail.do'/>";
	        document.frm.submit();          
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

			<!-- Open Api등록 상세 -->
			<div class="table-vertical">
				<h3 class="title-table"><c:out value="${result.categoryNm}" /></h3>
				<form name="frm" method="post" action="">
				<input type="hidden" name="pageIndex" value="<c:out value="${result.pageIndex}" />"/>
				<input type="hidden" name="openapiId" value="<c:out value="${result.openapiId}" />"/>
				<table>
					<caption class="blind">Open Api등록 상세</caption>
					<colgroup>
						<col style="width:150px;">
						<col>
						<col style="width:150px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">출처</th>
							<td><c:out value="${result.sourceIs}" /></td>
						</tr>
						<tr>
							<th scope="row">URL</th>
							<td><c:out value="${result.url}" /></td>
						</tr>
						<tr>
							<th scope="row">포트</th>
							<td><c:out value="${result.port}" /></td>
						</tr>
						<tr>
							<th scope="row">key</th>
							<td><c:out value="${result.apiKey}" /></td>
						</tr>
						<tr>
							<th scope="row">등록일자</th>
							<td><c:out value="${result.createDate}" /></td>
						</tr>
						<tr>
							<th scope="row">상태</th>
							<td>
								<c:if test="${result.usedYn == 'Y'}"><span class="txt-blue">사용</span></c:if>
								<c:if test="${result.usedYn == 'N'}"><span class="txt-red">정지</span></c:if>
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
			<!-- /Open Api등록 상세 -->
			
			<!-- 이전글/다음글 -->	
			<!-- 
			<div class="table-vertical type-page">
				<table>
					<caption class="blind">이전글/다음글</caption>
					<colgroup>
						<col style="width:150px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><span class="txt-prev">이전글</span></th>
							<td><a href="#">매매 실거래가정보(단독/다가구)</a></td>
						</tr>
						<tr>
							<th scope="row"><span class="txt-next">다음글</span></th>
							<td><a href="#">아파트정보</a></td>
						</tr>
					</tbody>
				</table>
			</div>	
			 -->
			<!-- /이전글/다음글 -->

			<div class="bt-area text-right">
				<a href="#LINK" onclick="javascript:fn_openapi_info_edit(); return false;" class="bt list">수정</a>
				<a href="#LINK" onclick="javascript:fn_openapi_info('<c:out value="${result.pageIndex}" />'); return false;" class="bt list">목록</a>
			</div>
		</section>
		<!-- /Contents -->
	</article>
	<!-- /Container -->
	
</body>
</html>