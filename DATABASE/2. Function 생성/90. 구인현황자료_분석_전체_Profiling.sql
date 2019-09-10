CREATE OR REPLACE FUNCTION FN_JOB_DATA_PROFILE(p_date CHAR(8))
	RETURNS TEXT
    AS $$

DECLARE

i_w_gather_cnt INTEGER;
i_w_null_bsnm_no INTEGER;
i_w_null_corp_sz INTEGER;
i_w_null_work_intspt INTEGER;
i_w_null_biz_nm INTEGER;
i_w_null_rcrit_jssfc INTEGER;
i_w_null_rcrit_psn INTEGER;
i_w_null_emplym_type INTEGER;
i_w_null_career INTEGER;
i_w_null_acdmcr INTEGER;
i_w_null_salary INTEGER;
i_w_null_wage_cnd INTEGER;
i_i_gather_cnt INTEGER;
i_i_null_bsnm_no INTEGER;
i_i_null_corp_sz INTEGER;
i_i_null_work_intspt INTEGER;
i_i_null_biz_nm INTEGER;
i_i_null_rcrit_jssfc INTEGER;
i_i_null_rcrit_psn INTEGER;
i_i_null_emplym_type INTEGER;
i_i_null_career INTEGER;
i_i_null_acdmcr INTEGER;
i_i_null_salary INTEGER;
i_i_null_wage_cnd INTEGER;
i_duple_cnt INTEGER;

i_entrprs_type_01 INTEGER;
i_entrprs_type_02 INTEGER;
i_entrprs_type_03 INTEGER;
i_entrprs_type_04 INTEGER;
i_entrprs_type_05 INTEGER;
i_entrprs_type_06 INTEGER;
i_entrprs_type_07 INTEGER;
i_entrprs_type_08 INTEGER;
i_entrprs_type_09 INTEGER;
i_entrprs_type_10 INTEGER;
i_entrprs_type_11 INTEGER;
i_entrprs_type_99 INTEGER;
i_emplym_type_4 INTEGER;
i_emplym_type_10 INTEGER;
i_emplym_type_11 INTEGER;
i_emplym_type_20 INTEGER;
i_emplym_type_21 INTEGER;
i_acdmcr_sm_00 INTEGER;
i_acdmcr_sm_01 INTEGER;
i_acdmcr_sm_02 INTEGER;
i_acdmcr_sm_03 INTEGER;
i_acdmcr_sm_04 INTEGER;
i_acdmcr_sm_05 INTEGER;
i_acdmcr_sm_06 INTEGER;
i_acdmcr_sm_07 INTEGER;
i_career_sm_N INTEGER;
i_career_sm_E INTEGER;
i_career_sm_Z INTEGER;
i_wage_type_D INTEGER;
i_wage_type_H INTEGER;
i_wage_type_M INTEGER;
i_wage_type_Y INTEGER;
i_indust_class_sm_A INTEGER;
i_indust_class_sm_B INTEGER;
i_indust_class_sm_C INTEGER;
i_indust_class_sm_D INTEGER;
i_indust_class_sm_E INTEGER;
i_indust_class_sm_F INTEGER;
i_indust_class_sm_G INTEGER;
i_indust_class_sm_H INTEGER;
i_indust_class_sm_I INTEGER;
i_indust_class_sm_J INTEGER;
i_indust_class_sm_K INTEGER;
i_indust_class_sm_L INTEGER;
i_indust_class_sm_M INTEGER;
i_indust_class_sm_N INTEGER;
i_indust_class_sm_O INTEGER;
i_indust_class_sm_P INTEGER;
i_indust_class_sm_Q INTEGER;
i_indust_class_sm_R INTEGER;
i_indust_class_sm_S INTEGER;
i_indust_class_sm_T INTEGER;
i_indust_class_sm_U INTEGER;

i_total_job_refine_cnt INTEGER;
i_geo_coding_err_cnt INTEGER;

