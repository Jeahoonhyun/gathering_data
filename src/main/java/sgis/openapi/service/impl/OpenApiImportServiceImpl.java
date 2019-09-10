package sgis.openapi.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import sgis.openapi.service.OpenApiImportService;
import sgis.openapi.service.PpaOpenApiImportVO;
import sgis.openapi.service.WorknetOpenApiDetailVO;
import sgis.openapi.service.WorknetOpenApiListVO;
import sgis.openapi.service.WorknetOpenApiVO;

@Service("openApiImportService")
public class OpenApiImportServiceImpl implements OpenApiImportService {
		
	static Logger logger = Logger.getLogger(OpenApiImportServiceImpl.class);
	
	@Resource(name="openApiImportDAO")
	private OpenApiImportDAO openApiImportDAO;		
	
	/** ID Generation */    
	@Resource(name = "ppaOpenApiInfoIdGnrService")
    private EgovIdGnrService ppaOpenApiInfoIdGnrService;
	
	/** ID Generation */    
	@Resource(name = "ppaOpenApiImportIdGnrService")
    private EgovIdGnrService ppaOpenApiImportIdGnrService;
	
	/**
	 * OpenAPI 자료 관리
	 */
	@Override
	public String commonOpenApiImport(WorknetOpenApiListVO worknetOpenApiListVO) throws Exception {
		// TODO Auto-generated method stub
		String openapiId = worknetOpenApiListVO.getOpenapiId();
		String resultMsg = "";
		logger.debug("==============> openapiId check : " + openapiId);
		
		if(openapiId != null && !"".equals(openapiId)){								
			if("API90".equals(worknetOpenApiListVO.getCategory())){  // 워크넷 목록 자료 요청                        
				resultMsg = this.excuteOpenApi(worknetOpenApiListVO);
			}
			if("API95".equals(worknetOpenApiListVO.getCategory())){  // 인크루트 목록 자료 요청                        
				resultMsg = this.excuteOpenApi(worknetOpenApiListVO);
			}
		}
		
		return resultMsg;
	}
						
