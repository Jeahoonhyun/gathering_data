package sgis.openapi.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.math.BigInteger;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;

import org.apache.log4j.Logger;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import sgis.openapi.service.IncruitApiImportService;
import sgis.openapi.service.IncruitApiVO;

@Service("incruitApiImportService")
public class IncruitApiImportServiceImpl implements IncruitApiImportService {
		
	static Logger logger = Logger.getLogger(IncruitApiImportServiceImpl.class);
	
	@Resource(name="openApiImportDAO")
	private OpenApiImportDAO openApiImportDAO;		
	
	/** ID Generation */    
	@Resource(name = "ppaOpenApiInfoIdGnrService")
    private EgovIdGnrService ppaOpenApiInfoIdGnrService;
	
	/** ID Generation */    
	@Resource(name = "ppaOpenApiImportIdGnrService")
    private EgovIdGnrService ppaOpenApiImportIdGnrService;
	
	/**
	 * 인크루트 자료 수집
	 */
	@Override
	public String commonIncruitApiImport(IncruitApiVO incruitApiVO) throws Exception {
		// TODO Auto-generated method stub
		String openapiId = incruitApiVO.getOpenapiId();
		String resultMsg = "";		
		
		if(openapiId != null && !"".equals(openapiId)){								
			if("API95".equals(incruitApiVO.getCategory())){  // 인크루트 목록 자료 요청                        
				resultMsg = this.excuteIncruitApiJSON(incruitApiVO);
			}
		}
		
		return resultMsg;
	}
						
	/**
	 * 인크루트 자료 수신 : JSON Type
	 * @param incruitApiVO
	 * @return
	 * @throws Exception
	 */
	private String excuteIncruitApiJSON(IncruitApiVO incruitApiVO) throws Exception{
		
		String resultMsg = "";
		String errorDocId = "";
		
		try{
			IncruitApiVO infoVO = new IncruitApiVO();
			IncruitApiVO listVO = new IncruitApiVO();													

			String data = "";
			
			// 인크루트 구인 자료 초최 목록 요청
			data = this.getJSONConnection(incruitApiVO);
			//data = this.getJSONConnectionFile(incruitApiVO);
			
			if(data != null && data != ""){				
				
				JSONObject jo = new JSONObject(data);				
				JSONArray ja = jo.getJSONObject("response").getJSONArray("data");
								
				String docId = "";
				int total = 0;
				
				for(int i=0; i < ja.length(); i++){
					listVO.setCompanyNmCore(ja.getJSONObject(i).getString("Company_Nm_Core"));
					listVO.setDocId(ja.getJSONObject(i).getString("DOCID"));
					listVO.setIndusNmList(ja.getJSONObject(i).getString("Indus_Nm_List"));
					listVO.setCompanyAddr(ja.getJSONObject(i).getString("Company_Addr"));
					listVO.setBizRegistNo(ja.getJSONObject(i).getString("Biz_Regist_No"));
					
					listVO.setEmpYnEntry(ja.getJSONObject(i).getString("Emp_Yn_Entry"));
					listVO.setEmpYnExper(ja.getJSONObject(i).getString("Emp_Yn_Exper"));
					listVO.setEmployLimitYn(ja.getJSONObject(i).getString("Employ_Limit_Yn"));
					listVO.setInviteCloseDt(ja.getJSONObject(i).getString("Invite_Close_Dt"));
					listVO.setInviteStartDt(ja.getJSONObject(i).getString("Invite_Start_Dt"));
					listVO.setCareerNm(ja.getJSONObject(i).getString("Career_Nm"));
					listVO.setJobTitle(ja.getJSONObject(i).getString("Job_Title"));
					listVO.setOccuNmList(ja.getJSONObject(i).getString("Occu_Nm_List"));
					listVO.setRegionNmList(ja.getJSONObject(i).getString("Region_Nm_List"));
					//listVO.setSalary1(Integer.toString(ja.getJSONObject(i).getInt("Salary_1")));
					//listVO.setSalary2(Integer.toString(ja.getJSONObject(i).getInt("Salary_2")));
					listVO.setSalary1(ja.getJSONObject(i).getString("Salary_Detail"));
					listVO.setSalary2("0");
					
					
					listVO.setScholNm(ja.getJSONObject(i).getString("Schol_Nm"));
					listVO.setEmployCnt(ja.getJSONObject(i).getString("Employ_Cnt"));
					listVO.setLicenseNmList(ja.getJSONObject(i).getString("License_Nm_List"));
					listVO.setSubwayNmList(ja.getJSONObject(i).getString("Subway_Nm_List"));
					listVO.setLinkUrl(ja.getJSONObject(i).getString("Link_Url"));
					listVO.setPstnNmList(ja.getJSONObject(i).getString("PSTN_NM_LIST"));										
					
					try{
						listVO.setSalaryNegoYn(ja.getJSONObject(i).getString("Salary_Nego_Yn"));
					}catch(Exception e){
						System.out.println("===> docId : " + docId + " <== Salary_Nego_Yn(연봉협의) 항목이 없습니다.");
					}
					try{
						listVO.setCompScaleNm(ja.getJSONObject(i).getString("Comp_Scale_Nm"));
					}catch(Exception e){
						System.out.println("===> docId : " + docId + " <== Comp_Scale_Nm(회사규모) 항목이 없습니다.");
					}
					try{
						listVO.setEmployTyNmList(ja.getJSONObject(i).getString("Employ_Ty_Nm_List"));
					}catch(Exception e){
						System.out.println("===> docId : " + docId + " <== Employ_Ty_Nm_List(고용형태) 항목이 없습니다.");
					}					
					
					// 인크루트 구인 자료 신규 저장
					openApiImportDAO.insertIncruitApiJson(listVO);
					
					total = i;
				}																						
					
				resultMsg = "자료 수신이 완료 되었습니다.[total:"+total+"]";					
			}else{
				resultMsg = "공급자로 부터 수신된 자료가 없읍니다. 잠시 후 다시 시도바랍니다.";
			}									
        }catch (Exception e){
        	resultMsg = "오류가 발생하였습니다.[errorDocId:"+errorDocId+"]["+e.getMessage()+"]";
        }finally{
        	/* 로그 ID 채번 후 저장 */
        	        	
        }
		return resultMsg;
	}	
	
