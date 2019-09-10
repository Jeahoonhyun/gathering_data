package sgis.openapi.service;

import java.util.List;

import sgis.openapi.service.PpaOpenApiImportVO;

public interface OpenApiImportService {
	
	public String commonOpenApiImport(WorknetOpenApiListVO worknetOpenApiListVO) throws Exception;
	
	public int addOpenApiInfo(PpaOpenApiImportVO ppaOpenApiImportVO)throws Exception;
	
	public int editOpenApiInfo(PpaOpenApiImportVO ppaOpenApiImportVO)throws Exception;
	
	public List<PpaOpenApiImportVO> getOpenApiInfo(PpaOpenApiImportVO ppaOpenApiImportVO)throws Exception;
	
	public PpaOpenApiImportVO getOpenApiInfoDetail(PpaOpenApiImportVO ppaOpenApiImportVO)throws Exception;	
	
}