	/**
	 * 워크넷 OpenAPI 실행
	 * @param worknetOpenApiListVO
	 * @return
	 * @throws Exception
	 */
	private String excuteOpenApi(WorknetOpenApiListVO worknetOpenApiListVO) throws Exception{
		
		String resultMsg = "";
		String errorWantedAuthNo = "";
		
		try{
			WorknetOpenApiVO infoVO = new WorknetOpenApiVO();
			WorknetOpenApiListVO listVO = new WorknetOpenApiListVO();													
			WorknetOpenApiDetailVO detailVO = new WorknetOpenApiDetailVO();
			String data = "";
			
			// 워크넷 구인 자료 초최 목록 요청
			data = this.getXMLonConnection(worknetOpenApiListVO, "L");
			
			if(data != null && data != ""){
			
				// 워크넷 구인 자료 총 갯수 및 페이징 계산			
				infoVO = this.getWantedWorknetInfoXMLParser(data);		
			
				int total = infoVO.getTotal();
				int display = Integer.parseInt(worknetOpenApiListVO.getDisplay());
				int startPage = worknetOpenApiListVO.getStartPage();
				// int page = display * startPage; 
				int share = total/display;
				int mod = total%display;
				int totalPage = share;				
				
				if(mod > 0) totalPage += 1;																
				
				int pagingCnt = totalPage - startPage;
				int newStartPage = 0;
				
				// 계산된 페이징 갯수로 반복
				for(int i=0; i <= pagingCnt; i++){
					// 1페이지는 최초 실행 됨
					if(i > 0){
						newStartPage = startPage + i;
						worknetOpenApiListVO.setStartPage(newStartPage);
						data = this.getXMLonConnection(worknetOpenApiListVO, "L");
					}
					List<Element> result = this.getWantedWorknetListXMLParser(data);
					
					for(Element e:result){
						listVO.setWantedAuthNo(e.getChildText("wantedAuthNo"));
						listVO.setCompany(e.getChildText("company"));
						listVO.setTitle(e.getChildText("title"));
						listVO.setSalTpNm(e.getChildText("salTpNm"));
						listVO.setSal(e.getChildText("sal"));
						listVO.setRegion(e.getChildText("region"));
						listVO.setHolidayTpNm(e.getChildText("holidayTpNm"));
						listVO.setMinEdubg(e.getChildText("minEdubg"));
						if(e.getChildText("maxEdubg") != null){
							listVO.setMaxEdubg(e.getChildText("maxEdubg"));
						}else{
							listVO.setMaxEdubg("");
						}
						listVO.setCareer(e.getChildText("career"));
						listVO.setRegDt(e.getChildText("regDt"));
						listVO.setCloseDt(e.getChildText("closeDt"));
						listVO.setInfoSvc(e.getChildText("infoSvc"));
						listVO.setWantedInfoUrl(e.getChildText("wantedInfoUrl"));
						listVO.setZipCd(e.getChildText("zipCd"));
						listVO.setStrtnmCd(e.getChildText("strtnmCd"));
						listVO.setBasicAddr(e.getChildText("basicAddr"));
						listVO.setDetailAddr(e.getChildText("detailAddr"));
						listVO.setBusino(e.getChildText("busino"));
												
						// 워크넷 구인 자료 목록 저장
						try{
							openApiImportDAO.insertWorknetOpenApiList(listVO);
						}catch(Exception ex){
							// 중복키 발생 시 오류메시지 출력 후 계속 진행 : 발생원인은 자료 구축 진행 중 신규 구인 추가되어 뒤로 밀리려 다음 페이지에 동일한 구인자료가 조회되는 현상으로 보임
							logger.debug("==============> 워크넷 구인 자료 목록 저장 중 중복 오류 발생 errorWantedAuthNo check : " + listVO.getWantedAuthNo());
						}																													
						
						// 워크넷 구인 자료 상세 처리
						errorWantedAuthNo = listVO.getWantedAuthNo();
						worknetOpenApiListVO.setWantedAuthNo(listVO.getWantedAuthNo());
						worknetOpenApiListVO.setInfoSvc(listVO.getInfoSvc());
						detailVO = this.getWantedWorknetDetail(worknetOpenApiListVO);							
						if(detailVO.getWantedAuthNo() == null){
							detailVO.setWantedAuthNo(listVO.getWantedAuthNo());
							detailVO.setCorpNm("정보가 존재하지 않습니다:006");
						}
						if("E".equals(detailVO.getWantedAuthNo())){
							detailVO.setWantedAuthNo(listVO.getWantedAuthNo());
							detailVO.setCorpNm("This page contains the following errors");
						}
						
						try{
							openApiImportDAO.insertWorknetOpenApiDetail(detailVO);
						}catch(Exception ex){
							// 중복키 발생 시 오류메시지 출력 후 계속 진행 : 발생원인은 자료 구축 진행 중 신규 구인 추가되어 뒤로 밀리려 다음 페이지에 동일한 구인자료가 조회되는 현상으로 보임
							logger.debug("==============> 워크넷 구인 자료 상세 저장 중 중복 오류 발생 errorWantedAuthNo check : " + errorWantedAuthNo);
						}						
					}
				}
					
				resultMsg = "자료 수신이 완료 되었습니다.[total:"+total+"]";					
			}else{
				resultMsg = "공급자로 부터 수신된 자료가 없읍니다. 잠시 후 다시 시도바랍니다.";
			}									
        }catch (Exception e){
        	resultMsg = "오류가 발생하였습니다.[errorWantedAuthNo:"+errorWantedAuthNo+"]";
        }finally{
        	/* 로그 ID 채번 후 저장 */
        	        	
        }
		return resultMsg;
	}
	
		
	/**
	 * 워크넷 구인 상세자료 생성
	 * @param worknetOpenApiListVO
	 * @return
	 * @throws Exception
	 */
	private WorknetOpenApiDetailVO getWantedWorknetDetail(WorknetOpenApiListVO worknetOpenApiListVO) throws Exception{
		WorknetOpenApiDetailVO vo = new WorknetOpenApiDetailVO();
		String data = this.getXMLonConnection(worknetOpenApiListVO, "D");
		vo = this.getWantedWorknetDetailXMLParser(data);
		
		return vo;
	}
	
