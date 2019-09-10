package sgis.openapi.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import sgis.openapi.service.IncruitApiImportService;
import sgis.openapi.service.IncruitApiVO;
import sgis.openapi.service.KosisOpenApiImportService;
import sgis.openapi.service.KosisOpenApiVO;
import sgis.openapi.service.OpenApiImportService;
import sgis.openapi.service.PpaOpenApiImportVO;
import sgis.openapi.service.WorknetOpenApiListVO;

@Controller
public class OpenApiController {
	static Logger logger = Logger.getLogger(OpenApiController.class);
	@Resource(name = "openApiImportService")
	private OpenApiImportService openApiImportService;
	
	@Resource(name = "incruitApiImportService")
	private IncruitApiImportService incruitApiImportService;
	
	@Resource(name = "kosisOpenApiImportService")
	private KosisOpenApiImportService kosisOpenApiImportService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;
	
	/**
	 * OpenAPI수급자료 실행 페이지 이동
	 *
	 * @param PpaOpenApiImportVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sgis/openapi/importOpenApiRegist.do")
	public String importOpenApiRegist(@ModelAttribute("importOpenApiVO") PpaOpenApiImportVO ppaOpenApiImportVO, ModelMap model) throws Exception {						
		
		model.addAttribute("importOpenApiVO", ppaOpenApiImportVO);

		return "sgis/openapi/openapiRegist";
	}
	
	/**
	 * 워크넷 수급자료 등록 실행
	 *
	 * @param importOpenApiVO 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sgis/openapi/importOpenApi.do")
	public String importOpenApi(@ModelAttribute("importOpenApiVO") WorknetOpenApiListVO worknetOpenApiListVO, BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {

		String resultMsg = "";
		
		resultMsg = openApiImportService.commonOpenApiImport(worknetOpenApiListVO);						
		
		model.addAttribute("resultMsg", resultMsg);

		return "forward:/sgis/openapi/openApiInfoList.do";
	}
	
	/**
	 * 인크루트 자료수집 등록 실행
	 * @param incruitApiVO
	 * @param bindingResult
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sgis/openapi/importIncruitApi.do")
	public String importIncruitApi(@ModelAttribute("importOpenApiVO") IncruitApiVO incruitApiVO, BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {

		String resultMsg = "";
		
		resultMsg = incruitApiImportService.commonIncruitApiImport(incruitApiVO);						
		
		model.addAttribute("resultMsg", resultMsg);

		return "forward:/sgis/openapi/openApiInfoList.do";
	}
	
	/**
	 * KOSIS 통계자료 수집
	 * @param kosisOpenApiVO
	 * @param bindingResult
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sgis/openapi/importKosisApi.do")
	public String importKosisApi(@ModelAttribute("importOpenApiVO") KosisOpenApiVO kosisOpenApiVO, BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {

		String resultMsg = "";
		
		kosisOpenApiVO.setLink_id(kosisOpenApiVO.getCategory());	// category -> link_id 재사용(인터페이스ID)
		resultMsg = kosisOpenApiImportService.getKosisOpenApiImport(kosisOpenApiVO);						
		
		model.addAttribute("resultMsg", resultMsg);

		return "forward:/sgis/openapi/openApiInfoList.do";
	}
	
	/**
	 * OpenAPI 정보 등록 페이지 이동
	 *
	 * @param PpaOpenApiImportVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sgis/openapi/openApiInfoRegist.do")
	public String openApiInfoRegist(@ModelAttribute("importOpenApiVO") PpaOpenApiImportVO ppaOpenApiImportVO, ModelMap model) throws Exception {

		model.addAttribute("importOpenApiVO", ppaOpenApiImportVO);

		return "sgis/openapi/openapiInfoRegist";
	}
	
	/**
	 * OpenAPI 정보 수정 등록 페이지 이동
	 *
	 * @param PpaOpenApiImportVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sgis/openapi/openApiInfoEdit.do")
	public String openApiInfoEdit(@ModelAttribute("importOpenApiVO") PpaOpenApiImportVO ppaOpenApiImportVO, ModelMap model) throws Exception {
		
		PpaOpenApiImportVO resultVO = openApiImportService.getOpenApiInfoDetail(ppaOpenApiImportVO);

		model.addAttribute("result", resultVO);
		model.addAttribute("sessionUniqId", "admin");

		model.addAttribute("importOpenApiVO", ppaOpenApiImportVO);

		return "sgis/openapi/openapiInfoEdit";
	}
	
	/**
	 * OpenAPI 정보 등록 실행
	 *
	 * @param importOpenApiVO 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sgis/openapi/openApiInfo.do")
	public String openApiInfo(@ModelAttribute("importOpenApiVO") PpaOpenApiImportVO ppaOpenApiImportVO, BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {


		openApiImportService.addOpenApiInfo(ppaOpenApiImportVO);

		//status.setComplete();
		return "forward:/sgis/openapi/openApiInfoList.do";
	}
	
	/**
	 * OpenAPI 정보 수정 등록 실행
	 *
	 * @param importOpenApiVO 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sgis/openapi/openApiInfoModify.do")
	public String openApiInfoModify(@ModelAttribute("importOpenApiVO") PpaOpenApiImportVO ppaOpenApiImportVO, BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {
		
		openApiImportService.editOpenApiInfo(ppaOpenApiImportVO);

		PpaOpenApiImportVO resultVO = openApiImportService.getOpenApiInfoDetail(ppaOpenApiImportVO);

		model.addAttribute("result", resultVO);
		model.addAttribute("sessionUniqId", "admin");		

		return "sgis/openapi/openapiInfoDetail";
	}
	
	/**
	 * OpenAPI 정보 등록  목록 페이지 이동
	 *
	 * @param PpaOpenApiImportVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sgis/openapi/openApiInfoList.do")
	public String openApiInfoList(@ModelAttribute("searchVO") PpaOpenApiImportVO ppaOpenApiImportVO , ModelMap model, HttpServletRequest request) throws Exception {
		// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
		//request.getSession().setAttribute("baseMenuNo", "1000000");

		//LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		ppaOpenApiImportVO.setPageUnit(propertyService.getInt("pageUnit"));
		ppaOpenApiImportVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(ppaOpenApiImportVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(ppaOpenApiImportVO.getPageUnit());
		paginationInfo.setPageSize(ppaOpenApiImportVO.getPageSize());

		ppaOpenApiImportVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		ppaOpenApiImportVO.setLastIndex(paginationInfo.getLastRecordIndex());
		ppaOpenApiImportVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<PpaOpenApiImportVO> resultList =  openApiImportService.getOpenApiInfo(ppaOpenApiImportVO);
		PpaOpenApiImportVO resultCnt = new PpaOpenApiImportVO();
		int totCnt = 0;
		if(resultList != null && resultList.size() > 0){
			resultCnt = resultList.get(0);
			totCnt = resultCnt.getTotCount();
		}				 

		paginationInfo.setTotalRecordCount(totCnt);
		

		model.addAttribute("resultList", resultList);
		model.addAttribute("ppaOpenApiImportVO", ppaOpenApiImportVO);
		model.addAttribute("paginationInfo", paginationInfo);

		return "sgis/openapi/openapiInfoList";
	}
	
	/**
	 * OpenAPI 등록 상세 페이지 이동
	 *
	 * @param PpaOpenApiImportVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sgis/openapi/openApiInfoDetail.do")
	public String openApiInfoDetail(@ModelAttribute("searchVO") PpaOpenApiImportVO ppaOpenApiImportVO, ModelMap model) throws Exception {

		PpaOpenApiImportVO resultVO = openApiImportService.getOpenApiInfoDetail(ppaOpenApiImportVO);

		model.addAttribute("result", resultVO);
		model.addAttribute("sessionUniqId", "admin");		

		return "sgis/openapi/openapiInfoDetail";
	}		
}
