package sgis.openapi.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("openApiImportScheduling")
public class OpenApiImportScheduling extends EgovAbstractServiceImpl {

	@Resource(name="openApiImportService")
	private OpenApiImportService openApiImportService;

	/**
	 * 아파트 매매 실거래가 자료 수신
	 * @throws Exception
	 */
	public void getRlDlpcInfoAptTrdeSrc() throws Exception {
		this.commonOpenApiImport("API_000000000000011");
	}
	
	/**
	 * "연립/다세대 매매 실거래 자료" 자료 수신
	 * @throws Exception
	 */
	public void getRlDlpcInfoRwhsTrdeSrc() throws Exception {
		this.commonOpenApiImport("API_000000000000021");
	}
	
	/**
	 * "단독/다가구 매매 실거래 자료" 자료 수신
	 * @throws Exception
	 */
	public void getRlDlpcInfoSnglnsTrdeSrc() throws Exception {
		this.commonOpenApiImport("API_000000000000022");
	}
	
	/**
	 * "아파트 전월세 자료" 자료 수신
	 * @throws Exception
	 */
	public void getRlDlpcInfoAptLfstsSrc() throws Exception {
		this.commonOpenApiImport("API_000000000000023");
	}
	
	/**
	 * "연립/다세대 전월세 자료" 자료 수신
	 * @throws Exception
	 */
	public void getRlDlpcInfoRwhsLfstsSrc() throws Exception {
		this.commonOpenApiImport("API_000000000000031");
	}
	
	/**
	 * "단독/다가구 전월세 자료" 자료 수신
	 * @throws Exception
	 */
	public void getRlDlpcInfoSnglnsLfstsSrc() throws Exception {
		this.commonOpenApiImport("API_000000000000041");
	}
	
	/**
	 * "어린이집및유치원현황" 자료 수신
	 * @throws Exception
	 */
	public void getChildHouseKndrgrInfoSrc() throws Exception {
		this.commonOpenApiImport("API_000000000000051");
	}
	
	/**
	 * "종합병원산부인과현황" 자료 수신
	 * @throws Exception
	 */
	public void getObgynInfoSrcB() throws Exception {
		this.commonOpenApiImport("API_000000000000052");
	}
	
	/**
	 * "병원급산부인과현황" 자료 수신
	 * @throws Exception
	 */
	public void getObgynInfoSrcD() throws Exception {
		this.commonOpenApiImport("API_000000000000053");		
	}
	
	/**
	 * "전문병원급산부인과현황" 자료 수신
	 * @throws Exception
	 */
	public void getObgynInfoSrcF() throws Exception {
		this.commonOpenApiImport("API_000000000000054");		
	}
	
	/**
	 * "의원급산부인과현황" 자료 수신
	 * @throws Exception
	 */
	public void getObgynInfoSrcE() throws Exception {
		this.commonOpenApiImport("API_000000000000055");
	}
	
	public void commonOpenApiImport(String openapiId) throws Exception{
		PpaOpenApiImportVO ppaOpenApiImportVO = new PpaOpenApiImportVO();
		ppaOpenApiImportVO.setOpenapiId(openapiId);
		ppaOpenApiImportVO.setLawdCd("00000");
		ppaOpenApiImportVO.setYear("9999");
		ppaOpenApiImportVO.setUserID("SYSTEM");
		//openApiImportService.commonOpenApiImport(ppaOpenApiImportVO);
	}

}