	/**
	 * 워크넷 구인 자료 수신 기본 정보 추출
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private WorknetOpenApiVO getWantedWorknetInfoXMLParser(String data) throws Exception{
		WorknetOpenApiVO vo = new WorknetOpenApiVO();
		
		//Get XML
		List<Element> list = new ArrayList<Element>();
		SAXBuilder sax = new SAXBuilder();
		Document doc = sax.build(new StringReader(data));
		Element root = doc.getRootElement();
							
		//get XML data
		vo.setTotal(Integer.parseInt(root.getChildText("total")));
		vo.setStartPage(Integer.parseInt(root.getChildText("startPage")));
		vo.setDisplay(root.getChildText("display"));		

		return vo;
	}
	
	/**
	 * 워크넷 구인 자료 목록 정보 추출
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	private List<Element> getWantedWorknetListXMLParser(String data) throws Exception{		
		//Get XML
		List<Element> list = new ArrayList<Element>();
		SAXBuilder sax = new SAXBuilder();
		Document doc = sax.build(new StringReader(data));
		Element root = doc.getRootElement();
							
		//get XML data
		// 워크넷 구인 목록 수신 데이터
		String name = "wanted";
		list = root.getChildren(name);		

		return list;
	}
	
	/**
	 * 워크넷 구인 자료 상세 정보 추출
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "unused" })
	private WorknetOpenApiDetailVO getWantedWorknetDetailXMLParser(String data) throws Exception{
		
		WorknetOpenApiDetailVO vo = new WorknetOpenApiDetailVO();
		
		try{
			logger.debug("==============> getWantedWorknetDetailXMLParser : Start");
			//Get XML
			List<Element> list = new ArrayList<Element>();
			SAXBuilder sax = new SAXBuilder();
			Document doc = sax.build(new StringReader(data));
			Element root = doc.getRootElement();
							
			logger.debug("==============> getWantedWorknetDetailXMLParser : doc.getRootElement()");
			//get XML data
			// 구인인증번호 추출
			vo.setWantedAuthNo(root.getChildText("wantedAuthNo"));
			logger.debug("==============> getWantedWorknetDetailXMLParser.wantedAuthNo : " + vo.getWantedAuthNo());
			
			// 워크넷 구인 상세 기업정보  데이터 추출				
			String name = "corpInfo";
			List<Element> corpInfoList = root.getChildren(name);
			
			for(Element e:corpInfoList){			
				vo.setCorpNm(e.getChildText("corpNm"));
				vo.setReperNm(e.getChildText("reperNm"));
				vo.setTotPsncnt(e.getChildText("totPsncnt"));
				vo.setCapitalAmt(e.getChildText("capitalAmt"));
				vo.setYrSalesAmt(e.getChildText("yrSalesAmt"));
				vo.setIndTpCdNm(e.getChildText("indTpCdNm"));
				vo.setBusiCont(e.getChildText("busiCont"));
				vo.setCorpAddr(e.getChildText("corpAddr"));
				vo.setHomePg(e.getChildText("homePg"));
				vo.setBusiSize(e.getChildText("busiSize"));
			}
			
			name = "wantedInfo";
			List<Element> wantedInfoList = root.getChildren(name);
			
			for(Element e:wantedInfoList){			
				vo.setJobsNm(e.getChildText("jobsNm"));
				vo.setWantedTitle(e.getChildText("wantedTitle"));
				vo.setRelJobsNm(e.getChildText("relJobsNm"));
				vo.setJobCont(e.getChildText("jobCont"));
				vo.setReceiptCloseDt(e.getChildText("receiptCloseDt"));
				vo.setEmpTpNm(e.getChildText("empTpNm"));
				vo.setCollectPsncnt(e.getChildText("collectPsncnt"));
				vo.setSalTpNm(e.getChildText("salTpNm"));
				vo.setEnterTpNm(e.getChildText("enterTpNm"));
				vo.setEduNm(e.getChildText("eduNm"));
				vo.setForLang(e.getChildText("forLang"));
				vo.setMajor(e.getChildText("major"));
				vo.setCertificate(e.getChildText("certificate"));
				vo.setMltsvcExcHope(e.getChildText("mltsvcExcHope"));
				vo.setCompAbl(e.getChildText("compAbl"));
				vo.setPfCond(e.getChildText("pfCond"));
				vo.setEtcPfCond(e.getChildText("etcPfCond"));
				vo.setSelMthd(e.getChildText("selMthd"));
				vo.setRcptMthd(e.getChildText("rcptMthd"));
				vo.setSubmitDoc(e.getChildText("submitDoc"));
				vo.setEtcHopeCont(e.getChildText("etcHopeCont"));
				vo.setWorkRegion(e.getChildText("workRegion"));
				vo.setIndArea(e.getChildText("indArea"));
				vo.setNearLine(e.getChildText("nearLine"));
				vo.setWorkdayWorkhrCont(e.getChildText("workdayWorkhrCont"));
				vo.setFourIns(e.getChildText("fourIns"));
				vo.setRetirepay(e.getChildText("retirepay"));
				vo.setEtcWelfare(e.getChildText("etcWelfare"));
				vo.setDisableCvntl(e.getChildText("disableCvntl"));
			}		
			
			name = "empchargeInfo";
			List<Element> empchargeInfoList = root.getChildren(name);
			
			for(Element e:empchargeInfoList){			
				vo.setEmpChargerDpt(e.getChildText("empChargerDpt"));
				vo.setContactTelno(e.getChildText("contactTelno"));
				vo.setChargerFaxNo(e.getChildText("chargerFaxNo"));
			}		
		}catch(Exception e){
			logger.debug("==============> getWantedWorknetDetailXMLParser.Exception : " + e.getMessage());
			vo.setWantedAuthNo("E");;
		}finally{
			
		}	
		return vo;
	}
	
	/**
	 * 워크넷 구인 자료  접속 수집
	 * @param ppaOpenApiImportVO
	 * @return
	 * @throws Exception
	 */
	private String getXMLonConnection(WorknetOpenApiListVO worknetOpenApiListVO, String callTp) throws Exception{
		String addr = worknetOpenApiListVO.getUrl();		
		String param = "";
		String returnStr = "";
		
		String authKey = worknetOpenApiListVO.getAuthKey();
		int startPage = worknetOpenApiListVO.getStartPage();
		String display = worknetOpenApiListVO.getDisplay();
		String regDate = worknetOpenApiListVO.getRegDate();
		String wantedAuthNo = worknetOpenApiListVO.getWantedAuthNo();
		String infoSvc = worknetOpenApiListVO.getInfoSvc();
		
		if("L".equals(callTp)){
			param = "?authKey="+authKey+"&callTp="+callTp+"&returnType=XML&startPage="+startPage+"&display="+display+"&regDate="+regDate;
		}else{
			param = "?authKey="+authKey+"&callTp="+callTp+"&returnType=XML&wantedAuthNo="+wantedAuthNo+"&infoSvc="+infoSvc;
		}					
		
		addr = addr + param;
		
		logger.debug("==============> Connect URL : " + addr + "==>startPage="+startPage);
		
		String data="";
		try{
			URL url = new URL(addr);					
			URLConnection conn = url.openConnection();		
			conn.setRequestProperty("accept-language", "ko");
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	        	        
	        String msg = null;
	        while((msg = br.readLine())!=null)
	        {
	            data += msg;
	        }
		}catch(Exception e){
			data = "Error : " + e.getMessage();
			logger.debug("==============> getXMLonConnection.Exception : " + data);
		}finally{
			returnStr = data;
		}
		
		        
        return returnStr;		
	}	
	