BEGIN	
	
	/* ---------------------------------------------------------------------------------------------------------
    Step00. 분석 테이블 정보
 	--------------------------------------------------------------------------------------------------------- */
 	/*
 	-- DROP TABLE jobsvc.srv_dt_job_data_profile CASCADE;
 	-- 구인자료 수집 분석
	CREATE TABLE jobsvc.srv_dt_job_data_profile (
	reg_dt  CHAR(8),  -- 수집일자
	w_gather_cnt  INTEGER,  -- 워크넷 수집 건수
	w_null_bsnm_no  INTEGER,  -- 워크넷 사업자번호 누락 건수
	w_null_corp_sz  INTEGER,  -- 워크넷 기업형태 누락 건수
	w_null_work_intspt  INTEGER,  -- 워크넷 근무지주소 누락 건수
	w_null_biz_nm  INTEGER,  -- 워크넷 산업분류(업종) 누락 건수
	w_null_rcrit_jssfc  INTEGER,  -- 워크넷 모집직종  누락 건수
	w_null_rcrit_psn  INTEGER,  -- 워크넷 모집인원 누락 건수
	w_null_emplym_type  INTEGER,  -- 워크넷 고용형태 누락 건수
	w_null_career  INTEGER,  -- 워크넷 경력 누락 건수
	w_null_acdmcr  INTEGER,  -- 워크넷 학력 누락 건수
	w_null_salary  INTEGER,  -- 워크넷 급여 누락 건수
	w_null_wage_cnd  INTEGER,  -- 워크넷 임금형태 누락 건수
	i_gather_cnt  INTEGER,  -- 인크루트 수집 건수
	i_null_bsnm_no  INTEGER,  -- 인크루트 사업자번호 누락 건수
	i_null_corp_sz  INTEGER,  -- 인크루트 기업형태 누락 건수
	i_null_work_intspt  INTEGER,  -- 인크루트 근무지주소 누락 건수
	i_null_biz_nm  INTEGER,  -- 인크루트 산업분류(업종) 누락 건수
	i_null_rcrit_jssfc  INTEGER,  -- 인크루트 모집직종  누락 건수
	i_null_rcrit_psn  INTEGER,  -- 인크루트 모집인원 누락 건수
	i_null_emplym_type  INTEGER,  -- 인크루트 고용형태 누락 건수
	i_null_career  INTEGER,  -- 인크루트 경력 누락 건수
	i_null_acdmcr  INTEGER,  -- 인크루트 학력 누락 건수
	i_null_salary  INTEGER,  -- 인크루트 급여 누락 건수
	i_null_wage_cnd  INTEGER,  -- 인크루트 임금형태 누락 건수
	duple_cnt INTEGER,  -- 워크넷 & 인크루트 중복건수
	total_cnt INTEGER,  -- 워크넷 & 인크루트 수집 총건수
	total_job_refine_cnt INTEGER,
	geo_coding_err_cnt INTEGER,
	create_dt  CHAR(8)  --생성일자
	);
	*/
	/*
	-- DROP TABLE jobsvc.srv_dt_job_data_sm_all_profile CASCADE;
 	-- 구인자료 집계 항목별 분석
	CREATE TABLE jobsvc.srv_dt_job_data_sm_all_profile (
	reg_dt  CHAR(8),  -- 집계일자
	b_class_cd CHARACTER VARYING(6), -- 항목코드
	b_class_cd_nm CHARACTER VARYING(100), -- 항목명
	s_class_cd CHARACTER VARYING(10), -- 분류코드
	s_class_cd_nm CHARACTER VARYING(100), -- 분류명
	jo_cnt INTEGER,	-- 구인공고건수
	rcrit_psn_cnt INTEGER,	-- 모집인원수
	create_dt  CHAR(8)  --생성일자
	);
 	*/
 	/* -------------------------------------------------------------------------
    Step00-01. 분석일 자료 삭제
 	------------------------------------------------------------------------- */
 	-- RAISE INFO '=> Step00-01. 작업당일 집계 자료 삭제 '; 
 	DELETE FROM jobsvc.srv_dt_job_data_profile WHERE reg_dt = p_date;
 	DELETE FROM jobsvc.srv_dt_job_data_sm_all_profile WHERE reg_dt = p_date;	

 	/* -------------------------------------------------------------------------
    Step00-02. 구인자료 수집 분석
 	------------------------------------------------------------------------- */
 	/* 워크넷 구인 자료 수집 건수 - 중복수집 제거  */
	SELECT count(jo_auth_no) INTO i_w_gather_cnt
  	  FROM (
			SELECT jo_auth_no FROM jobsvc.srv_dt_worknet_master_raw WHERE create_dt = p_date GROUP BY jo_auth_no
			) z
  	;
	/* 인크루트 구인 자료 수집 - 중복수집 제거 */
	SELECT count(pblanc_no) INTO i_i_gather_cnt
  	  FROM (
			SELECT pblanc_no FROM jobsvc.srv_dt_incruit_json_raw WHERE create_dt = p_date GROUP BY pblanc_no
			) z 
  	;

 	/* 사업자번호 누락 건수 */
 	/* 워크넷 */
	SELECT count(*) INTO i_w_null_bsnm_no FROM (
		select jo_auth_no, create_dt, max(bsnm_no) as bsnm_no  FROM jobsvc.srv_dt_worknet_master_raw where create_dt = p_date group by jo_auth_no, create_dt
		) z
	WHERE (trim(bsnm_no) = '' or trim(bsnm_no) is null) AND create_dt = p_date ;
	/* 인크루트 */
	select count(*) INTO i_i_null_bsnm_no FROM (
		select pblanc_no, create_dt, max(bsnm_no) as bsnm_no FROM jobsvc.srv_dt_incruit_json_raw where create_dt = p_date group by pblanc_no, create_dt
		) z where  (trim(bsnm_no) = '' or trim(bsnm_no) is null) AND create_dt = p_date  ;

	/* 기업형태 누락 건수 */
	/* 워크넷 */
	select count(*) INTO i_w_null_corp_sz from ( 
	select jo_auth_no, max(corp_sz_raw) as corp_sz  FROM jobsvc.srv_dt_worknet_detail_raw where jo_auth_no in (select jo_auth_no FROM jobsvc.srv_dt_worknet_master_raw where create_dt = p_date) group by jo_auth_no
	) z
	where (trim(corp_sz) = '' or trim(corp_sz) is null)  ;
	/* 인크루트 */
	select count(*) INTO i_i_null_corp_sz FROM (
		select pblanc_no, create_dt, max(entrprs_type_raw) as entrprs_type_raw FROM jobsvc.srv_dt_incruit_json_raw where create_dt =p_date group by pblanc_no, create_dt
		) z
	where  (trim(entrprs_type_raw) = '' or trim(entrprs_type_raw) is null) AND create_dt =p_date;

	/* 근무지주소/회사주소 누락 건수 */
	/* 워크넷 */
	select count(*) INTO i_w_null_work_intspt from ( 
	select jo_auth_no, max(work_intspt) as work_intspt  FROM jobsvc.srv_dt_worknet_detail_raw where jo_auth_no in (select jo_auth_no FROM jobsvc.srv_dt_worknet_master_raw where create_dt = p_date) group by jo_auth_no
	) z
	where (trim(work_intspt) = '' or trim(work_intspt) is null)  ;
	/* 인크루트 */
	select count(*) INTO i_i_null_work_intspt FROM (
		select pblanc_no, create_dt, max(corp_addr) as corp_addr FROM jobsvc.srv_dt_incruit_json_raw where create_dt =p_date group by pblanc_no, create_dt
		) z 
	where  (trim(corp_addr) = '' or trim(corp_addr) is null) AND create_dt = p_date ;

	/* 산업분류(업종) 누락 건수 */
	/* 워크넷 */
	select count(*) INTO i_w_null_biz_nm from ( 
	select jo_auth_no, max(biz_nm) as biz_nm  FROM jobsvc.srv_dt_worknet_detail_raw where jo_auth_no in (select jo_auth_no FROM jobsvc.srv_dt_worknet_master_raw where create_dt = p_date) group by jo_auth_no
	) z
	where (trim(biz_nm) = '' or trim(biz_nm) is null)  ;
	/* 인크루트 */
	select count(*) INTO i_i_null_biz_nm FROM (
		select pblanc_no, create_dt, max(biz_nm) as biz_nm FROM jobsvc.srv_dt_incruit_json_raw where create_dt =p_date group by pblanc_no, create_dt
		) z  
	where  (trim(biz_nm) = '' or trim(biz_nm) is null) AND create_dt = p_date ;

	/* 모집직종 누락 건수 */
	/* 워크넷 */
	select count(*) INTO i_w_null_rcrit_jssfc from ( 
	select jo_auth_no, max(rcrit_jssfc_raw) as rcrit_jssfc  FROM jobsvc.srv_dt_worknet_detail_raw where jo_auth_no in (select jo_auth_no FROM jobsvc.srv_dt_worknet_master_raw where create_dt = p_date) group by jo_auth_no
	) z
	where (trim(rcrit_jssfc) = '' or trim(rcrit_jssfc) is null)  ;
	/* 인크루트 */
	select count(*) INTO i_i_null_rcrit_jssfc FROM (
		select pblanc_no, create_dt, max(rcrit_jssfc_list) as rcrit_jssfc_list FROM jobsvc.srv_dt_incruit_json_raw where create_dt =p_date group by pblanc_no, create_dt
		) z  
	where  (trim(rcrit_jssfc_list) = '' or trim(rcrit_jssfc_list) is null) AND create_dt = p_date ;

	/* 모집인원 누락 건수 */
	/* 워크넷 */
	select count(*) INTO i_w_null_rcrit_psn from ( 
	select jo_auth_no, max(rcrit_psn_raw) as rcrit_psn  FROM jobsvc.srv_dt_worknet_detail_raw where jo_auth_no in (select jo_auth_no FROM jobsvc.srv_dt_worknet_master_raw where create_dt = p_date) group by jo_auth_no
	) z
	where (trim(rcrit_psn) = '' or trim(rcrit_psn) is null)  ;
	/* 인크루트 */
	select count(*) INTO i_i_null_rcrit_psn FROM jobsvc.srv_dt_incruit_json_raw where  (trim(rcrit_psn_raw) = '' or trim(rcrit_psn_raw) is null) AND create_dt = p_date ;

	/* 고용형태 누락 건수 */
	/* 워크넷 */
	select count(*) INTO i_w_null_emplym_type from ( 
	select jo_auth_no, max(emplym_type_raw) as emplym_type_raw  FROM jobsvc.srv_dt_worknet_detail_raw where jo_auth_no in (select jo_auth_no FROM jobsvc.srv_dt_worknet_master_raw where create_dt = p_date) group by jo_auth_no
	) z
	where (trim(emplym_type_raw) = '' or trim(emplym_type_raw) is null)  ;
	/* 인크루트 */
	select count(*) INTO i_i_null_emplym_type FROM (
		select pblanc_no, create_dt, max(emplym_type_raw) as emplym_type_raw FROM jobsvc.srv_dt_incruit_json_raw where create_dt =p_date group by pblanc_no, create_dt
		) z  
	where  (trim(emplym_type_raw) = '' or trim(emplym_type_raw) is null) AND create_dt = p_date ;

	/* 경력 누락 건수 :*/
	/* 워크넷 */
	select count(*) INTO i_w_null_career FROM (
		select jo_auth_no, create_dt, max(career_raw) as career  FROM jobsvc.srv_dt_worknet_master_raw where create_dt = p_date group by jo_auth_no, create_dt
		) z
	where (trim(career) = '' or trim(career) is null) AND create_dt = p_date ;
	/* 인크루트 */
	select count(*) INTO i_i_null_career FROM (
		select pblanc_no, create_dt, max(career_yn) as career_yn FROM jobsvc.srv_dt_incruit_json_raw where create_dt =p_date group by pblanc_no, create_dt
		) z
	where  (trim(career_yn) = '' or trim(career_yn) is null) AND create_dt = p_date ;

	/* 학력 누락 건수 :*/
	/* 워크넷 */
	select count(*) INTO i_w_null_acdmcr from ( 
	select jo_auth_no, max(acdmcr_raw) as acdmcr_raw  FROM jobsvc.srv_dt_worknet_detail_raw where jo_auth_no in (select jo_auth_no FROM jobsvc.srv_dt_worknet_master_raw where create_dt = p_date) group by jo_auth_no
	) z
	where (trim(acdmcr_raw) = '' or trim(acdmcr_raw) is null)  ;
	/* 인크루트 */
	select count(*) INTO i_i_null_acdmcr FROM (
		select pblanc_no, create_dt, max(acdmcr_raw) as acdmcr_raw FROM jobsvc.srv_dt_incruit_json_raw where create_dt =p_date group by pblanc_no, create_dt
		) z 
	where  (trim(acdmcr_raw) = '' or trim(acdmcr_raw) is null) AND create_dt = p_date ;

	/* 급여 누락 건수 : */
	/* 워크넷 */
	select count(*) INTO i_w_null_salary FROM (
		select jo_auth_no, create_dt, max(salary_raw) as salary_raw  FROM jobsvc.srv_dt_worknet_master_raw where create_dt = p_date group by jo_auth_no, create_dt
		) z
	where (trim(salary_raw) = '' or trim(salary_raw) is null) AND create_dt = p_date ;
	/* 인크루트 */
	select count(*) INTO i_i_null_salary FROM (
		select pblanc_no, create_dt, max(anslry_1) as anslry_1 FROM jobsvc.srv_dt_incruit_json_raw where create_dt =p_date group by pblanc_no, create_dt
		) z
	where  (trim(anslry_1) = '' or trim(anslry_1) is null) AND create_dt = p_date ;

	/* 임금형태 누락 건수 */
	/* 워크넷 */
	select count(*) INTO i_w_null_wage_cnd from ( 
	select jo_auth_no, max(wage_cnd) as wage_cnd  FROM jobsvc.srv_dt_worknet_detail_raw where jo_auth_no in (select jo_auth_no FROM jobsvc.srv_dt_worknet_master_raw where create_dt = p_date) group by jo_auth_no
	) z
	where (trim(wage_cnd) = '' or trim(wage_cnd) is null)  ;	
	i_i_null_wage_cnd := 0;

	/* 워크넷 구인 공고명,사업자번호와 인크루트 구인 공고명,사업자번호 중복 건수  */
	select count(*) 
	  INTO i_duple_cnt
	  from (
		select b.jo_title jo_title, a.bsnm_no bsnm_no
		  FROM jobsvc.srv_dt_worknet_master_raw a left join 
				(select jo_auth_no, max(jo_title) as jo_title
				   FROM jobsvc.srv_dt_worknet_detail_raw group by jo_auth_no) b 
				on a.jo_auth_no = b.jo_auth_no
		where a.create_dt = p_date group by b.jo_title, a.bsnm_no
	) z
	where jo_title||BSNM_NO in ( select pblanc_nm||BSNM_NO FROM jobsvc.srv_dt_incruit_json_raw where create_dt = p_date group by pblanc_nm, BSNM_NO);

	/* 가공/정제/집계 대상 건수 */
  	select count(*) INTO i_total_job_refine_cnt from jobsvc.srv_dt_job_sm_refine_mapping where create_dt = p_date ;

  	/* 지오코딩 실패 건수 */
  	select count(*) INTO i_geo_coding_err_cnt from jobsvc.srv_dt_job_sm_refine_mapping where create_dt = p_date and sido_cd = '' ;

	/* -------------------------------------------------------------------------
    Step00-03. 구인자료 수집 분석 저장
 	------------------------------------------------------------------------- */
 	INSERT INTO jobsvc.srv_dt_job_data_profile(
		  reg_dt
		, w_gather_cnt, w_null_bsnm_no, w_null_corp_sz, w_null_work_intspt, w_null_biz_nm, w_null_rcrit_jssfc, w_null_rcrit_psn, w_null_emplym_type, w_null_career, w_null_acdmcr, w_null_salary, w_null_wage_cnd
		, i_gather_cnt, i_null_bsnm_no, i_null_corp_sz, i_null_work_intspt, i_null_biz_nm, i_null_rcrit_jssfc, i_null_rcrit_psn, i_null_emplym_type, i_null_career, i_null_acdmcr, i_null_salary, i_null_wage_cnd, duple_cnt
		, total_cnt
		, total_job_refine_cnt, geo_coding_err_cnt
		, create_dt )
	VALUES (
		  p_date
		, i_w_gather_cnt, i_w_null_bsnm_no, i_w_null_corp_sz, i_w_null_work_intspt, i_w_null_biz_nm, i_w_null_rcrit_jssfc, i_w_null_rcrit_psn, i_w_null_emplym_type, i_w_null_career, i_w_null_acdmcr, i_w_null_salary, i_w_null_wage_cnd
		, i_i_gather_cnt, i_i_null_bsnm_no, i_i_null_corp_sz, i_i_null_work_intspt, i_i_null_biz_nm, i_i_null_rcrit_jssfc, i_i_null_rcrit_psn, i_i_null_emplym_type, i_i_null_career, i_i_null_acdmcr, i_i_null_salary, i_i_null_wage_cnd
		, i_duple_cnt
		, i_w_gather_cnt+i_i_gather_cnt-i_duple_cnt
		, i_total_job_refine_cnt, i_geo_coding_err_cnt
		, TO_CHAR(now(),'yyyymmdd')
	) ;

	/* -------------------------------------------------------------------------
    Step00-04. 구인자료 집계 항목별 분석
 	------------------------------------------------------------------------- */
 	/* 기업형태 집계 분석 */
 	INSERT INTO jobsvc.srv_dt_job_data_sm_all_profile(
		reg_dt, b_class_cd, b_class_cd_nm, s_class_cd, s_class_cd_nm, jo_cnt, rcrit_psn_cnt, create_dt
	)
	select reg_dt, 'ENTTYP', '기업형태'
		 , entrprs_type
		 , (select max(s_class_cd_nm) from jobsvc.cmm_cd_comcd where b_class_cd = 'ENTTYP' and s_class_cd = a.entrprs_type)||'('||entrprs_type||')'
		 , sum(jo_cnt) 
		 , sum(rcrit_psn_cnt)
		 , TO_CHAR(now(),'yyyymmdd')
	  from jobsvc.srv_dt_job_entrprs_type_sm a 
	 where reg_dt = p_date
	 group by reg_dt, entrprs_type order by reg_dt, entrprs_type;

	/* 산업분류 집계 분석 */
	INSERT INTO jobsvc.srv_dt_job_data_sm_all_profile(
		reg_dt, b_class_cd, b_class_cd_nm, s_class_cd, s_class_cd_nm, jo_cnt, rcrit_psn_cnt, create_dt
	)
	select reg_dt, 'INDCLA', '산업분류'
		 , indust_class
		 , (select max(s_class_cd_nm) from jobsvc.cmm_cd_comcd where b_class_cd = 'INDCLA' and s_class_cd = z.indust_class)||'('||indust_class||')'
		 , jo_cnt
		 , rcrit_psn_cnt
		 , TO_CHAR(now(),'yyyymmdd')
	  from (	 
			select reg_dt
			, substring(indust_class,1,1) as indust_class	 
			, sum(jo_cnt) as jo_cnt
			, sum(rcrit_psn_cnt) as rcrit_psn_cnt
			from jobsvc.srv_dt_job_indust_class_sm a 
			where reg_dt = p_date
			group by reg_dt, substring(indust_class,1,1) order by reg_dt, substring(indust_class,1,1)
		) z;
	  
	 /* 직종분류 집계 분석 */
	 INSERT INTO jobsvc.srv_dt_job_data_sm_all_profile(
		reg_dt, b_class_cd, b_class_cd_nm, s_class_cd, s_class_cd_nm, jo_cnt, rcrit_psn_cnt, create_dt
	)
	select reg_dt, 'RCRJSS', '직종분류'
		 , jssfc_class
		 , case when jssfc_class = '00' then '해당직종없음' 
		   else (select max(s_class_cd_nm) from jobsvc.cmm_cd_comcd where b_class_cd = 'RCRJSS' and s_class_cd = z.jssfc_class)||'('||jssfc_class||')' end as jssfc_class_nm
		 , jo_cnt
		 , rcrit_psn_cnt
		 , TO_CHAR(now(),'yyyymmdd')
	  from (	 
			select reg_dt
			, substring(jssfc_class,1,2) as jssfc_class	 
			, sum(jo_cnt) as jo_cnt
			, sum(rcrit_psn_cnt) as rcrit_psn_cnt
			from jobsvc.srv_dt_job_jssfc_sm a 
			where reg_dt = p_date
			group by reg_dt, substring(jssfc_class,1,2) order by reg_dt, substring(jssfc_class,1,2)
		) z;			

	 /* 고용형태 집계 분석 */
	 INSERT INTO jobsvc.srv_dt_job_data_sm_all_profile(
		reg_dt, b_class_cd, b_class_cd_nm, s_class_cd, s_class_cd_nm, jo_cnt, rcrit_psn_cnt, create_dt
	)
	select reg_dt, 'EMPTYP', '고용형태'
		 , emplym_type
		 , (select max(s_class_cd_nm) from jobsvc.cmm_cd_comcd where b_class_cd = 'EMPTYP' and s_class_cd = a.emplym_type)||'('||emplym_type||')'
		 , sum(jo_cnt)
		 , sum(rcrit_psn_cnt)
		 , TO_CHAR(now(),'yyyymmdd') 
	  from jobsvc.srv_dt_job_emplym_type_sm a 
	 where reg_dt = p_date
	 group by reg_dt, emplym_type order by reg_dt, emplym_type;


	 /* 학력 집계 분석 */
	 INSERT INTO jobsvc.srv_dt_job_data_sm_all_profile(
		reg_dt, b_class_cd, b_class_cd_nm, s_class_cd, s_class_cd_nm, jo_cnt, rcrit_psn_cnt, create_dt
	)
	select reg_dt, 'ACDMCR', '학력'
		 , acdmcr
		 , (select max(s_class_cd_nm) from jobsvc.cmm_cd_comcd where b_class_cd = 'ACDMCR' and s_class_cd = a.acdmcr)||'('||acdmcr||')'
		 , sum(jo_cnt) 
		 , sum(rcrit_psn_cnt)
		 , TO_CHAR(now(),'yyyymmdd') 
	  from jobsvc.srv_dt_job_acdmcr_sm a 
	 where reg_dt = p_date
	 group by reg_dt, acdmcr order by reg_dt, acdmcr;


	 /* 경력 집계 분석 */
	 INSERT INTO jobsvc.srv_dt_job_data_sm_all_profile(
		reg_dt, b_class_cd, b_class_cd_nm, s_class_cd, s_class_cd_nm, jo_cnt, rcrit_psn_cnt, create_dt
	)
	select reg_dt, 'CAREER', '경력'
		 , career
		 , (select max(s_class_cd_nm) from jobsvc.cmm_cd_comcd where b_class_cd = 'CAREER' and s_class_cd = a.career)||'('||career||')'
		 , sum(jo_cnt) 
		 , sum(rcrit_psn_cnt)
		 , TO_CHAR(now(),'yyyymmdd') 
	  from jobsvc.srv_dt_job_career_sm a 
	 where reg_dt = p_date
	 group by reg_dt, career order by reg_dt, career;  	 	


	RETURN 'OK';

EXCEPTION WHEN OTHERS THEN 
	RAISE NOTICE '% %', SQLERRM, SQLSTATE;
	RETURN SQLERRM;

END;
$$ LANGUAGE plpgsql;