	/**
	 * 인크루트 구인 자료 수신 접속 JSON
	 * @param incruitApiVO
	 * @param callTp
	 * @return
	 * @throws Exception
	 */
	private String getJSONConnection(IncruitApiVO incruitApiVO) throws Exception{
		String addr = incruitApiVO.getUrl();		
		String param = "";
		String returnStr = "";
		String accept = "application/json";
		
		String INC_CP_CLIENTKEY = incruitApiVO.getIncCpClientkey();						
		
		addr = addr + param;
		
		logger.debug("==============> Connect URL : " + addr);
		
		String data = "";
		
		try{
			URL url = new URL(addr);					
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			
			// SSL setting  
			SSLContext context = SSLContext.getInstance("TLSv1.2");  // 인크루트 전용 TLSv1.2 사용 (java1.8 기본 적용)
			context.init(null, null, null);  // No validation for now  
			conn.setSSLSocketFactory(context.getSocketFactory());  
			  
			conn.setRequestMethod("GET");
			conn.setRequestProperty("INC_CP_CLIENTKEY", INC_CP_CLIENTKEY );
			conn.setRequestProperty("Accept", accept );
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	        	        
	        String msg = null;
	        
	        while((msg = br.readLine())!=null)
	        {
	            data += msg;
	        }	        
	        
		}catch(Exception e){
			data = "Error : " + e.getMessage();
			logger.debug("==============> getJsonConnection.Exception : " + data);
		}finally{
			returnStr = data;
		}	
		        
        return returnStr;		
	}	
	
