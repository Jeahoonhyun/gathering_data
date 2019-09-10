package sgis.openapi.service;

import java.io.Serializable;

public class IncruitApiVO extends WorknetOpenApiVO implements Serializable {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	/* 인크루트 신규 제공 */
	String companyNmCore = "";
	String docId = "";
	String indusNmList = "";
	String companyAddr = "";
	String bizRegistNo = "";
	String compScaleNm = "";
	String empYnEntry = "";
	String empYnExper = "";
	String employLimitYn = "";
	String inviteCloseDt = "";
	String inviteStartDt = "";
	String careerNm = "";
	String jobTitle = "";
	String occuNmList = "";
	String regionNmList = "";
	String salary1 = "";
	String salary2 = "";
	String salaryNegoYn = "";
	String employTyNmList = "";
	String scholNm = "";
	String employCnt = "";
	String licenseNmList = "";
	String subwayNmList = "";
	String linkUrl = "";
	String pstnNmList = "";
	
	/* 인크루트 목록 */
	String empTyNm = "";
	//String empYnEntry = "";
	String modDate = "";
	//String empYnExper = "";
	//String salary2 = "";
	//String salary1 = "";
	String companyNm = "";
	//String jobTitle = "";
	String careerYear2 = "";
	String regDate = "";
	String careerYear1 = "";
	String inviteclosedt = "";
	//String docId = "";
	String subwayNmListSch = "";
	String salaryNm = "";
	//String inviteStartDt = "";
	String careerRequire = "";
	//String indusNmList = "";
	String regionNmFullListSch = "";
	String scholRequire = "";

	/* 인크루트 상세 */
	String pstNmList = "";
	String jobCont = "";
	String compAddr = "";
	