	@Override
	public int addOpenApiInfo(PpaOpenApiImportVO ppaOpenApiImportVO) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		try{
			String openapiId = ppaOpenApiInfoIdGnrService.getNextStringId();
			ppaOpenApiImportVO.setOpenapiId(openapiId);
			openApiImportDAO.insertOpenApiInfo(ppaOpenApiImportVO);
		}catch(Exception e){
			result = -1;
		}
		return result;
	}
	
	@Override
	public int editOpenApiInfo(PpaOpenApiImportVO ppaOpenApiImportVO) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		try{
			openApiImportDAO.updateOpenApiInfo(ppaOpenApiImportVO);
		}catch(Exception e){
			result = -1;
		}
		return result;
	}	

	@Override
	public List<PpaOpenApiImportVO> getOpenApiInfo(PpaOpenApiImportVO ppaOpenApiImportVO) throws Exception {
		// TODO Auto-generated method stub
		return openApiImportDAO.selectOpenApiInfo(ppaOpenApiImportVO);
	}

	@Override
	public PpaOpenApiImportVO getOpenApiInfoDetail(PpaOpenApiImportVO ppaOpenApiImportVO) throws Exception {
		// TODO Auto-generated method stub
		return openApiImportDAO.selectOpenApiInfoDetail(ppaOpenApiImportVO);
	}	
		
}
