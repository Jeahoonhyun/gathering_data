package sgis.openapi.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import sgis.common.SgisAbstractDAO;
import sgis.openapi.service.ChildHouseKndrgrInfoSrcVO;
import sgis.openapi.service.IncruitApiVO;
import sgis.openapi.service.ObgynInfoSrcVO;
import sgis.openapi.service.PpaOpenApiImportVO;
import sgis.openapi.service.RlDlpcInfoSrcVO;
import sgis.openapi.service.WorknetOpenApiDetailVO;
import sgis.openapi.service.WorknetOpenApiListVO;

@Repository("openApiImportDAO")
public class OpenApiImportDAO extends SgisAbstractDAO{
	
	/**
	 * 워크넷 구인 자료 목록 저장 처리
	 * @param worknetOpenApiListVO
	 * @return
	 */
	 public String insertWorknetOpenApiList(WorknetOpenApiListVO worknetOpenApiListVO){
	     return (String)insert("OpenApiImportDAO.insertWorknetOpenApiList", worknetOpenApiListVO);
	 }
	 
	 /**
	  * 워크넷 구인 자료 상세 저장 처리
	  * @param worknetOpenApiDetailVO
	  * @return
	  */
	 public String insertWorknetOpenApiDetail(WorknetOpenApiDetailVO worknetOpenApiDetailVO){
		 return (String)insert("OpenApiImportDAO.insertWorknetOpenApiDetail", worknetOpenApiDetailVO);
	 }
	 
	 /**
	  * 인크루트 구인 신규 저장 처리
	  * @param incruitApiVO
	  * @return
	  */
	 public String insertIncruitApiJson(IncruitApiVO incruitApiVO){
	     return (String)insert("OpenApiImportDAO.insertIncruitApiJson", incruitApiVO);
	 }
	 
	 /**
	  * 인크루트 구인 목록 저장 처리
	  * @param incruitApiVO
	  * @return
	  */
	 public String insertIncruitApiMaster(IncruitApiVO incruitApiVO){
	     return (String)insert("OpenApiImportDAO.insertIncruitApiMaster", incruitApiVO);
	 }
	 
	 /**
	  * 인크루트 구인 상세 저장 처리
	  * @param incruitApiVO
	  * @return
	  */
	 public String insertIncruitApiDetail(IncruitApiVO incruitApiVO){
		 return (String)insert("OpenApiImportDAO.insertIncruitApiDetail", incruitApiVO);
	 }
		       
	/**
     * 실거래가정보(아파트,매매)_원시			
     * @param rlDlpcInfoSrcVO
     * @return
     */
    public String insertRlDlpcInfoAptTrdeSrc(RlDlpcInfoSrcVO rlDlpcInfoSrcVO){
        return (String)insert("OpenApiImportDAO.insertRlDlpcInfoAptTrdeSrc", rlDlpcInfoSrcVO);
    }
    /**
     * API01:아파트매매실거래가 삭제
     * @param yyyymm
     * @return
     */
    public int deleteRlDlpcInfoAptTrdeSrc(PpaOpenApiImportVO ppaOpenApiImportVO){
    	/* 기존자료 삭제 후 저장 */
    	return delete("OpenApiImportDAO.deleteRlDlpcInfoAptTrdeSrc", ppaOpenApiImportVO);
    }
    
    /**
     * 실거래가정보(연립/빌라,매매)_원시			
     * @param rlDlpcInfoSrcVO
     * @return
     */
    public String insertRlDlpcInfoRwhsTrdeSrc(RlDlpcInfoSrcVO rlDlpcInfoSrcVO){
        return (String)insert("OpenApiImportDAO.insertRlDlpcInfoRwhsTrdeSrc", rlDlpcInfoSrcVO);
    }
    /**
     * API02:연립/빌라매매실거래가 삭제
     * @param yyyymm
     * @return
     */
    public int deleteRlDlpcInfoRwhsTrdeSrc(PpaOpenApiImportVO ppaOpenApiImportVO){
    	/* 기존자료 삭제 후 저장 */
    	return delete("OpenApiImportDAO.deleteRlDlpcInfoRwhsTrdeSrc", ppaOpenApiImportVO);
    }
    
    
    
