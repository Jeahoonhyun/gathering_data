package sgis.openapi.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 어린이집/유치원  원시 자료 Bean
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
public class ObgynInfoSrcVO extends PpaOpenApiImportVO implements Serializable {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	
	private String sigun_cd ="";          /* 시군코드          */
	private String sigun_nm ="";          /* 시군명            */
	private String mdlcnst_nm ="";          /* 의료기관명          */
	private String asort_se ="";          /* 종별구분          */	
	private String locplc_lnm_adres ="";  /* 소재지지번주소    */
	private String locplc_rn_adres ="";   /* 소재지도로명주소  */
	private String locplc_zip ="";        /* 소재지우편번호    */
	private double la = 0;                /* 위도              */
	private double lo = 0;                /* 경도              */
	private String refine_yn ="";         /* 정제완료          */
	private String creat_de ="";          /* 생성일자          */  
	private String idPrefix ="";          /* ID          */
	private int num = 0;

	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }


	public String getSigun_cd() {
		return sigun_cd;
	}


	public void setSigun_cd(String sigun_cd) {
		this.sigun_cd = sigun_cd;
	}


	public String getSigun_nm() {
		return sigun_nm;
	}


	public void setSigun_nm(String sigun_nm) {
		this.sigun_nm = sigun_nm;
	}


	public String getLocplc_lnm_adres() {
		return locplc_lnm_adres;
	}


	public void setLocplc_lnm_adres(String locplc_lnm_adres) {
		this.locplc_lnm_adres = locplc_lnm_adres;
	}


	public String getLocplc_rn_adres() {
		return locplc_rn_adres;
	}


	public void setLocplc_rn_adres(String locplc_rn_adres) {
		this.locplc_rn_adres = locplc_rn_adres;
	}


	public String getLocplc_zip() {
		return locplc_zip;
	}


	public void setLocplc_zip(String locplc_zip) {
		this.locplc_zip = locplc_zip;
	}


	public double getLa() {
		return la;
	}


	public void setLa(double la) {
		this.la = la;
	}


	public double getLo() {
		return lo;
	}


	public void setLo(double lo) {
		this.lo = lo;
	}


	public String getRefine_yn() {
		return refine_yn;
	}


	public void setRefine_yn(String refine_yn) {
		this.refine_yn = refine_yn;
	}


	public String getCreat_de() {
		return creat_de;
	}


	public void setCreat_de(String creat_de) {
		this.creat_de = creat_de;
	}


	public String getMdlcnst_nm() {
		return mdlcnst_nm;
	}


	public void setMdlcnst_nm(String mdlcnst_nm) {
		this.mdlcnst_nm = mdlcnst_nm;
	}


	public String getAsort_se() {
		return asort_se;
	}


	public void setAsort_se(String asort_se) {
		this.asort_se = asort_se;
	}


	public String getIdPrefix() {
		return idPrefix;
	}


	public void setIdPrefix(String idPrefix) {
		this.idPrefix = idPrefix;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}
}
