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
public class ChildHouseKndrgrInfoSrcVO extends PpaOpenApiImportVO implements Serializable {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	
	private String sigun_cd ="";          /* 시군코드          */
	private String sigun_nm ="";          /* 시군명            */
	private String fclty_se ="";          /* 시설구분          */
	private String fclty_ty ="";          /* 시설유형          */
	private String fclty_nm ="";          /* 시설명            */
	private String telno ="";             /* 전화번호          */
	private String locplc_lnm_adres ="";  /* 소재지지번주소    */
	private String locplc_rn_adres ="";   /* 소재지도로명주소  */
	private String locplc_zip ="";        /* 소재지우편번호    */
	private double la = 0;                /* 위도              */
	private double lo = 0;                /* 경도              */
	private String refine_yn ="";         /* 정제완료          */
	private String creat_de ="";          /* 생성일자          */  
	

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


	public String getFclty_se() {
		return fclty_se;
	}


	public void setFclty_se(String fclty_se) {
		this.fclty_se = fclty_se;
	}


	public String getFclty_ty() {
		return fclty_ty;
	}


	public void setFclty_ty(String fclty_ty) {
		this.fclty_ty = fclty_ty;
	}


	public String getFclty_nm() {
		return fclty_nm;
	}


	public void setFclty_nm(String fclty_nm) {
		this.fclty_nm = fclty_nm;
	}


	public String getTelno() {
		return telno;
	}


	public void setTelno(String telno) {
		this.telno = telno;
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
}
