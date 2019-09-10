package sgis.openapi.service.impl;

import org.springframework.stereotype.Repository;

import sgis.common.SgisAbstractDAO;
import sgis.openapi.service.KosisOpenApiVO;

@Repository("kosisOpenApiImportDAO")
public class KosisOpenApiImportDAO extends SgisAbstractDAO{
	
	/**
	 * kosis 통계자료 저장
	 * @param kosisOpenApiVO
	 * @return
	 */
	 public String insertKosisData(KosisOpenApiVO kosisOpenApiVO){
	     return (String)insert("KosisOpenApiImportDAO.insertKosisData", kosisOpenApiVO);
	 }	 	 
}