    /**
	 * 실거래가정보(단독/다가구,매매)_원시
	 * @param rlDlpcInfoSrcVO
	 * @return
	 */
    public String insertRlDlpcInfoSnglnsTrdeSrc(RlDlpcInfoSrcVO rlDlpcInfoSrcVO){
        return (String)insert("OpenApiImportDAO.insertRlDlpcInfoSnglnsTrdeSrc", rlDlpcInfoSrcVO);
    }
    /**
     * API03:단독/다세대매매실거래가 삭제
     * @param yyyymm
     * @return
     */
    public int deleteRlDlpcInfoSnglnsTrdeSrc(PpaOpenApiImportVO ppaOpenApiImportVO){
    	/* 기존자료 삭제 후 저장 */
    	return delete("OpenApiImportDAO.deleteRlDlpcInfoSnglnsTrdeSrc", ppaOpenApiImportVO);
    }
    
    /**
     * 실거래가정보(아파트,전월세)_원시			
     * @param rlDlpcInfoSrcVO
     * @return
     */
    public String insertRlDlpcInfoAptLfstsSrc(RlDlpcInfoSrcVO rlDlpcInfoSrcVO){
        return (String)insert("OpenApiImportDAO.insertRlDlpcInfoAptLfstsSrc", rlDlpcInfoSrcVO);
    }
    /**
     * API04:아파트전월세실거래가 삭제
     * @param yyyymm
     * @return
     */
    public int deleteRlDlpcInfoAptLfstsSrc(PpaOpenApiImportVO ppaOpenApiImportVO){
    	/* 기존자료 삭제 후 저장 */
    	return delete("OpenApiImportDAO.deleteRlDlpcInfoAptLfstsSrc", ppaOpenApiImportVO);
    }            
    
    /**
     * 실거래가정보(연립/빌라,전월세)_원시			
     * @param rlDlpcInfoSrcVO
     * @return
     */
    public String insertRlDlpcInfoRwhsLfstsSrc(RlDlpcInfoSrcVO rlDlpcInfoSrcVO){
        return (String)insert("OpenApiImportDAO.insertRlDlpcInfoRwhsLfstsSrc", rlDlpcInfoSrcVO);
    }
    /**
     * API05:연립/빌라전월세실거래가 삭제
     * @param yyyymm
     * @return
     */
    public int deleteRlDlpcInfoRwhsLfstsSrc(PpaOpenApiImportVO ppaOpenApiImportVO){
    	/* 기존자료 삭제 후 저장 */
    	return delete("OpenApiImportDAO.deleteRlDlpcInfoRwhsLfstsSrc", ppaOpenApiImportVO);
    }        
    
    /**
     * 실거래가정보(단독/다가구,전월세)_원시						
     * @param rlDlpcInfoSrcVO
     * @return
     */
    public String insertRlDlpcInfoSnglnsLfstsSrc(RlDlpcInfoSrcVO rlDlpcInfoSrcVO){
        return (String)insert("OpenApiImportDAO.insertRlDlpcInfoSnglnsLfstsSrc", rlDlpcInfoSrcVO);
    }
    /**
     * API06:단독/다세대전월세실거래가 삭제
     * @param yyyymm
     * @return
     */
    public int deleteRlDlpcInfoSnglnsLfstsSrc(PpaOpenApiImportVO ppaOpenApiImportVO){
    	/* 기존자료 삭제 후 저장 */
    	return delete("OpenApiImportDAO.deleteRlDlpcInfoSnglnsLfstsSrc", ppaOpenApiImportVO);
    }
    
    /**
     * 어린이집/유치원 정보 원시			
     * @param rlDlpcInfoSrcVO
     * @return
     */
    public String insertChildHouseKndrgrInfoSrc(ChildHouseKndrgrInfoSrcVO childHouseKndrgrInfoSrcVO){
        return (String)insert("OpenApiImportDAO.insertChildHouseKndrgrInfoSrc", childHouseKndrgrInfoSrcVO);
    }      
    /**
     * API07:어린이집및유치원현황 삭제
     * @param yyyymm
     * @return
     */
    public int deleteChildHouseKndrgrInfoSrc(String sigun_cd){    	
    	return delete("OpenApiImportDAO.deleteChildHouseKndrgrInfoSrc", sigun_cd);
    }
    
