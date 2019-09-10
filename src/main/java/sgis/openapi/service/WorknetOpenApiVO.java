package sgis.openapi.service;

import java.io.Serializable;

public class WorknetOpenApiVO implements Serializable {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	/* 공통 */
	private String url = "";
	private String category = "";
	private String categoryNm = "";
	private String openapiId = "";
	private int total = 0;
	
	
	/* 목록 요청파라메터 */
	private String authKey = "";
	private String callTp = "";
	private String returnType = "";
	private int startPage = 1;
	private String display = "";
	private String region = "";
	private String occupation = "";
	private String salTp = "";
	private String minPay = "";
	private String maxPay = "";
	private String education = "";
	private String career = "";
	private String minCareerM = "";
	private String maxCareerM = "";
	private String pref = "";
	private String indArea = "";
	private String subway = "";
	private String empTp = "";
	private String termContractMmcnt = "";
	private String holidayTp = "";
	private String coTp = "";
	private String busino = "";
	private String dtlSmlgntYn = "";
	private String workStudyJoinYn = "";
	private String smlgntCoClcd = "";
	private String workerCnt = "";
	private String welfare = "";
	private String certLic = "";
	private String regDate = "";
	private String keyword = "";
	private String untilEmpWantedYn = "";
	private String minWantedAuthDt = "";
	private String maxWantedAuthDt = "";
	private String scrapInfoYn = "";
	private String empTpGb = "";
	private String sortOrderBy = "";
	private String major = "";
	private String foreignLanguage = "";
	private String comPreferential = "";
	private String pfPreferential = "";
	private String workHrCd = "";
	
	/* 상세 요청파라메터 */	
	private String wantedAuthNo = "";
	private String infoSvc = "";
	
	/* 기타 항목 */
	/** 검색조건-회원상태     (0, A, D, P)*/
    private String sbscrbSttus = "0";
	
	/** 검색조건 */
    private String searchCondition = "";
    
    /** 검색Keyword */
    private String searchKeyword = "";
    
    /** 검색사용여부 */
    private String searchUseYn = "";
    
    /** 현재페이지 */
    private int pageIndex = 1;
    
    /** 페이지갯수 */
    private int pageUnit = 10;
    
    /** 페이지사이즈 */
    private int pageSize = 10;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;
    
    private String year = "";    
    private String month = "";    
    private String atchFileId = "";    
    private int rowCount = 0;        
    private String sourceIs = "";    
    private String resultMessage = "";    
    private String status = "";    
    private String userID = "";    
    private String fileType = "";    
    private String fileSeparate = "";          
    private String fileNm = "";    
    private String userNm = "";     
    private String createDate = "";    
    private String RequestId = "";    
    private int totCount = 0;    
    private String addr = "";	
    private String apiKey = "";    
	private String lawdCd = "";		
	private String port = "";	
	private String usedYn = "";	
	private String sigunguCode = "";	
	private String sigunguName = "";
	private int pIndex = 1;
	private int pSize = 1000;
	