	/**
	 * 인크루트 구인 자료 File
	 * @param incruitApiVO
	 * @param callTp
	 * @return
	 * @throws Exception
	 */
	private String getJSONConnectionFile(IncruitApiVO incruitApiVO) throws Exception{
		String addr = incruitApiVO.getUrl();		
		String param = "";
		String returnStr = "";
		String accept = "application/json";
		
		String INC_CP_CLIENTKEY = incruitApiVO.getIncCpClientkey();						
		
		addr = addr + param;
		
		logger.debug("==============> Connect URL : " + addr);
		
		String data = "";
		
		try{
			// 파일읽기
			Path path = Paths.get("D:\\getData\\incruitJobData.txt");
			// 캐릿터셋 설정
			Charset cs = StandardCharsets.UTF_8;		
			// 파일 리스트에 담기
			List<String> list = new ArrayList<String>();
			
			list = Files.readAllLines(path, cs);
			
			for(String readLine:list){
				data += readLine;			
			}
	        
		}catch(Exception e){
			data = "Error : " + e.getMessage();
			logger.debug("==============> getJsonConnection.Exception : " + data);
		}finally{
			returnStr = data;
		}	
		        
        return returnStr;		
	}	
	
	/**
	 * 인크루트 자료 수신 
	 * @param incruitApiVO
	 * @return
	 * @throws Exception
	 */
	private String excuteIncruitApi(IncruitApiVO incruitApiVO) throws Exception{
		
		String resultMsg = "";
		String errorDocId = "";
		
		try{
			IncruitApiVO infoVO = new IncruitApiVO();
			IncruitApiVO listVO = new IncruitApiVO();													
			IncruitApiVO detailVO = new IncruitApiVO();
			String data = "";
			
			// 인크루트 구인 자료 초최 목록 요청
			data = this.getXMLonConnection(incruitApiVO, "L");
			
			if(data != null && data != ""){
			
				// 인크루트 구인 자료 총 갯수 및 페이징 계산			
				infoVO = this.getWantedIncruitInfoXMLParser(data);		
			
				int total = infoVO.getTotalCount();
				int size = incruitApiVO.getSize();
				int start = incruitApiVO.getStart();
 
				int share = total/size;
				int mod = total%size;
				int totalPage = share;				
				
				if(mod > 0) totalPage += 1;																
				
				int pagingCnt = totalPage - start;
				int newStartPage = 0;
				//logger.debug("==============> First page set : " + total + "|" + size+ "|" + start+ "|" + share+ "|" + mod+ "|" + totalPage+ "|" + pagingCnt);
				// 계산된 페이징 갯수로 반복
				for(int i=0; i <= pagingCnt; i++){
					// 1페이지는 최초 실행 됨
					if(i > 0){
						newStartPage = i * size;
						incruitApiVO.setStart(newStartPage);
						data = this.getXMLonConnection(incruitApiVO, "L");
					}
					List<Element> result = this.getWantedIncruitMasterXMLParser(data);
					
					if(result != null){
						for(Element e:result){
							/*listVO.setEmpTyNm(e.getChildText("Emp_Ty_Nm"));
							listVO.setEmpYnEntry(e.getChildText("Emp_Yn_Entry"));
							listVO.setModDate(e.getChildText("Mod_Date"));
							listVO.setEmpYnExper(e.getChildText("Emp_Yn_Exper"));
							listVO.setSalary2(e.getChildText("Salary_2"));
							listVO.setSalary1(e.getChildText("Salary_1"));
							listVO.setCompanyNm(e.getChildText("Company_Nm"));
							listVO.setJobTitle(e.getChildText("Job_Title"));
							listVO.setCareerYear2(e.getChildText("Career_Year_2"));
							listVO.setRegDate(e.getChildText("Reg_Date"));
							listVO.setCareerYear1(e.getChildText("Career_Year_1"));
							listVO.setInviteclosedt(e.getChildText("Invite_close_dt"));
							listVO.setDocId(e.getChildText("DOCID"));
							listVO.setSubwayNmListSch(e.getChildText("Subway_Nm_List_Sch"));
							listVO.setSalaryNm(e.getChildText("Salary_Nm"));
							listVO.setInviteStartDt(e.getChildText("Invite_Start_Dt"));
							listVO.setCareerRequire(e.getChildText("Career_Require"));
							listVO.setIndusNmList(e.getChildText("Indus_Nm_List"));
							listVO.setRegionNmFullListSch(e.getChildText("Region_Nm_Full_List_Sch"));
							listVO.setScholRequire(e.getChildText("Schol_Require"));
													
							listVO.setPageInfo("First page set : " + total + "|" + size+ "|" + share+ "|" + mod+ "|" + totalPage+ "|" + pagingCnt+"|" + listVO.getDocId()+ "|" + incruitApiVO.getStart());
							// 인크루트 구인 자료 목록 저장
							openApiImportDAO.insertIncruitApiMaster(listVO);																							
							
							// 인크루트 구인 자료 상세 처리
							errorDocId = listVO.getDocId();
							incruitApiVO.setDocId(listVO.getDocId());
							detailVO = this.getWantedIncruitDetail(incruitApiVO);
							
							if(detailVO.getDocId() == null){
								detailVO.setWantedAuthNo(listVO.getDocId());
								//detailVO.setCompanyNm("정보가 존재하지 않습니다");
							}
							if("E".equals(detailVO.getDocId())){
								detailVO.setWantedAuthNo(listVO.getDocId());
								//detailVO.setCompanyNm("This page contains the following errors");
							}
							openApiImportDAO.insertIncruitApiDetail(detailVO);		*/										
						}
					}					
				}
					
				resultMsg = "자료 수신이 완료 되었습니다.[total:"+total+"]";					
			}else{
				resultMsg = "공급자로 부터 수신된 자료가 없읍니다. 잠시 후 다시 시도바랍니다.";
			}									
        }catch (Exception e){
        	resultMsg = "오류가 발생하였습니다.[errorDocId:"+errorDocId+"]["+e.getMessage()+"]";
        }finally{
        	/* 로그 ID 채번 후 저장 */
        	        	
        }
		return resultMsg;
	}			
	
