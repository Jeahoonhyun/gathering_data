package sgis.openapi.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 실거래가(아파트/단독/빌라)  원시 자료 Bean
 * @author owthit
 * @since 2018.02.26
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.02.26  현팀장          최초 생성 
 *
 * </pre>
 */
public class RlDlpcInfoSrcVO extends PpaOpenApiImportVO implements Serializable {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	
	private String ym            = "";    /* 년월 */      
	private String signgu        = "";    /* 시군구 */    
	private String lnbr          = "";    /* 번지 */      
	private String hsmp_nm       = "";    /* 단지명 */    
	private String lfsts_mtht_se = "";    /* 전월세구분 */
	//private int dvr_ar           = 0;    /* 전용면적 */  
	private double dvr_ar           = 0.0;    /* 전용면적 */
	private String cntrct_de     = "";    /* 계약일 */    
	private int gtn              = 0;    /* 보증금 */    
	private int mtht             = 0;    /* 월세 */      
	private String floor         = "";    /* 층 */        
	private String bildng_year   = "";    /* 건축년도 */  
	private String rn            = "";    /* 도로명 */    
	private String creat_de      = "";    /* 생성일자 */  
	private double plot_right_ar    = 0;    /* 대지권면적 */
	private int delng_amount     = 0;    /* 거래금액 */  
	private double cntrct_ar        = 0;    /* 계약면적 */  
	private String house_ty      = "";    /* 주택유형 */  
	private double totar            = 0;    /* 연면적 */    
	private double plot_ar          = 0;    /* 대지면적 */  
	

	public String getYm() {
		return ym;
	}


	public void setYm(String ym) {
		this.ym = ym;
	}


	public String getSigngu() {
		return signgu;
	}


	public void setSigngu(String signgu) {
		this.signgu = signgu;
	}


	public String getLnbr() {
		return lnbr;
	}


	public void setLnbr(String lnbr) {
		this.lnbr = lnbr;
	}


	public String getHsmp_nm() {
		return hsmp_nm;
	}


	public void setHsmp_nm(String hsmp_nm) {
		this.hsmp_nm = hsmp_nm;
	}


	public String getLfsts_mtht_se() {
		return lfsts_mtht_se;
	}


	public void setLfsts_mtht_se(String lfsts_mtht_se) {
		this.lfsts_mtht_se = lfsts_mtht_se;
	}


	public String getCntrct_de() {
		return cntrct_de;
	}


	public void setCntrct_de(String cntrct_de) {
		this.cntrct_de = cntrct_de;
	}


	public int getGtn() {
		return gtn;
	}


	public void setGtn(int gtn) {
		this.gtn = gtn;
	}


	public int getMtht() {
		return mtht;
	}


	public void setMtht(int mtht) {
		this.mtht = mtht;
	}


	public String getFloor() {
		return floor;
	}


	public void setFloor(String floor) {
		this.floor = floor;
	}


	public String getBildng_year() {
		return bildng_year;
	}


	public void setBildng_year(String bildng_year) {
		this.bildng_year = bildng_year;
	}


	public String getRn() {
		return rn;
	}


	public void setRn(String rn) {
		this.rn = rn;
	}


	public String getCreat_de() {
		return creat_de;
	}


	public void setCreat_de(String creat_de) {
		this.creat_de = creat_de;
	}


	public double getPlot_right_ar() {
		return plot_right_ar;
	}


	public void setPlot_right_ar(double plot_right_ar) {
		this.plot_right_ar = plot_right_ar;
	}


	public int getDelng_amount() {
		return delng_amount;
	}


	public void setDelng_amount(int delng_amount) {
		this.delng_amount = delng_amount;
	}


	public double getCntrct_ar() {
		return cntrct_ar;
	}


	public void setCntrct_ar(double cntrct_ar) {
		this.cntrct_ar = cntrct_ar;
	}


	public String getHouse_ty() {
		return house_ty;
	}


	public void setHouse_ty(String house_ty) {
		this.house_ty = house_ty;
	}


	public double getTotar() {
		return totar;
	}


	public void setTotar(double totar) {
		this.totar = totar;
	}


	public double getPlot_ar() {
		return plot_ar;
	}


	public void setPlot_ar(double plot_ar) {
		this.plot_ar = plot_ar;
	}


	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }


	public double getDvr_ar() {
		return dvr_ar;
	}


	public void setDvr_ar(double dvr_ar) {
		this.dvr_ar = dvr_ar;
	}
}