    /**
     * 종합병원산부인과현황/병원급산부인과현황 /전문병원급산부인과현황/의원급산부인과현황 정보 원시			
     * @param rlDlpcInfoSrcVO
     * @return
     */
    public String insertObgynInfoSrc(ObgynInfoSrcVO obgynInfoSrcVO){
        return (String)insert("OpenApiImportDAO.insertObgynInfoSrc", obgynInfoSrcVO);
    }
    /**
     * API08/API09/API10/API11:종합병원산부인과현황/병원급산부인과현황 /전문병원급산부인과현황/의원급산부인과현황 삭제
     * @param yyyymm
     * @return
     */
    public int deleteObgynInfoSrc(PpaOpenApiImportVO ppaOpenApiImportVO){
    	/* 기존자료 삭제 후 저장 */
    	/* 기존자료 삭제 후 저장 */
    	if("API08".equals(ppaOpenApiImportVO.getCategory())){ /* 종합병원산부인과현황 자료        */			
			ppaOpenApiImportVO.setCategoryNm("종합병원");
		}else if("API09".equals(ppaOpenApiImportVO.getCategory())){ /* 병원급산부인과현황 자료        */
			ppaOpenApiImportVO.setCategoryNm("병원");
		}else if("API10".equals(ppaOpenApiImportVO.getCategory())){ /* 전문병원급산부인과현황 자료        */
			ppaOpenApiImportVO.setCategoryNm("전문병원");
		}else if("API11".equals(ppaOpenApiImportVO.getCategory())){ /* 의원급산부인과현황 자료        */
			ppaOpenApiImportVO.setCategoryNm("의원");
		}	
    	return delete("OpenApiImportDAO.deleteObgynInfoSrc", ppaOpenApiImportVO);
    }
    
    /**
     * OpenAPI 정보 등록
     * @param ppaOpenApiImportVO
     * @return
     */
    public String insertOpenApiInfo(PpaOpenApiImportVO ppaOpenApiImportVO){
        return (String)insert("OpenApiImportDAO.insertOpenApiInfo", ppaOpenApiImportVO);
    }
    
    /**
     * OpenAPI 정보 수정 등록
     * @param ppaOpenApiImportVO
     * @return
     */
    public int updateOpenApiInfo(PpaOpenApiImportVO ppaOpenApiImportVO){
        return update("OpenApiImportDAO.updateOpenApiInfo", ppaOpenApiImportVO);
    }
    
    /**
     * OpenAPI 실행 처리 이력 저장
     * @param ppaOpenApiImportVO
     * @return
     */
    public String insertOpenApiExcuteHistory(PpaOpenApiImportVO ppaOpenApiImportVO){
        return (String)insert("OpenApiImportDAO.insertOpenApiExcuteHistory", ppaOpenApiImportVO);
    }
    
    /**
     * OpenAPI 정보 목록 조회
     * @param ppaOpenApiImportVO
     * @return
     */
    @SuppressWarnings("unchecked")
	public List<PpaOpenApiImportVO> selectOpenApiInfo(PpaOpenApiImportVO ppaOpenApiImportVO){
        return (List<PpaOpenApiImportVO>) list("OpenApiImportDAO.selectOpenApiInfo", ppaOpenApiImportVO);
    }
    
    /**
     * OpenAPI 정보 상세 조회
     * @param ppaOpenApiImportVO
     * @return
     * @throws Exception
     */
    public PpaOpenApiImportVO selectOpenApiInfoDetail(PpaOpenApiImportVO ppaOpenApiImportVO) throws Exception {
		return (PpaOpenApiImportVO) select("OpenApiImportDAO.selectOpenApiInfoDetail", ppaOpenApiImportVO);
	}
    
    /**
     * OpenAPI 정보 실행 이력목록 조회
     * @param ppaOpenApiImportVO
     * @return
     */
    @SuppressWarnings("unchecked")
	public List<PpaOpenApiImportVO> selectOpenApiExcuteHistory(PpaOpenApiImportVO ppaOpenApiImportVO){
        return (List<PpaOpenApiImportVO>) list("OpenApiImportDAO.selectOpenApiExcuteHistory", ppaOpenApiImportVO);
    }
    
    /**
     * OpenAPI 정보 실행이력 상세 조회
     * @param ppaOpenApiImportVO
     * @return
     * @throws Exception
     */
    public PpaOpenApiImportVO selectOpenApiExcuteHistoryDetail(PpaOpenApiImportVO ppaOpenApiImportVO) throws Exception {
		return (PpaOpenApiImportVO) select("OpenApiImportDAO.selectOpenApiExcuteHistoryDetail", ppaOpenApiImportVO);
	}
    
    /**
     * 시군구 목록 조회
     * @param ppaOpenApiImportVO
     * @return
     */
    @SuppressWarnings("unchecked")
	public List<PpaOpenApiImportVO> selectSigunguList(PpaOpenApiImportVO ppaOpenApiImportVO){
        return (List<PpaOpenApiImportVO>) list("OpenApiImportDAO.selectSigunguList", ppaOpenApiImportVO);
    }
 
    /**
     * 지난 월 
     * @return
     */
    public String selectLastMonth(){
		return (String) select("OpenApiImportDAO.selectLastMonth");
	}    
}