	/**
	 * 인크루트 수신 자료 정보 파싱
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private IncruitApiVO getWantedIncruitInfoXMLParser(String data) throws Exception{
		IncruitApiVO vo = new IncruitApiVO();
		
		//Get XML
		List<Element> list = new ArrayList<Element>();
		SAXBuilder sax = new SAXBuilder();
		Document doc = sax.build(new StringReader(data));
		Element root = doc.getRootElement();
							
		//get Info XML data
		String response = "response";		
		Element items = root.getChild(response);
		vo.setStart(Integer.parseInt(items.getChildText("start")));
		vo.setTotalCount(Integer.parseInt(items.getChildText("totalCount")));		

		return vo;
	}
	
	/**
	 * 인크루트 구인 목록 정보 파싱
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	private List<Element> getWantedIncruitMasterXMLParser(String data) throws Exception{
		
		logger.debug("==============> getWantedIncruitMasterXMLParser : Master");
		List<Element> dataList = null;
		
		try{
			//Get XML
			SAXBuilder sax = new SAXBuilder();
			Document doc = sax.build(new StringReader(data));
			Element root = doc.getRootElement();
								
			//get XML data
			// 인크루트 구인 목록 수신 데이터
			String response = "response";		
			Element items = root.getChild(response);
			dataList = items.getChildren("data");
		}catch(Exception e){
			logger.debug("==============> getWantedIncruitMasterXMLParser : Error" + e.getMessage());
		}finally{
			
		}
		

		return dataList;
	}
	
	/**
	 * 인크루트 구인 상세 정보 파싱
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "unused" })
	private IncruitApiVO getWantedIncruitDetailXMLParser(String data) throws Exception{
		
		IncruitApiVO vo = new IncruitApiVO();
		
		try{
			logger.debug("==============> getWantedIncruitDetailXMLParser : Detail");
			//Get XML
			List<Element> list = new ArrayList<Element>();
			SAXBuilder sax = new SAXBuilder();
			Document doc = sax.build(new StringReader(data));
			Element root = doc.getRootElement();
							
			//get XML data						
			// 인크루트 구인 상세 정보  데이터 추출				
			String response = "response";		
			Element items = root.getChild(response);
			List<Element> dataList = items.getChildren("data");
			
			for(Element e:dataList){/*
				vo.setOccuNmList(e.getChildText("Occu_Nm_List"));
				vo.setEmpTyNm(e.getChildText("Emp_Ty_Nm"));
				vo.setModDate(e.getChildText("Mod_Date"));
				vo.setPstNmList(e.getChildText("PSTN_NM_LIST"));
				vo.setJobCont(e.getChildText("JOB_CONT"));
				vo.setCompanyNm(e.getChildText("Company_Nm"));
				vo.setCompAddr(e.getChildText("Comp_Addr"));
				vo.setJobTitle(e.getChildText("Job_Title"));
				vo.setInviteclosedt(e.getChildText("Invite_close_dt"));
				vo.setDocId(e.getChildText("DOCID"));
				vo.setCareerRequire(e.getChildText("Career_Require"));
				vo.setRegionNmFullListSch(e.getChildText("Region_Nm_Full_List_Sch"));
				vo.setScholRequire(e.getChildText("Schol_Require"));	*/		
			}	
									
		}catch(Exception e){
			logger.debug("==============> getWantedIncruitDetailXMLParser.Exception : " + e.getMessage());
			vo.setDocId("E");
		}finally{
			
		}	
		return vo;
	}
	
	/**
	 * 인크루트 구인 자료 수신 접속
	 * @param incruitApiVO
	 * @param callTp
	 * @return
	 * @throws Exception
	 */
	private String getXMLonConnection(IncruitApiVO incruitApiVO, String callTp) throws Exception{
		String addr = incruitApiVO.getUrl();		
		String param = "";
		String returnStr = "";
		String accept = "application/xml";
		
		String INC_CP_CLIENTKEY = incruitApiVO.getIncCpClientkey();
		int start = incruitApiVO.getStart();
		int size = incruitApiVO.getSize();
		String docId = incruitApiVO.getDocId();
		
		if("L".equals(callTp)){
			param = "?start=" + start + "&size=" + size;
		}else{
			param = "/" + docId;
		}					
		
		addr = addr + param;
		
		logger.debug("==============> Connect URL : " + addr + " ==> start=" + start);
		
		String data = "<result>";
		
		try{
			URL url = new URL(addr);					
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			
			// SSL setting  
			SSLContext context = SSLContext.getInstance("TLSv1.2");  // 인크루트 전용 TLSv1.2 사용 (java1.8 기본 적용)
			context.init(null, null, null);  // No validation for now  
			conn.setSSLSocketFactory(context.getSocketFactory());  
			  
			conn.setRequestMethod("GET");
			conn.setRequestProperty("INC_CP_CLIENTKEY", INC_CP_CLIENTKEY );
			conn.setRequestProperty("Accept", accept );
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	        	        
	        String msg = null;
	        
	        while((msg = br.readLine())!=null)
	        {
	            data += msg;
	        }
	        
	        data += "</result>";
	        
		}catch(Exception e){
			data = "Error : " + e.getMessage();
			logger.debug("==============> getXMLonConnection.Exception : " + data);
		}finally{
			returnStr = data;
		}
		
		// logger.debug("==============> getXMLonConnection.Data : " + data);
		        
        return returnStr;		
	}		
	
	/**
	 * 인크루트 구인 상세자료 생성
	 * @param incruitApiVO
	 * @return
	 * @throws Exception
	 */
	private IncruitApiVO getWantedIncruitDetail(IncruitApiVO incruitApiVO) throws Exception{
		IncruitApiVO vo = new IncruitApiVO();
		String data = this.getXMLonConnection(incruitApiVO, "D");
		vo = this.getWantedIncruitDetailXMLParser(data);
		
		return vo;
	}		
}