	/* 환경 설정 */
	String incCpClientkey = "";
	int start = 0;
	int size = 0;
	int totalCount = 0;
	String pageInfo = "";
	
	
	public String getPageInfo() {
		return pageInfo;
	}
	public void setPageInfo(String pageInfo) {
		this.pageInfo = pageInfo;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getIncCpClientkey() {
		return incCpClientkey;
	}
	public void setIncCpClientkey(String incCpClientkey) {
		this.incCpClientkey = incCpClientkey;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getCompanyNmCore() {
		return companyNmCore;
	}
	public void setCompanyNmCore(String companyNmCore) {
		this.companyNmCore = companyNmCore;
	}
	public String getDocId() {
		return docId;
	}
	public void setDocId(String docId) {
		this.docId = docId;
	}
	public String getIndusNmList() {
		return indusNmList;
	}
	public void setIndusNmList(String indusNmList) {
		this.indusNmList = indusNmList;
	}
	public String getCompanyAddr() {
		return companyAddr;
	}
	public void setCompanyAddr(String companyAddr) {
		this.companyAddr = companyAddr;
	}
	public String getBizRegistNo() {
		return bizRegistNo;
	}
	public void setBizRegistNo(String bizRegistNo) {
		this.bizRegistNo = bizRegistNo;
	}
	public String getCompScaleNm() {
		return compScaleNm;
	}
	public void setCompScaleNm(String compScaleNm) {
		this.compScaleNm = compScaleNm;
	}
	public String getEmpYnEntry() {
		return empYnEntry;
	}
	public void setEmpYnEntry(String empYnEntry) {
		this.empYnEntry = empYnEntry;
	}
	public String getEmpYnExper() {
		return empYnExper;
	}
	public void setEmpYnExper(String empYnExper) {
		this.empYnExper = empYnExper;
	}
	public String getEmployLimitYn() {
		return employLimitYn;
	}
	public void setEmployLimitYn(String employLimitYn) {
		this.employLimitYn = employLimitYn;
	}
	public String getInviteCloseDt() {
		return inviteCloseDt;
	}
	public void setInviteCloseDt(String inviteCloseDt) {
		this.inviteCloseDt = inviteCloseDt;
	}
	public String getInviteStartDt() {
		return inviteStartDt;
	}
	public void setInviteStartDt(String inviteStartDt) {
		this.inviteStartDt = inviteStartDt;
	}
	public String getCareerNm() {
		return careerNm;
	}
	public void setCareerNm(String careerNm) {
		this.careerNm = careerNm;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getOccuNmList() {
		return occuNmList;
	}
	public void setOccuNmList(String occuNmList) {
		this.occuNmList = occuNmList;
	}
	public String getRegionNmList() {
		return regionNmList;
	}
	public void setRegionNmList(String regionNmList) {
		this.regionNmList = regionNmList;
	}
	public String getSalary1() {
		return salary1;
	}
	public void setSalary1(String salary1) {
		this.salary1 = salary1;
	}
	public String getSalary2() {
		return salary2;
	}
	public void setSalary2(String salary2) {
		this.salary2 = salary2;
	}
	public String getSalaryNegoYn() {
		return salaryNegoYn;
	}
	public void setSalaryNegoYn(String salaryNegoYn) {
		this.salaryNegoYn = salaryNegoYn;
	}
	public String getEmployTyNmList() {
		return employTyNmList;
	}
	public void setEmployTyNmList(String employTyNmList) {
		this.employTyNmList = employTyNmList;
	}
	public String getScholNm() {
		return scholNm;
	}
	public void setScholNm(String scholNm) {
		this.scholNm = scholNm;
	}
	public String getEmployCnt() {
		return employCnt;
	}
	public void setEmployCnt(String employCnt) {
		this.employCnt = employCnt;
	}
	public String getLicenseNmList() {
		return licenseNmList;
	}
	public void setLicenseNmList(String licenseNmList) {
		this.licenseNmList = licenseNmList;
	}
	public String getSubwayNmList() {
		return subwayNmList;
	}
	public void setSubwayNmList(String subwayNmList) {
		this.subwayNmList = subwayNmList;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	public String getPstnNmList() {
		return pstnNmList;
	}
	public void setPstnNmList(String pstnNmList) {
		this.pstnNmList = pstnNmList;
	}
	public String getEmpTyNm() {
		return empTyNm;
	}
	public void setEmpTyNm(String empTyNm) {
		this.empTyNm = empTyNm;
	}
	public String getModDate() {
		return modDate;
	}
	public void setModDate(String modDate) {
		this.modDate = modDate;
	}
	public String getCompanyNm() {
		return companyNm;
	}
	public void setCompanyNm(String companyNm) {
		this.companyNm = companyNm;
	}
	public String getCareerYear2() {
		return careerYear2;
	}
	public void setCareerYear2(String careerYear2) {
		this.careerYear2 = careerYear2;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getCareerYear1() {
		return careerYear1;
	}
	public void setCareerYear1(String careerYear1) {
		this.careerYear1 = careerYear1;
	}
	public String getInviteclosedt() {
		return inviteclosedt;
	}
	public void setInviteclosedt(String inviteclosedt) {
		this.inviteclosedt = inviteclosedt;
	}
	public String getSubwayNmListSch() {
		return subwayNmListSch;
	}
	public void setSubwayNmListSch(String subwayNmListSch) {
		this.subwayNmListSch = subwayNmListSch;
	}
	public String getSalaryNm() {
		return salaryNm;
	}
	public void setSalaryNm(String salaryNm) {
		this.salaryNm = salaryNm;
	}
	public String getCareerRequire() {
		return careerRequire;
	}
	public void setCareerRequire(String careerRequire) {
		this.careerRequire = careerRequire;
	}
	public String getRegionNmFullListSch() {
		return regionNmFullListSch;
	}
	public void setRegionNmFullListSch(String regionNmFullListSch) {
		this.regionNmFullListSch = regionNmFullListSch;
	}
	public String getScholRequire() {
		return scholRequire;
	}
	public void setScholRequire(String scholRequire) {
		this.scholRequire = scholRequire;
	}
	public String getPstNmList() {
		return pstNmList;
	}
	public void setPstNmList(String pstNmList) {
		this.pstNmList = pstNmList;
	}
	public String getJobCont() {
		return jobCont;
	}
	public void setJobCont(String jobCont) {
		this.jobCont = jobCont;
	}
	public String getCompAddr() {
		return compAddr;
	}
	public void setCompAddr(String compAddr) {
		this.compAddr = compAddr;
	}		
	
	
}