	public String getAuthKey() {
		return authKey;
	}
	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}
	public String getCallTp() {
		return callTp;
	}
	public void setCallTp(String callTp) {
		this.callTp = callTp;
	}
	public String getReturnType() {
		return returnType;
	}
	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getSalTp() {
		return salTp;
	}
	public void setSalTp(String salTp) {
		this.salTp = salTp;
	}
	public String getMinPay() {
		return minPay;
	}
	public void setMinPay(String minPay) {
		this.minPay = minPay;
	}
	public String getMaxPay() {
		return maxPay;
	}
	public void setMaxPay(String maxPay) {
		this.maxPay = maxPay;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getMinCareerM() {
		return minCareerM;
	}
	public void setMinCareerM(String minCareerM) {
		this.minCareerM = minCareerM;
	}
	public String getMaxCareerM() {
		return maxCareerM;
	}
	public void setMaxCareerM(String maxCareerM) {
		this.maxCareerM = maxCareerM;
	}
	public String getPref() {
		return pref;
	}
	public void setPref(String pref) {
		this.pref = pref;
	}
	public String getIndArea() {
		return indArea;
	}
	public void setIndArea(String indArea) {
		this.indArea = indArea;
	}
	public String getSubway() {
		return subway;
	}
	public void setSubway(String subway) {
		this.subway = subway;
	}
	public String getEmpTp() {
		return empTp;
	}
	public void setEmpTp(String empTp) {
		this.empTp = empTp;
	}
	public String getTermContractMmcnt() {
		return termContractMmcnt;
	}
	public void setTermContractMmcnt(String termContractMmcnt) {
		this.termContractMmcnt = termContractMmcnt;
	}
	public String getHolidayTp() {
		return holidayTp;
	}
	public void setHolidayTp(String holidayTp) {
		this.holidayTp = holidayTp;
	}
	public String getCoTp() {
		return coTp;
	}
	public void setCoTp(String coTp) {
		this.coTp = coTp;
	}
	public String getBusino() {
		return busino;
	}
	public void setBusino(String busino) {
		this.busino = busino;
	}
	public String getDtlSmlgntYn() {
		return dtlSmlgntYn;
	}
	public void setDtlSmlgntYn(String dtlSmlgntYn) {
		this.dtlSmlgntYn = dtlSmlgntYn;
	}
	public String getWorkStudyJoinYn() {
		return workStudyJoinYn;
	}
	public void setWorkStudyJoinYn(String workStudyJoinYn) {
		this.workStudyJoinYn = workStudyJoinYn;
	}
	public String getSmlgntCoClcd() {
		return smlgntCoClcd;
	}
	public void setSmlgntCoClcd(String smlgntCoClcd) {
		this.smlgntCoClcd = smlgntCoClcd;
	}
	public String getWorkerCnt() {
		return workerCnt;
	}
	public void setWorkerCnt(String workerCnt) {
		this.workerCnt = workerCnt;
	}
	public String getWelfare() {
		return welfare;
	}
	public void setWelfare(String welfare) {
		this.welfare = welfare;
	}
	public String getCertLic() {
		return certLic;
	}
	public void setCertLic(String certLic) {
		this.certLic = certLic;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getUntilEmpWantedYn() {
		return untilEmpWantedYn;
	}
	public void setUntilEmpWantedYn(String untilEmpWantedYn) {
		this.untilEmpWantedYn = untilEmpWantedYn;
	}
	public String getMinWantedAuthDt() {
		return minWantedAuthDt;
	}
	public void setMinWantedAuthDt(String minWantedAuthDt) {
		this.minWantedAuthDt = minWantedAuthDt;
	}
	public String getMaxWantedAuthDt() {
		return maxWantedAuthDt;
	}
	public void setMaxWantedAuthDt(String maxWantedAuthDt) {
		this.maxWantedAuthDt = maxWantedAuthDt;
	}
	public String getScrapInfoYn() {
		return scrapInfoYn;
	}
	public void setScrapInfoYn(String scrapInfoYn) {
		this.scrapInfoYn = scrapInfoYn;
	}
	public String getEmpTpGb() {
		return empTpGb;
	}
	public void setEmpTpGb(String empTpGb) {
		this.empTpGb = empTpGb;
	}
	public String getSortOrderBy() {
		return sortOrderBy;
	}
	public void setSortOrderBy(String sortOrderBy) {
		this.sortOrderBy = sortOrderBy;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getForeignLanguage() {
		return foreignLanguage;
	}
	public void setForeignLanguage(String foreignLanguage) {
		this.foreignLanguage = foreignLanguage;
	}
	public String getComPreferential() {
		return comPreferential;
	}
	public void setComPreferential(String comPreferential) {
		this.comPreferential = comPreferential;
	}
	public String getPfPreferential() {
		return pfPreferential;
	}
	public void setPfPreferential(String pfPreferential) {
		this.pfPreferential = pfPreferential;
	}
	public String getWorkHrCd() {
		return workHrCd;
	}
	public void setWorkHrCd(String workHrCd) {
		this.workHrCd = workHrCd;
	}
	public String getWantedAuthNo() {
		return wantedAuthNo;
	}
	public void setWantedAuthNo(String wantedAuthNo) {
		this.wantedAuthNo = wantedAuthNo;
	}
	public String getInfoSvc() {
		return infoSvc;
	}
	public void setInfoSvc(String infoSvc) {
		this.infoSvc = infoSvc;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCategoryNm() {
		return categoryNm;
	}
	public void setCategoryNm(String categoryNm) {
		this.categoryNm = categoryNm;
	}
	public String getOpenapiId() {
		return openapiId;
	}
	public void setOpenapiId(String openapiId) {
		this.openapiId = openapiId;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getSbscrbSttus() {
		return sbscrbSttus;
	}
	public void setSbscrbSttus(String sbscrbSttus) {
		this.sbscrbSttus = sbscrbSttus;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchUseYn() {
		return searchUseYn;
	}
	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public String getSourceIs() {
		return sourceIs;
	}
	public void setSourceIs(String sourceIs) {
		this.sourceIs = sourceIs;
	}
	public String getResultMessage() {
		return resultMessage;
	}
	public void setResultMessage(String resultMessage) {
		this.resultMessage = resultMessage;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileSeparate() {
		return fileSeparate;
	}
	public void setFileSeparate(String fileSeparate) {
		this.fileSeparate = fileSeparate;
	}
	public String getFileNm() {
		return fileNm;
	}
	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getRequestId() {
		return RequestId;
	}
	public void setRequestId(String requestId) {
		RequestId = requestId;
	}
	public int getTotCount() {
		return totCount;
	}
	public void setTotCount(int totCount) {
		this.totCount = totCount;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getApiKey() {
		return apiKey;
	}
	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}
	public String getLawdCd() {
		return lawdCd;
	}
	public void setLawdCd(String lawdCd) {
		this.lawdCd = lawdCd;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public String getUsedYn() {
		return usedYn;
	}
	public void setUsedYn(String usedYn) {
		this.usedYn = usedYn;
	}
	public String getSigunguCode() {
		return sigunguCode;
	}
	public void setSigunguCode(String sigunguCode) {
		this.sigunguCode = sigunguCode;
	}
	public String getSigunguName() {
		return sigunguName;
	}
	public void setSigunguName(String sigunguName) {
		this.sigunguName = sigunguName;
	}
	public int getpIndex() {
		return pIndex;
	}
	public void setpIndex(int pIndex) {
		this.pIndex = pIndex;
	}
	public int getpSize() {
		return pSize;
	}
	public void setpSize(int pSize) {
		this.pSize = pSize;
	}

	
	
}
