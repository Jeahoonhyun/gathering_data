package sgis.openapi.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import sgis.openapi.service.KosisOpenApiImportService;
import sgis.openapi.service.KosisOpenApiVO;

@Service("kosisOpenApiImportService")
public class KosisOpenApiImportServiceImpl implements KosisOpenApiImportService {

	static Logger logger = Logger.getLogger(KosisOpenApiImportServiceImpl.class);
	
	@Resource(name="kosisOpenApiImportDAO")
	private KosisOpenApiImportDAO kosisOpenApiImportDAO;
	
	@Override
	public String getKosisOpenApiImport(KosisOpenApiVO kosisOpenApiVO) throws Exception {
		// TODO Auto-generated method stub
		String linkId = kosisOpenApiVO.getLink_id();
		String resultMsg = "";		
		
		if(linkId != null && !"".equals(linkId)){								                  
			resultMsg = this.excuteKosisApiJSON(kosisOpenApiVO);
		}
		
		return resultMsg;
	}

	private String excuteKosisApiJSON(KosisOpenApiVO kosisOpenApiVO) {
		// TODO Auto-generated method stub
		String resultMsg = "";
		
		try{
			KosisOpenApiVO vo = new KosisOpenApiVO();												

			String data = "";
			
			// kosis data 요청
			data = this.getJSONConnection(kosisOpenApiVO);

			if(data != null && data != ""){				
				
				JSONObject jo = new JSONObject(data);		
				JSONArray ja = jo.getJSONArray("data");
								
				int total = 0;
				
				for(int i=0; i < ja.length(); i++){
					try{
						vo.setItm_id(ja.getJSONObject(i).getString("ITM_ID"));															
					}catch(Exception e){
						vo.setItm_id("");
						logger.debug("===> 수신항목 없음 Pass : setItm_id");
					}
					try{
						vo.setItm_nm(ja.getJSONObject(i).getString("ITM_NM"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setItm_nm");
					}
					try{
						vo.setItm_nm_eng(ja.getJSONObject(i).getString("ITM_NM_ENG"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setItm_nm_eng");
					}
					try{
						vo.setOrg_id(ja.getJSONObject(i).getString("ORG_ID"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setOrg_id");
					}
					try{
						vo.setPrd_de(ja.getJSONObject(i).getString("PRD_DE"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setPrd_de");
					}
					try{
						vo.setPrd_se(ja.getJSONObject(i).getString("PRD_SE"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setPrd_se");
					}
					try{
						vo.setTbl_id(ja.getJSONObject(i).getString("TBL_ID"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setTbl_id");
					}
					try{
						vo.setTbl_nm(ja.getJSONObject(i).getString("TBL_NM"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setTbl_nm");
					}
					try{
						vo.setDt(ja.getJSONObject(i).getString("DT"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setDt");
					}
					try{
						vo.setUnit_nm(ja.getJSONObject(i).getString("UNIT_NM"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setUnit_nm");
					}
					try{
						vo.setUnit_nm_eng(ja.getJSONObject(i).getString("UNIT_NM_ENG"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setUnit_nm_eng");
					}
					try{
						vo.setC1(ja.getJSONObject(i).getString("C1"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC1");
					}
					try{
						vo.setC1_nm(ja.getJSONObject(i).getString("C1_NM"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC1_nm");
					}
					try{
						vo.setC1_nm_eng(ja.getJSONObject(i).getString("C1_NM_ENG"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC1_nm_eng");
					}
					try{
						vo.setC1_obj_nm(ja.getJSONObject(i).getString("C1_OBJ_NM"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC1_obj_nm");
					}
					try{
						vo.setC1_obj_nm_eng(ja.getJSONObject(i).getString("C1_OBJ_NM_ENG"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC1_obj_nm_eng");
					}
					try{
						vo.setC2(ja.getJSONObject(i).getString("C2"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC2");
					}
					try{
						vo.setC2_nm(ja.getJSONObject(i).getString("C2_NM"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC2_nm");
					}
					try{
						vo.setC2_nm_eng(ja.getJSONObject(i).getString("C2_NM_ENG"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC2_nm_eng");
					}
					try{
						vo.setC2_obj_nm(ja.getJSONObject(i).getString("C2_OBJ_NM"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC2_obj_nm");
					}
					try{
						vo.setC2_obj_nm_eng(ja.getJSONObject(i).getString("C2_OBJ_NM_ENG"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC2_obj_nm_eng");
					}
					try{
						vo.setC3(ja.getJSONObject(i).getString("C3"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC3");
					}
					try{
						vo.setC3_nm(ja.getJSONObject(i).getString("C3_NM"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC3_nm");
					}
					try{
						vo.setC3_nm_eng(ja.getJSONObject(i).getString("C3_NM_ENG"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC3_nm_eng");
					}
					try{
						vo.setC3_obj_nm(ja.getJSONObject(i).getString("C3_OBJ_NM"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC3_obj_nm");
					}
					try{
						vo.setC3_obj_nm_eng(ja.getJSONObject(i).getString("C3_OBJ_NM_ENG"));															
					}catch(Exception e){
						logger.debug("===> 수신항목 없음 Pass : setC3_obj_nm_eng");
					}
					
					vo.setLink_id(kosisOpenApiVO.getLink_id());
					
					// kosis 통계 자료 저장
					kosisOpenApiImportDAO.insertKosisData(vo);
					
					total = i;
				}															
				total = total + 1;
				resultMsg = "자료 수신이 완료 되었습니다.[total:"+total+"]";					
			}else{
				resultMsg = "공급자로 부터 수신된 자료가 없읍니다. 잠시 후 다시 시도바랍니다.";
			}									
        }catch (Exception e){
        	resultMsg = "오류가 발생하였습니다.["+e.getMessage()+"]";
        }finally{
        	/* 로그 ID 채번 후 저장 */
        	        	
        }
		return resultMsg;
	}

	private String getJSONConnection(KosisOpenApiVO kosisOpenApiVO) {
		// TODO Auto-generated method stub
		String addr = kosisOpenApiVO.getUrl();	
		// &amp; => & 치환
		addr = StringEscapeUtils.unescapeHtml3(addr);
		
		String param = "";
		String returnStr = "";							
		
		addr = addr + param;
		
		logger.debug("==============> Connect URL : " + addr);
		
		String data = "";
		
		try{
			URL url = new URL(addr);			
			
			URLConnection conn = url.openConnection();		
			conn.setRequestProperty("accept-language", "ko");		
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));                		        			
		    
		    data = "{\"data\":";
	        String msg = "";
	        
	        while((msg = br.readLine())!=null)
	        {
	        	data += msg;	        	           
	        }                
	        
	        data = data + "}";
	        
		}catch(Exception e){
			data = "Error : " + e.getMessage();
			logger.debug("==============> getJsonConnection.Exception : " + data);
		}finally{
			returnStr = data;
		}	
		        
        return returnStr;	
	}

}
