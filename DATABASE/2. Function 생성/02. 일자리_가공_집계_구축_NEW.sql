CREATE OR REPLACE FUNCTION FN_JOB_DATA_SM_MART_NEW(p_date CHAR(8))
	RETURNS TEXT
    AS $$

DECLARE
	
i_worknet_cnt INTEGER;
i_incruit_cnt INTEGER;

BEGIN	
	
	/* ---------------------------------------------------------------------------------------------------------
    Step00. 구인 자료 집계
    => 2018.10.01 중복제거 구인현황 자료 구축(2개월 이내 구인 중복 제거)
    => 2018.11.26 전체 현황으로 고객의 요청으로 변경(srv_dt_job_sm_refine_mapping 건수와 집계 건수 일치 되도록 변경 함)
    => 2018.12.01 워크넷 장애로 인하여 자료 수집이 안될 경우 전날 자료를 복사하여 집계 하도록 함
    => 2019.01.03 마감구인자료 중복 제거 후 집계 처리 변경(359) / 전날 정제자료 이관 jo_no키 재발급 수정(36, 59)
 	--------------------------------------------------------------------------------------------------------- */
	/* -------------------------------------------------------------------------
    Step00-01. 전날 정제자료 조회
 	------------------------------------------------------------------------- */
	-- 워크넷 수집 여부 확인
	SELECT count(*)	INTO i_worknet_cnt
	  FROM jobsvc.srv_dt_job_sm_refine_mapping 
	 WHERE create_dt = p_date
	   AND jo_data_div = 'W'
	;
	
	-- 워크넷 수집 정보가 없으면
	IF i_worknet_cnt < 1 THEN
		INSERT 
		  INTO jobsvc.srv_dt_job_sm_refine_mapping
		     ( jo_no, corp_nm, bsnm_no, indust_class, entrprs_type, corp_sz, labrr_cnt, corp_addr, cap, main_nm, year_sales, main_biz_content, corp_hpage, recru_nm, career, acdmcr, wage_type, salary, work_type, emplym_type, rcrit_jssfc, rcrit_psn, reg_dt, clos_dt, jo_data_div, jo_data_key, work_region, work_addr, sido_cd, sgg_cd, emdong_cd, api_name, addr
		     , create_dt, pblanc_no, jo_auth_no
		     , rid, x, y, mapping_status, pnu, mgt, tot_oa_cd, tot_x, tot_y )
		SELECT SUBSTRING(p_date,5,8)||SUBSTRING(jo_no,5,16), corp_nm, bsnm_no, indust_class, entrprs_type, corp_sz, labrr_cnt, corp_addr, cap, main_nm, year_sales, main_biz_content, corp_hpage, recru_nm, career, acdmcr, wage_type, salary, work_type, emplym_type, rcrit_jssfc, rcrit_psn, reg_dt, clos_dt, jo_data_div, jo_data_key, work_region, work_addr, sido_cd, sgg_cd, emdong_cd, api_name, addr
		     , p_date, pblanc_no, jo_auth_no
		     , rid, x, y, mapping_status, pnu, mgt, tot_oa_cd, tot_x, tot_y 
		  FROM jobsvc.srv_dt_job_sm_refine_mapping 
		 WHERE create_dt = TO_CHAR(p_date::TIMESTAMP - '1 days'::INTERVAL,'yyyymmdd')
		   AND jo_data_div = 'W'
		;		
	END IF;
	
	-- 인크루트 수집 여부 확인
	SELECT count(*)	 INTO i_incruit_cnt
	  FROM jobsvc.srv_dt_job_sm_refine_mapping 
	 WHERE create_dt = p_date
	   AND jo_data_div = 'I'
	;
	
	-- 인크루트 수집 정보가 없으면
	IF i_incruit_cnt < 1 THEN
		INSERT 
		  INTO jobsvc.srv_dt_job_sm_refine_mapping
		     ( jo_no, corp_nm, bsnm_no, indust_class, entrprs_type, corp_sz, labrr_cnt, corp_addr, cap, main_nm, year_sales, main_biz_content, corp_hpage, recru_nm, career, acdmcr, wage_type, salary, work_type, emplym_type, rcrit_jssfc, rcrit_psn, reg_dt, clos_dt, jo_data_div, jo_data_key, work_region, work_addr, sido_cd, sgg_cd, emdong_cd, api_name, addr
		     , create_dt, pblanc_no, jo_auth_no
		     , rid, x, y, mapping_status, pnu, mgt, tot_oa_cd, tot_x, tot_y )
		SELECT SUBSTRING(p_date,5,8)||SUBSTRING(jo_no,5,16), corp_nm, bsnm_no, indust_class, entrprs_type, corp_sz, labrr_cnt, corp_addr, cap, main_nm, year_sales, main_biz_content, corp_hpage, recru_nm, career, acdmcr, wage_type, salary, work_type, emplym_type, rcrit_jssfc, rcrit_psn, reg_dt, clos_dt, jo_data_div, jo_data_key, work_region, work_addr, sido_cd, sgg_cd, emdong_cd, api_name, addr
		     , p_date, pblanc_no, jo_auth_no
		     , rid, x, y, mapping_status, pnu, mgt, tot_oa_cd, tot_x, tot_y 
		  FROM jobsvc.srv_dt_job_sm_refine_mapping 
		 WHERE create_dt = TO_CHAR(p_date::TIMESTAMP - '1 days'::INTERVAL,'yyyymmdd')
		   AND jo_data_div = 'I'
		;		
	END IF;
	
 	/* -------------------------------------------------------------------------
    Step00-01-1. 작업당일 집계 자료 삭제
 	------------------------------------------------------------------------- */
 	-- RAISE INFO '=> Step00-01. 작업당일 집계 자료 삭제 '; 
 	DELETE FROM jobsvc.srv_dt_job_sm_dupl_remove WHERE create_dt = p_date;
	DELETE FROM jobsvc.srv_dt_job_hope_area_sm WHERE reg_dt = p_date;
	DELETE FROM jobsvc.srv_dt_job_entrprs_type_sm WHERE reg_dt = p_date;
	DELETE FROM jobsvc.srv_dt_job_corp_sz_sm WHERE reg_dt = p_date;
	DELETE FROM jobsvc.srv_dt_job_indust_class_sm WHERE reg_dt = p_date;
	DELETE FROM jobsvc.srv_dt_job_jssfc_sm WHERE reg_dt = p_date;
	DELETE FROM jobsvc.srv_dt_job_salary_sm WHERE reg_dt = p_date;
	DELETE FROM jobsvc.srv_dt_job_emplym_type_sm WHERE reg_dt = p_date;
	DELETE FROM jobsvc.srv_dt_job_work_type_sm WHERE reg_dt = p_date;
	DELETE FROM jobsvc.srv_dt_job_acdmcr_sm WHERE reg_dt = p_date;
	DELETE FROM jobsvc.srv_dt_job_career_sm WHERE reg_dt = p_date;
	DELETE FROM jobsvc.srv_dt_job_board_sm WHERE reg_dt = p_date;

	/* -------------------------------------------------------------------------
    Step00-02. TOT_OA_CD => 시도/시군구/읍면동 가공
 	------------------------------------------------------------------------- */
 	-- RAISE INFO '=> Step00-02. TOT_OA_CD => 시도/시군구/읍면동 가공 '; 
	UPDATE jobsvc.srv_dt_job_sm_refine_mapping 
	   SET sido_cd = SUBSTRING(tot_oa_cd,1,2)
	     , sgg_cd = SUBSTRING(tot_oa_cd,3,3)
	     , emdong_cd = SUBSTRING(tot_oa_cd,6,2) 
	 WHERE tot_oa_cd IS NOT NULL
	   AND create_dt = p_date 
	;

	/* -------------------------------------------------------------------------
    Step00-02-1. 오늘의구인현황정제 => 중복제거 구인현황 자료 구축(2개월 이내 구인 중복 제거)
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_job_sm_dupl_remove
			  (	jo_no, corp_nm, bsnm_no, indust_class, entrprs_type, corp_sz, labrr_cnt, corp_addr, cap, main_nm, year_sales, main_biz_content, corp_hpage, recru_nm, career, acdmcr, wage_type, salary, work_type, emplym_type, rcrit_jssfc, rcrit_psn, reg_dt, clos_dt
		 	  , jo_data_div, jo_data_key, work_region, work_addr, sido_cd, sgg_cd, emdong_cd, x, y, tot_oa_cd, create_dt
		 	  )
	SELECT jo_no, corp_nm, bsnm_no, indust_class, entrprs_type, corp_sz, labrr_cnt, COALESCE(corp_addr,'-') as corp_addr, cap, main_nm, year_sales, main_biz_content, corp_hpage, recru_nm, career, acdmcr, wage_type, salary, work_type, emplym_type, rcrit_jssfc, rcrit_psn, reg_dt, clos_dt
		 , jo_data_div, jo_data_key, COALESCE(work_region,'-') as work_region, COALESCE(work_addr,'-') as work_addr, sido_cd, sgg_cd, emdong_cd, x, y, tot_oa_cd, create_dt
	  FROM jobsvc.srv_dt_job_sm_refine_mapping
	 WHERE create_dt = p_date 
	   AND jo_data_key NOT IN (SELECT DISTINCT(jo_data_key) 
	   	                         FROM jobsvc.srv_dt_job_sm_refine_mapping 
	   	                        WHERE create_dt < p_date 
	   	                          AND create_dt >= to_char(p_date::timestamp - '60 days'::interval,'yyyymmdd')
	   	                      )
	;

	/* -------------------------------------------------------------------------
    Step00-03. 희망지역 구인 현황
 	------------------------------------------------------------------------- */
 	-- RAISE INFO '=> Step00-03. 희망지역 구인 현황 '; 
	INSERT INTO jobsvc.srv_dt_job_hope_area_sm ( reg_dt, sido_cd, sgg_cd, emdong_cd, jo_cnt, corp_cnt, rcrit_psn_cnt )
	SELECT create_dt, sido_cd, sgg_cd, emdong_cd, SUM(jo_no), COUNT(bsnm_no), SUM(rcrit_psn) 
      FROM ( SELECT create_dt, sido_cd, sgg_cd, emdong_cd, COUNT(jo_no) jo_no, bsnm_no, SUM(rcrit_psn) rcrit_psn
	           FROM jobsvc.srv_dt_job_sm_refine_mapping 
	          WHERE sido_cd != ''
	            AND create_dt = p_date
	          GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, bsnm_no
	       ) x 
     GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd
	;

	/* -------------------------------------------------------------------------
    Step00-04. 기업형태 구인 현황
 	------------------------------------------------------------------------- */
 	-- RAISE INFO '=> Step00-04. 기업형태 구인 현황 '; 
	INSERT INTO jobsvc.srv_dt_job_entrprs_type_sm ( reg_dt, sido_cd, sgg_cd, emdong_cd, entrprs_type, jo_cnt, corp_cnt, rcrit_psn_cnt )
	SELECT create_dt, sido_cd, sgg_cd, emdong_cd, entrprs_type, SUM(jo_no), COUNT(bsnm_no), SUM(rcrit_psn) 
      FROM ( SELECT create_dt, sido_cd, sgg_cd, emdong_cd, entrprs_type, COUNT(jo_no) jo_no, bsnm_no, SUM(rcrit_psn) rcrit_psn
	           FROM jobsvc.srv_dt_job_sm_refine_mapping 
	          WHERE sido_cd != ''
	            AND create_dt = p_date
	          GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, entrprs_type, bsnm_no
	       ) x 
     GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, entrprs_type
	;
	
	/* -------------------------------------------------------------------------
    Step00-05. 회사규모 구인 현황
 	------------------------------------------------------------------------- */
 	-- RAISE INFO '=> Step00-05. 회사규모 구인 현황 '; 
	INSERT INTO jobsvc.srv_dt_job_corp_sz_sm ( reg_dt, sido_cd, sgg_cd, emdong_cd, corp_sz, jo_cnt, corp_cnt, rcrit_psn_cnt )
	SELECT create_dt, sido_cd, sgg_cd, emdong_cd, corp_sz, SUM(jo_no), COUNT(bsnm_no), SUM(rcrit_psn) 
      FROM ( SELECT create_dt, sido_cd, sgg_cd, emdong_cd, corp_sz, COUNT(jo_no) jo_no, bsnm_no, SUM(rcrit_psn) rcrit_psn
	           FROM jobsvc.srv_dt_job_sm_refine_mapping 
	          WHERE sido_cd != ''
	            AND create_dt = p_date
	          GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, corp_sz, bsnm_no
	       ) x 
     GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, corp_sz
	;

	/* -------------------------------------------------------------------------
    Step00-06. 직종분류 구인 현황
 	------------------------------------------------------------------------- */
 	-- RAISE INFO '=> Step00-06. 직종분류 구인 현황 '; 
	INSERT INTO jobsvc.srv_dt_job_jssfc_sm ( reg_dt, sido_cd, sgg_cd, emdong_cd, jssfc_class, jo_cnt, corp_cnt, rcrit_psn_cnt )
	SELECT create_dt, sido_cd, sgg_cd, emdong_cd, rcrit_jssfc, SUM(jo_no), COUNT(bsnm_no), SUM(rcrit_psn) 
      FROM ( SELECT create_dt, sido_cd, sgg_cd, emdong_cd, rcrit_jssfc, COUNT(jo_no) jo_no, bsnm_no, SUM(rcrit_psn) rcrit_psn
	           FROM jobsvc.srv_dt_job_sm_refine_mapping 
	          WHERE sido_cd != ''
	            AND create_dt = p_date
	          GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, rcrit_jssfc, bsnm_no
	       ) x 
     GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, rcrit_jssfc
	;

	/* -------------------------------------------------------------------------
    Step00-07. 산업분류 구인 현황
 	------------------------------------------------------------------------- */
 	-- RAISE INFO '=> Step00-07. 산업분류 구인 현황 '; 
	INSERT INTO jobsvc.srv_dt_job_indust_class_sm ( reg_dt, sido_cd, sgg_cd, emdong_cd, indust_class, jo_cnt, corp_cnt, rcrit_psn_cnt )
	SELECT create_dt, sido_cd, sgg_cd, emdong_cd, indust_class, SUM(jo_no), COUNT(bsnm_no), SUM(rcrit_psn) 
      FROM ( SELECT create_dt, sido_cd, sgg_cd, emdong_cd, indust_class, COUNT(jo_no) jo_no, bsnm_no, SUM(rcrit_psn) rcrit_psn
	           FROM jobsvc.srv_dt_job_sm_refine_mapping 
	          WHERE sido_cd != ''
	            AND create_dt = p_date
	          GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, indust_class, bsnm_no
	       ) x 
     GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, indust_class
	;

	/* -------------------------------------------------------------------------
    Step00-08. 고용형태 구인 현황
 	------------------------------------------------------------------------- */
 	-- RAISE INFO '=> Step00-08. 고용형태 구인 현황 '; 
	INSERT INTO jobsvc.srv_dt_job_emplym_type_sm ( reg_dt, sido_cd, sgg_cd, emdong_cd, emplym_type, jo_cnt, corp_cnt, rcrit_psn_cnt )
	SELECT create_dt, sido_cd, sgg_cd, emdong_cd, emplym_type, SUM(jo_no), COUNT(bsnm_no), SUM(rcrit_psn) 
      FROM ( SELECT create_dt, sido_cd, sgg_cd, emdong_cd, emplym_type, COUNT(jo_no) jo_no, bsnm_no, SUM(rcrit_psn) rcrit_psn
	           FROM jobsvc.srv_dt_job_sm_refine_mapping 
	          WHERE sido_cd != ''
	            AND create_dt = p_date
	          GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, emplym_type, bsnm_no
	       ) x 
     GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, emplym_type
	;

	/* -------------------------------------------------------------------------
    Step00-09. 근무형태 구인 현황
 	------------------------------------------------------------------------- */
 	-- RAISE INFO '=> Step00-09. 근무형태 구인 현황 '; 
	INSERT INTO jobsvc.srv_dt_job_work_type_sm ( reg_dt, sido_cd, sgg_cd, emdong_cd, work_type, jo_cnt, corp_cnt, rcrit_psn_cnt )
	SELECT create_dt, sido_cd, sgg_cd, emdong_cd, work_type, SUM(jo_no), COUNT(bsnm_no), SUM(rcrit_psn) 
      FROM ( SELECT create_dt, sido_cd, sgg_cd, emdong_cd, work_type, COUNT(jo_no) jo_no, bsnm_no, SUM(rcrit_psn) rcrit_psn
	           FROM jobsvc.srv_dt_job_sm_refine_mapping 
	          WHERE sido_cd != ''
	            AND create_dt = p_date
	          GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, work_type, bsnm_no
	       ) x 
     GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, work_type
	;

	/* -------------------------------------------------------------------------
    Step00-10. 학력 구인 현황
 	------------------------------------------------------------------------- */
 	-- RAISE INFO '=> Step00-10. 학력 구인 현황 '; 
	INSERT INTO jobsvc.srv_dt_job_acdmcr_sm ( reg_dt, sido_cd, sgg_cd, emdong_cd, acdmcr, jo_cnt, corp_cnt, rcrit_psn_cnt )
	SELECT create_dt, sido_cd, sgg_cd, emdong_cd, acdmcr, SUM(jo_no), COUNT(bsnm_no), SUM(rcrit_psn) 
      FROM ( SELECT create_dt, sido_cd, sgg_cd, emdong_cd, acdmcr, COUNT(jo_no) jo_no, bsnm_no, SUM(rcrit_psn) rcrit_psn
	           FROM jobsvc.srv_dt_job_sm_refine_mapping 
	          WHERE sido_cd != ''
	            AND create_dt = p_date
	          GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, acdmcr, bsnm_no
	       ) x 
     GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, acdmcr
	;

	/* -------------------------------------------------------------------------
    Step00-11. 경력 구인 현황
 	------------------------------------------------------------------------- */
 	-- RAISE INFO '=> Step00-11. 경력 구인 현황 '; 
	INSERT INTO jobsvc.srv_dt_job_career_sm ( reg_dt, sido_cd, sgg_cd, emdong_cd, career, jo_cnt, corp_cnt, rcrit_psn_cnt )
	SELECT create_dt, sido_cd, sgg_cd, emdong_cd, career, SUM(jo_no), COUNT(bsnm_no), SUM(rcrit_psn) 
      FROM ( SELECT create_dt, sido_cd, sgg_cd, emdong_cd, career, COUNT(jo_no) jo_no, bsnm_no, SUM(rcrit_psn) rcrit_psn
	           FROM jobsvc.srv_dt_job_sm_refine_mapping 
	          WHERE sido_cd != ''
	            AND create_dt = p_date
	          GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, career, bsnm_no
	       ) x 
     GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, career
	;

	/* -------------------------------------------------------------------------
    Step00-12. 급여수준 구인 현황
 	------------------------------------------------------------------------- */
 	-- RAISE INFO '=> Step00-12. 급여수준 구인 현황 '; 
	INSERT INTO jobsvc.srv_dt_job_salary_sm ( reg_dt, sido_cd, sgg_cd, emdong_cd, wage_type, salary, jo_cnt, corp_cnt, rcrit_psn_cnt )
	SELECT create_dt, sido_cd, sgg_cd, emdong_cd, wage_type, salary, SUM(jo_no), COUNT(bsnm_no), SUM(rcrit_psn) 
	  FROM (
	        SELECT create_dt, sido_cd, sgg_cd, emdong_cd, wage_type, salary, COUNT(jo_no) jo_no, bsnm_no, SUM(rcrit_psn) rcrit_psn 
	          FROM (
	                SELECT create_dt, sido_cd, sgg_cd, emdong_cd, wage_type,  
			               CASE WHEN wage_type = 'Y' AND salary < 15000000 THEN 14000000
			                    WHEN wage_type = 'Y' AND salary >= 15000000  AND salary < 20000000 THEN 15000000
			               	 	WHEN wage_type = 'Y' AND salary >= 20000000  AND salary < 25000000 THEN 20000000
			               	 	WHEN wage_type = 'Y' AND salary >= 25000000  AND salary < 30000000 THEN 25000000
			               	 	WHEN wage_type = 'Y' AND salary >= 30000000  AND salary < 35000000 THEN 30000000
			               	 	WHEN wage_type = 'Y' AND salary >= 35000000  AND salary < 40000000 THEN 35000000
			               	 	WHEN wage_type = 'Y' AND salary >= 40000000  AND salary < 50000000 THEN 40000000
			               	 	WHEN wage_type = 'Y' AND salary >= 50000000  AND salary < 60000000 THEN 50000000
			               	 	WHEN wage_type = 'Y' AND salary >= 60000000  AND salary < 70000000 THEN 60000000
			               	 	WHEN wage_type = 'Y' AND salary >= 70000000  AND salary < 80000000 THEN 70000000
			               	 	WHEN wage_type = 'Y' AND salary >= 80000000  AND salary < 100000000 THEN 80000000
			               	 	WHEN wage_type = 'Y' AND salary >= 100000000 THEN 100000000
			               	 	WHEN wage_type = 'M' AND salary < 850000 THEN 840000
			                    WHEN wage_type = 'M' AND salary >= 850000  AND salary < 1500000 THEN 850000
				               	WHEN wage_type = 'M' AND salary >= 1500000  AND salary < 2500000 THEN 1500000
				               	WHEN wage_type = 'M' AND salary >= 2500000  AND salary < 3500000 THEN 2500000
				               	WHEN wage_type = 'M' AND salary >= 3500000  AND salary < 4500000 THEN 3500000
				               	WHEN wage_type = 'M' AND salary >= 4500000  AND salary < 5500000 THEN 4500000
				               	WHEN wage_type = 'M' AND salary >= 5500000  AND salary < 6500000 THEN 5500000
				               	WHEN wage_type = 'M' AND salary >= 6500000  AND salary < 8000000 THEN 6500000
				               	WHEN wage_type = 'M' AND salary >= 8000000  AND salary < 10000000 THEN 8000000	 
				               	WHEN wage_type = 'M' AND salary >= 10000000 THEN 10000000
				               	WHEN wage_type = 'D' AND salary < 60000 THEN 59000     
				               	WHEN wage_type = 'D' AND salary >= 60000  AND salary < 70000 THEN 60000
				               	WHEN wage_type = 'D' AND salary >= 70000  AND salary < 80000 THEN 70000
				               	WHEN wage_type = 'D' AND salary >= 80000  AND salary < 90000 THEN 80000
				               	WHEN wage_type = 'D' AND salary >= 90000  AND salary < 100000 THEN 90000	 
				               	WHEN wage_type = 'D' AND salary >= 100000 THEN 100000
				               	WHEN wage_type = 'H' AND salary < 7000 THEN 6900     
				               	WHEN wage_type = 'H' AND salary >= 7000  AND salary < 8000 THEN 7000
				               	WHEN wage_type = 'H' AND salary >= 8000  AND salary < 9000 THEN 8000
				               	WHEN wage_type = 'H' AND salary >= 9000  AND salary < 10000 THEN 9000	 
				               	WHEN wage_type = 'H' AND salary >= 10000 THEN 10000
				               	END as salary, jo_no, bsnm_no, rcrit_psn
	                   FROM jobsvc.srv_dt_job_sm_refine_mapping 
	                  WHERE sido_cd != ''
	        	        AND create_dt = p_date 
	                ) z
	         GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, wage_type, salary, bsnm_no 
		    ) x
	 GROUP BY create_dt, sido_cd, sgg_cd, emdong_cd, wage_type, salary
	;

	/* -------------------------------------------------------------------------
    Step00-13. 구인현황판
 	------------------------------------------------------------------------- */
 	-- RAISE INFO '=> Step00-13. 구인현황판 '; 
	INSERT INTO jobsvc.srv_dt_job_board_sm ( reg_dt, sido_cd, sgg_cd, all_jo_cnt, all_corp_cnt, all_rcrit_psn_cnt, new_jo_cnt, new_corp_cnt, new_rcrit_psn_cnt, clos_jo_cnt, clos_corp_cnt, clos_rcrit_psn_cnt )
	SELECT create_dt, sido_cd, sgg_cd
		 , SUM(all_jo_cnt) AS all_jo_cnt
		 , SUM(all_corp_cnt) AS all_corp_cnt
		 , SUM(all_rcrit_psn_cnt) AS all_rcrit_psn_cnt
		 , SUM(new_jo_cnt) AS new_jo_cnt
		 , SUM(new_corp_cnt) AS new_corp_cnt
		 , SUM(new_rcrit_psn_cnt) AS new_rcrit_psn_cnt
		 , SUM(clos_jo_cnt) AS clos_jo_cnt
		 , SUM(clos_corp_cnt) AS clos_corp_cnt
		 , SUM(clos_rcrit_psn_cnt) AS clos_rcrit_psn_cnt
  	  FROM (
			SELECT create_dt, sido_cd, sgg_cd, SUM(jo_no) all_jo_cnt, COUNT(bsnm_no) all_corp_cnt, SUM(rcrit_psn) all_rcrit_psn_cnt
				 , 0 new_jo_cnt
				 , 0 new_corp_cnt
				 , 0 new_rcrit_psn_cnt
				 , 0 clos_jo_cnt
				 , 0 clos_corp_cnt
				 , 0 clos_rcrit_psn_cnt
			  FROM ( SELECT create_dt, sido_cd, sgg_cd, COUNT(jo_no) jo_no, bsnm_no, SUM(rcrit_psn) rcrit_psn
				       FROM jobsvc.srv_dt_job_sm_refine_mapping 
				      WHERE sido_cd != ''
				        AND create_dt = p_date
				      GROUP BY create_dt, sido_cd, sgg_cd, bsnm_no
				    ) x 
			 GROUP BY create_dt, sido_cd, sgg_cd
			UNION ALL
			SELECT create_dt, sido_cd, sgg_cd 
				 , 0 all_jo_cnt
				 , 0 all_corp_cnt
				 , 0 all_rcrit_psn_cnt
				 , SUM(jo_no) new_jo_cnt, COUNT(bsnm_no) new_corp_cnt, SUM(rcrit_psn) new_rcrit_psn_cnt
				 , 0 clos_jo_cnt
				 , 0 clos_corp_cnt
				 , 0 clos_rcrit_psn_cnt
			  FROM ( SELECT p_date as create_dt, sido_cd, sgg_cd, COUNT(jo_no) jo_no, bsnm_no, SUM(rcrit_psn) rcrit_psn
			           FROM jobsvc.srv_dt_job_sm_dupl_remove 
			          WHERE sido_cd != ''
			            AND reg_dt = p_date
			          GROUP BY create_dt, sido_cd, sgg_cd, bsnm_no
			        ) x 
			 GROUP BY create_dt, sido_cd, sgg_cd
			UNION ALL
			SELECT create_dt, sido_cd, sgg_cd
				 , 0 all_jo_cnt
				 , 0 all_corp_cnt
				 , 0 all_rcrit_psn_cnt
				 , 0 new_jo_cnt
				 , 0 new_corp_cnt
				 , 0 new_rcrit_psn_cnt
				 , SUM(jo_no) clos_jo_cnt, COUNT(bsnm_no) clos_corp_cnt, SUM(rcrit_psn) clos_rcrit_psn_cnt
			  FROM ( SELECT p_date as create_dt, sido_cd, sgg_cd, COUNT(jo_no) jo_no, bsnm_no, SUM(rcrit_psn) rcrit_psn
			           FROM jobsvc.srv_dt_job_sm_dupl_remove 
			          WHERE sido_cd != ''
			            AND clos_dt = p_date
			          GROUP BY create_dt, sido_cd, sgg_cd, bsnm_no
			        ) x 
			 GROUP BY create_dt, sido_cd, sgg_cd
			) x	
	 GROUP BY create_dt, sido_cd, sgg_cd	
	;
	

	RETURN 'OK';

EXCEPTION WHEN OTHERS THEN 
	RAISE NOTICE '% %', SQLERRM, SQLSTATE;
	RETURN SQLERRM;

END;
$$ LANGUAGE plpgsql;