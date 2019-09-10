CREATE OR REPLACE FUNCTION FN_JOB_DATA_TODAY_SM_MART(p_date CHAR(8))
	RETURNS TEXT
    AS $$

DECLARE
	
	cs_worknet_guin CURSOR FOR
		SELECT a.jo_auth_no
		     , max(a.corp_nm) AS corp_nm
		     , max(a.bsnm_no) AS bsnm_no
		     , max(b.biz_nm) AS indust_class
		     , max(b.corp_sz_raw) AS entrprs_type
		     , max(b.labrr_cnt) AS labrr_cnt
		     , max(b.corp_addr) AS corp_addr
		     , max(b.cap) AS cap
		     , max(b.main_nm) AS main_nm
		     , max(b.year_sales) AS year_sales
		     , max(b.main_biz_content) AS main_biz_content
		     , max(b.corp_hpage) AS corp_hpage
		     , max(b.jo_title) AS recru_nm
		     , max(a.career_raw) AS career
		     , max(b.acdmcr_raw) AS acdmcr
		     , max(a.wage_type_raw) AS wage_type
		     , max(a.salary_raw) AS salary
		     , max(a.work_type_raw) AS work_type
		     , max(b.emplym_type_raw) AS emplym_type
		     , max(b.rcrit_jssfc_raw) AS rcrit_jssfc
		     , max(b.rcrit_psn_raw) AS rcrit_psn
		     , max(a.reg_dt_raw) AS reg_dt
		     , max(a.clos_dt_raw) AS clos_dt
		     , max(b.rcept_clos_dt) AS rcept_clos_dt
		     , max('W') AS jo_data_div
		     , max(a.jo_auth_no) AS jo_data_key
		     , max(a.work_region) AS work_region
		     , max(b.work_intspt) AS work_intspt
		     , max(a.create_dt) AS create_dt
		  FROM jobsvc.srv_dt_worknet_master AS a
	      	   LEFT JOIN jobsvc.srv_dt_worknet_detail AS b
		 	   ON a.jo_auth_no = b.jo_auth_no
		 WHERE a.create_dt = p_date
		   AND (TRIM(a.bsnm_no) != '' AND TRIM(a.bsnm_no) IS NOT NULL)
		   AND (TRIM(b.work_intspt) != '' AND TRIM(b.work_intspt) IS NOT NULL)
  		 GROUP BY a.jo_auth_no
		 ;		 

	cs_incruit_guin CURSOR FOR
		SELECT pblanc_no
			 , MAX(entrprs_nm) AS entrprs_nm
			 , MAX(biz_nm) AS biz_nm
			 , MAX(corp_addr) AS corp_addr
			 , MAX(a.bsnm_no) AS bsnm_no
			 , MAX(entrprs_type_raw) AS entrprs_type
			 , MAX(nwmb_yn) AS nwmb_yn
			 , MAX(career_yn) AS career_yn
			 , MAX(rcrit_clos) AS rcrit_clos
			 , MAX(clos_dt_raw) AS clos_dt
			 , MAX(rcrit_dt) AS rcrit_dt
			 , MAX(career_raw) AS career
			 , MAX(pblanc_nm) AS pblanc_nm
			 , MAX(rcrit_jssfc_list) AS rcrit_jssfc_list
			 , MAX(rcrit_region_list) AS rcrit_region_list
			 , MAX(anslry_1) AS anslry_1
			 , MAX(anslry_2) AS anslry_2
			 , MAX(anslry_dscss) AS anslry_dscss
			 , MAX(emplym_type_raw) AS emplym_type
			 , MAX(acdmcr_raw) AS acdmcr
			 , MAX(rcrit_psn_raw) AS rcrit_psn
			 , MAX(qualf_lcns) AS qualf_lcns
			 , MAX(rcrit_start_dt) AS rcrit_start_dt
			 , MAX(nearby_eclw_station) AS nearby_eclw_statn
			 , MAX(pblanc_url) AS pblanc_url
			 , MAX(create_dt) AS create_dt
			 , MAX('I') AS jo_data_div
		     , MAX(pblanc_no) AS jo_data_key
		     , MAX(b.jo_auth_no) AS jo_auth_no
		  FROM jobsvc.srv_dt_incruit_json a
			   LEFT JOIN ( SELECT jo_auth_no, MAX(jo_title) AS jo_title, MAX(bsnm_no) AS bsnm_no 
			    			 FROM ( SELECT a.jo_auth_no, b.jo_title, a.bsnm_no 
		   						   	  FROM jobsvc.srv_dt_worknet_master AS a 
		   						   		   LEFT JOIN jobsvc.srv_dt_worknet_detail AS b 
		   						   		   ON a.jo_auth_no = b.jo_auth_no and a.create_dt = b.create_dt
		   						  	 WHERE a.create_dt = p_date ) z -- 워크넷 사업자번호||구인공고 중복 조회
		   					GROUP BY jo_auth_no ) b
			   ON a.pblanc_nm||a.bsnm_no = b.jo_title||b.bsnm_no
		 WHERE create_dt = p_date
		   AND (TRIM(a.bsnm_no) != '' AND TRIM(a.bsnm_no) IS NOT NULL)
		   AND (TRIM(corp_addr) != '' AND TRIM(corp_addr) IS NOT NULL)		   
		GROUP BY pblanc_no
	;
	
	/*SELECT pblanc_no
			 , MAX(entrprs_nm) AS entrprs_nm
			 , MAX(biz_nm) AS biz_nm
			 , MAX(corp_addr) AS corp_addr
			 , MAX(bsnm_no) AS bsnm_no
			 , MAX(entrprs_type_raw) AS entrprs_type
			 , MAX(nwmb_yn) AS nwmb_yn
			 , MAX(career_yn) AS career_yn
			 , MAX(rcrit_clos) AS rcrit_clos
			 , MAX(clos_dt_raw) AS clos_dt
			 , MAX(rcrit_dt) AS rcrit_dt
			 , MAX(career_raw) AS career
			 , MAX(pblanc_nm) AS pblanc_nm
			 , MAX(rcrit_jssfc_list) AS rcrit_jssfc_list
			 , MAX(rcrit_region_list) AS rcrit_region_list
			 , MAX(anslry_1) AS anslry_1
			 , MAX(anslry_2) AS anslry_2
			 , MAX(anslry_dscss) AS anslry_dscss
			 , MAX(emplym_type_raw) AS emplym_type
			 , MAX(acdmcr_raw) AS acdmcr
			 , MAX(rcrit_psn_raw) AS rcrit_psn
			 , MAX(qualf_lcns) AS qualf_lcns
			 , MAX(rcrit_start_dt) AS rcrit_start_dt
			 , MAX(pblanc_url) AS pblanc_url
			 , MAX(create_dt) AS create_dt
			 , MAX('I') AS jo_data_div
		     , MAX(pblanc_no) AS jo_data_key
		  FROM jobsvc.srv_dt_incruit_json
		 WHERE create_dt = p_date
		   AND (TRIM(bsnm_no) != '' AND TRIM(bsnm_no) IS NOT NULL)
		   AND (TRIM(corp_addr) != '' AND TRIM(corp_addr) IS NOT NULL)
		   AND pblanc_nm||bsnm_no NOT IN (SELECT DISTINCT(b.jo_title||a.bsnm_no) 
		   						   FROM jobsvc.srv_dt_worknet_master AS a 
		   						   		LEFT JOIN jobsvc.srv_dt_worknet_detail AS b 
		   						   		ON a.jo_auth_no = b.jo_auth_no and a.create_dt = b.create_dt
		   						  WHERE a.create_dt = p_date )	-- 워크넷 사업자번호||구인공고 중복 제거
		GROUP BY pblanc_no
	;*/

	r RECORD;

	s_sido_cd TEXT;	
	s_sido_nm TEXT;	
	s_sgg_cd TEXT;	
	s_sgg_nm TEXT;	
	s_emdong_cd TEXT;	
	s_emdong_nm TEXT;	

	s_jo_no TEXT;
	s_indust_class TEXT;
	s_indust_class_tmp TEXT;
	s_entrprs_type TEXT;
	s_corp_sz TEXT;
	i_labrr_cnt INTEGER;
	bi_cap BIGINT;
	bi_year_sales BIGINT;
	s_career TEXT;
	s_acdmcr TEXT;
	s_wage_type TEXT;
	s_sal1 TEXT;
	s_sal2 TEXT;
	bi_salary BIGINT;
	s_work_type TEXT;
	s_emplym_type1 TEXT;
	s_emplym_type2 TEXT;
	s_emplym_type TEXT;
	s_rcrit_jssfc TEXT;
	s_rcrit_jssfc_tmp TEXT;
	i_rcrit_psn INTEGER;
	s_reg_dt TEXT;
	s_clos_dt TEXT;
	s_work_addr TEXT;
	
	s_work_region TEXT;
	
	s_acdmcr_tmp TEXT;
	
BEGIN	
	
	/* ---------------------------------------------------------------------------------------------------------
    Step00. 워크넷/인크루트 구인 자료 읽기
 	--------------------------------------------------------------------------------------------------------- */
 	/* -------------------------------------------------------------------------
    Step00-01. 워크넷 구인 자료 통합 및 정제
 	------------------------------------------------------------------------- */
 	RAISE INFO '=> Step00-01. 워크넷 구인 자료 통합 및 정제'; 

	/* 작업당일 자료 삭제 */
	DELETE FROM jobsvc.srv_dt_job_sm_refine WHERE create_dt = p_date;

	RAISE INFO '=> Step00-01-01. 워크넷 구인 자료 통합 및 정제'; 
 	FOR r IN cs_worknet_guin LOOP

	 	/* ID생성 mmdd+job_data_key */	 	
	 	s_jo_no := SUBSTRING(p_date,5,8)||LPAD(r.jo_auth_no,16,'0');	 	

	 	/* 산업분류(업종) 명칭 코드 변환 */
	 	s_indust_class_tmp := REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(r.indust_class,'.',''),';',''),',',''),' ',''),'ㆍ','');

	 	-- 과거 업종 => 표준산업분류10차개정 명칭 현행화
	 	IF (s_indust_class_tmp = '자동차용신품조향장치및현가장치제조업') THEN
	 		s_indust_class_tmp := '자동차용신품조향장치현가장치제조업';
	 	ELSEIF (s_indust_class_tmp = '자동차재제조부품제조업') THEN
	 		s_indust_class_tmp := '자동차중고부품재제조업';
	 	ELSEIF (s_indust_class_tmp = '건설업본사') THEN
	 		s_indust_class_tmp := '종합건설업';
	 	END IF;

	 	SELECT MAX(s_class_cd) INTO s_indust_class 
	 	  FROM jobsvc.cmm_cd_comcd 
	 	 WHERE b_class_cd = 'INDCLA' 
	 	   AND s_class_cd_nm = s_indust_class_tmp
	 	;	 	

	 	/* 기업형태(대기업,중기업,..) 코드 변환 */
	 	SELECT MAX(s_class_cd) INTO s_entrprs_type
	 	  FROM jobsvc.cmm_cd_comcd
	 	 WHERE b_class_cd = 'ENTTYP' 
	 	   AND s_class_cd_nm = r.entrprs_type
	 	;
	 	IF (s_entrprs_type = '' OR s_entrprs_type IS NULL) THEN
	 		s_entrprs_type := '99';
	 	END IF;

	 	/* 근로자수 정제 */
	 	i_labrr_cnt := SPLIT_PART(r.labrr_cnt,' ',1)::INTEGER ;

	 	/* 회사규모(종업원 수) 코드 변환 */
	 	IF (5 > i_labrr_cnt) THEN
	 		s_corp_sz := 'W5';
	 	ELSEIF (5 <= i_labrr_cnt AND i_labrr_cnt < 30) THEN
	 		s_corp_sz := 'W10';
	 	ELSEIF (30 <= i_labrr_cnt AND i_labrr_cnt < 50) THEN
	 		s_corp_sz := 'W30';
	 	ELSEIF (50 <= i_labrr_cnt AND i_labrr_cnt < 100) THEN
	 		s_corp_sz := 'W50';
	 	ELSE
	 		s_corp_sz := 'W100';
	 	END IF;

	 	/* 자본금 / 연매출액 숫자 정제 */
	 	bi_cap := REPLACE(REPLACE(COALESCE(r.cap,'0'),' ',''),'백만원','000000')::BIGINT ;
	 	bi_year_sales := REPLACE(REPLACE(COALESCE(r.year_sales,'0'),' ',''),'백만원','000000')::BIGINT ;

	 	/* 경력 명칭 코드 변환 */
	 	SELECT MAX(s_class_cd) INTO s_career 
	 	  FROM jobsvc.cmm_cd_comcd
	 	 WHERE b_class_cd = 'CAREER' 
	 	   AND s_class_cd_nm = r.career
	 	;

	 	/* 학력 명칭 코드 변환 */
	 	/* 2019.01.03 워크넷 학력 구간으로 데이터 구조 변경 */
	 	s_acdmcr_tmp := SPLIT_PART(r.acdmcr, '-', 1);
	 	
	 	SELECT MAX(s_class_cd) INTO s_acdmcr 
	 	  FROM jobsvc.cmm_cd_comcd
	 	 WHERE b_class_cd = 'ACDMCR' 
	 	   AND s_class_cd_nm = TRIM(s_acdmcr_tmp)
	 	;
	 	IF (s_acdmcr = '' OR s_acdmcr IS NULL) THEN
	 		s_acdmcr := '00';
	 	END IF;

	 	/* 임금형태 명칭 코드 변환 */
	 	SELECT MAX(s_class_cd) INTO s_wage_type
	 	  FROM jobsvc.cmm_cd_comcd
	 	 WHERE b_class_cd = 'WAGETY' 
	 	   AND s_class_cd_nm = r.wage_type
	 	;
	 	
	 	/* 급여 숫자 정제 및 구간 분리 최대 급여만 반영 */
	 	s_sal1 := REPLACE(REPLACE(SPLIT_PART(REPLACE(r.salary,' ',''),'~',1),'원',''),'만','0000');
	 	IF s_sal1 = '' THEN
	 		s_sal1 := '0';
	 	END IF;
	 	s_sal2 := REPLACE(REPLACE(SPLIT_PART(REPLACE(r.salary,' ',''),'~',2),'원',''),'만','0000');
	 	IF s_sal2 = '' THEN
	 		s_sal2 := '0';
	 	END IF;

	 	IF s_sal2 = '0' THEN
	 		bi_salary := s_sal1::BIGINT;
	 	ELSE
	 		bi_salary := s_sal2::BIGINT;
	 	END IF;

	 	/* 근무형태 명칭 코드 변환 */
	 	SELECT MAX(s_class_cd) INTO s_work_type
	 	  FROM jobsvc.cmm_cd_comcd
	 	 WHERE b_class_cd = 'WORKTY' 
	 	   AND s_class_cd_nm = r.work_type
	 	;	 	
	 	IF (s_work_type = '' OR s_work_type IS NULL) THEN
	 		s_work_type := '9';
	 	END IF;

	 	/* 고용형태 정제 */
		s_emplym_type1 := SPLIT_PART(SPLIT_PART(r.emplym_type,'/',1),'약',1)||'약';
		s_emplym_type2 := SPLIT_PART(TRIM(SPLIT_PART(SPLIT_PART(r.emplym_type,'/',1),'약',2)),'제)',1);

		IF s_emplym_type2 = '(시간(선택)' THEN
			s_emplym_type := s_emplym_type1||s_emplym_type2||'제)';
		ELSE
			s_emplym_type := s_emplym_type1;
		END IF;

		SELECT MAX(s_class_cd) INTO s_emplym_type 
	 	  FROM jobsvc.cmm_cd_comcd
	 	 WHERE b_class_cd = 'EMPTYP' 
	 	   AND s_class_cd_nm = s_emplym_type
	 	;

		/* 모집직종 코드 추출 */
		s_rcrit_jssfc := REPLACE(TRIM(SUBSTRING(r.rcrit_jssfc,LENGTH(r.rcrit_jssfc)-6,LENGTH(r.rcrit_jssfc))),')','');

		/* 모집인원 형변환 */
		i_rcrit_psn := r.rcrit_psn::INTEGER;

		/* 등록일자, 마감일자 정제 */
		--RAISE INFO '=> Step00-01-02. 워크넷 구인 자료 통합 및 정제=>%', r.reg_dt; 
		s_reg_dt := TO_CHAR(TO_DATE(r.reg_dt,'yy-mm-dd'),'yyyymmdd');
		--RAISE INFO '=> Step00-01-02-01. 워크넷 구인 자료 통합 및 정제=>%', r.rcept_clos_dt; 
		/*IF r.rcept_clos_dt = '채용시까지' THEN
			s_clos_dt := SPLIT_PART(r.clos_dt, '  ', 2);
			IF s_clos_dt = '' THEN
				s_clos_dt := r.clos_dt;
			END IF;
		ELSE
			s_clos_dt := r.clos_dt;
		END IF;*/
		/* 2018.11.12 데이터 형식 변경 됨 */
		s_clos_dt := SPLIT_PART(r.clos_dt, '  ', 2);
		
		IF s_clos_dt = '' THEN
			s_clos_dt := r.clos_dt;
		END IF;


		-- RAISE INFO '=> Step00-01-03. 워크넷 구인 자료 통합 및 정제=>%', s_clos_dt; 
		s_clos_dt := TO_CHAR(TO_DATE(s_clos_dt,'yy-mm-dd'),'yyyymmdd');

		/* 근무지 주소 정제, 근무지 시도/시군구/읍면동 분리 */
		s_work_addr := TRIM(SUBSTRING(r.work_intspt,LENGTH(SPLIT_PART(r.work_intspt,' ',1))+2,LENGTH(r.work_intspt)));
		s_sido_cd := '';
		s_sgg_cd := '';
		s_emdong_cd := '';

		/* 오늘의 구인 현황 저장 */
	 	INSERT INTO jobsvc.srv_dt_job_sm_refine 
		( jo_no, corp_nm, bsnm_no, indust_class, entrprs_type, corp_sz, labrr_cnt, corp_addr, cap, main_nm, year_sales, main_biz_content, corp_hpage, recru_nm
		, career, acdmcr, wage_type, salary, work_type, emplym_type, rcrit_jssfc, rcrit_psn, reg_dt, clos_dt
		, jo_data_div, jo_data_key, jo_auth_no
		, work_region, work_addr, sido_cd, sgg_cd, emdong_cd, create_dt )
		VALUES
		( s_jo_no, r.corp_nm, r.bsnm_no, s_indust_class, s_entrprs_type, s_corp_sz, i_labrr_cnt, r.corp_addr, bi_cap, r.main_nm, bi_year_sales, r.main_biz_content, r.corp_hpage, r.recru_nm
		, s_career, s_acdmcr, s_wage_type, bi_salary, s_work_type, s_emplym_type, s_rcrit_jssfc, i_rcrit_psn, s_reg_dt, s_clos_dt
		, r.jo_data_div, r.jo_data_key, r.jo_auth_no
		, r.work_region, s_work_addr, s_sido_cd, s_sgg_cd, s_emdong_cd, r.create_dt )
		;
	
	END LOOP;

	/* -------------------------------------------------------------------------
    Step00-02. 인크루트 구인 자료 통합 및 정제
    History. 2018.12.01 중복허용 수정 - 워크넷/인크루트 공고번호 모두 표시
 	------------------------------------------------------------------------- */
 	 RAISE INFO '=> Step00-02. 인크루트 구인 자료 통합 및 정제'; 
	/* 인크루트 구인자료 일자리 구축 */
	FOR r IN cs_incruit_guin LOOP

	 	/* ID생성 */
	 	s_jo_no := SUBSTRING(p_date,5,8)||LPAD(r.pblanc_no,16,'0');

	 	/* 산업분류(업종) 명칭 코드 변환 => 2017사업체 정보 맵핑 코드 추출 */
	 	-- s_indust_class_tmp := r.biz_nm;	 	

	 	SELECT MAX(indust_class) INTO s_indust_class
	 	  FROM jobsvc.saupche_tb_2017_refine 
	 	 WHERE crn = TRIM(r.bsnm_no)
	 	;

	 	IF (s_indust_class = '' OR s_indust_class IS NULL) THEN
	 		s_indust_class := '000000';
	 	END IF;

	 	/* 기업형태("소기업","중소기업","중견기업","중기업","대기업"..) 코드 변환 */	 	
	 	SELECT MAX(s_class_cd) INTO s_entrprs_type
	 	  FROM jobsvc.cmm_cd_comcd
	 	 WHERE b_class_cd = 'ENTTYP' 
	 	   AND s_class_cd_nm = r.entrprs_type
	 	;
	 	IF (s_entrprs_type = '' OR s_entrprs_type IS NULL) THEN
	 		s_entrprs_type := '99';
	 	END IF;
	 	/* 중소기업=>소기업 변환 */
	 	IF (r.entrprs_type = '중소기업') THEN
	 		s_entrprs_type := '07';
	 	END IF;

	 	/* 근로자수 정제 => 근로자수 정보 없어 산정 불가 */	 	
	 	i_labrr_cnt := 0 ;

	 	/* 회사규모(종업원 수) 코드 변환 => 근로자수 정보 없어 산정 불가 */
	 	s_corp_sz := 'W99';	-- 산정불가

	 	/* 자본금 / 연매출액 숫자 정제  => 자본금 정보 없어 산정 불가*/
	 	bi_cap := 0 ;
	 	bi_year_sales := 0 ;
	 		 		 	
	 	/* 경력 명칭 코드 변환 */
	 	IF (r.nwmb_yn = 'Y' AND r.career_yn = 'N') THEN
	 		s_career := 'N';
	 	ELSEIF (r.nwmb_yn = 'N' AND r.career_yn = 'Y') THEN
	 		s_career := 'E';
	 	ELSE
	 		s_career := 'Z';
	 	END IF;	 	

	 	/* 학력 명칭 코드 변환 */
	 	IF (r.acdmcr = '초등학교졸업') THEN
	 		s_acdmcr := '01';
	 	ELSEIF (r.acdmcr = '중학교졸업') THEN
	 		s_acdmcr := '02';
	 	ELSEIF (r.acdmcr = '고등학교졸업') THEN 	
	 		s_acdmcr := '03';
	 	ELSEIF (r.acdmcr = '대학(2,3년)졸업') THEN	 	
	 		s_acdmcr := '04';
	 	ELSEIF (r.acdmcr = '대학교(4년)졸업')	 THEN
	 		s_acdmcr := '05';
	 	ELSEIF (r.acdmcr = '석사졸업') THEN
	 		s_acdmcr := '06';
	 	ELSEIF (r.acdmcr = '박사졸업') THEN	
	 		s_acdmcr := '07';
	 	ELSE
	 		s_acdmcr := '00';
	 	END IF;	 	

	 	/* 임금형태 명칭 코드 변환 => 임금형태 정보 없어 산정 불가 급여로 임시 산정 함*/
	 	s_wage_type := 'Y';	-- 연봉으로 초기값 설정
	 	
	 	/* 급여 숫자 정제 및 구간 분리 최대 급여만 반영 */
	 	/*5 => 시급
		8 => 년봉 환산불필요
		6 => 일당
		4 => 년봉
		1 => 협의
		7 => 월급 */
		/*	Salary_Detail": "협의 후 결정
			Salary_Detail": "회사내규
			Salary_Detail": "월급 5000000원
			Salary_Detail": "연봉 2200만원 */
	 	s_sal1 := r.anslry_1;

	 	IF (s_sal1 = '협의 후 결정' OR s_sal1 = '회사내규') THEN
	 		s_sal1 := '0';	-- 년봉환산
	 	ELSE
	 		s_wage_type := SPLIT_PART(r.anslry_1,' ',1);  -- "월급"
			s_sal1 := REPLACE(REPLACE(SPLIT_PART(r.anslry_1,' ',2),'원',''),'만','0000'); -- "5000000"
	 	END IF;	
	 		 	
	 	IF (s_wage_type = '시급') THEN
	 		s_wage_type := 'H';			-- 시급
	 	ELSEIF (s_wage_type = '일급') THEN
	 		s_wage_type := 'D';			-- 일급
	 	ELSEIF (s_wage_type = '월급') THEN
	 		s_wage_type := 'M';			-- 월급
	 	ELSE
	 		s_wage_type := 'Y';			-- 연봉
	 	END IF;

	 	IF s_sal1 = '' THEN
	 		bi_salary := 0;
	 	ELSE
	 		bi_salary := s_sal1::BIGINT;
	 	END IF;

	 	/*IF LENGTH(s_sal1) = 4 THEN
	 		s_sal1 := s_sal1||'0000';	-- 년봉환산
	 	ELSEIF LENGTH(s_sal1) = 5 THEN
	 		s_wage_type := 'H';			-- 시급
	 	ELSEIF LENGTH(s_sal1) = 6 THEN
	 		s_wage_type := 'D';			-- 일급
	 	ELSEIF LENGTH(s_sal1) = 7 THEN
	 		s_wage_type := 'M';			-- 월급
	 	END IF;

	 	s_sal2 := r.anslry_2;
	 	IF LENGTH(s_sal2) = 4 THEN
	 		s_sal2 := s_sal2||'0000';	-- 년봉환산	 	
	 	END IF;

	 	IF s_sal2 = '0' THEN
	 		bi_salary := s_sal1::BIGINT;
	 	ELSE
	 		bi_salary := s_sal2::BIGINT;
	 	END IF;*/

	 	/* 근무형태 명칭 코드 변환 => 근무형태 정보 없어 산정 불가 */	 	
 		s_work_type := '9';	-- 기타로 기본 설정

	 	/* 고용형태 정제 */
		s_emplym_type1 := SPLIT_PART(r.emplym_type,'|',2) ;

		IF s_emplym_type1 = '정규직' THEN
			s_emplym_type := '10';
		ELSEIF s_emplym_type1 = '파견직' THEN
			s_emplym_type := '4';
		ELSEIF s_emplym_type1 = '시간(선택)제' THEN
			s_emplym_type := '21';
		ELSE
			s_emplym_type := '20';	/* '위촉직','계약직','병역특례','알바','프리랜서','교육생(연수생)','계약직 후 정규직 전환 검토','인턴' */
		END IF;

		/* 모집직종 코드 추출 */
		s_rcrit_jssfc_tmp := SPLIT_PART(SPLIT_PART(r.rcrit_jssfc_list,'|',2),'>',2) ;

		SELECT MAX(s_class_cd) INTO s_rcrit_jssfc 
	 	  FROM jobsvc.cmm_cd_comcd
	 	 WHERE b_class_cd = 'IRCRJS' 
	 	   AND s_class_cd_nm = s_rcrit_jssfc_tmp
	 	;

	 	IF (s_rcrit_jssfc = '' OR s_rcrit_jssfc IS NULL) THEN
	 		s_rcrit_jssfc := '000000';		
		END IF;

		/* 모집인원 형변환 */
		IF (TRIM(r.rcrit_psn) = '0') THEN
	 		i_rcrit_psn := 1;
	 	ELSEIF (TRIM(r.rcrit_psn) = '00') THEN
	 		i_rcrit_psn := 10;
	 	ELSEIF (TRIM(r.rcrit_psn) = '000') THEN 	
	 		i_rcrit_psn := 100;
	 	ELSEIF (TRIM(r.rcrit_psn) = '0000') THEN	 	
	 		i_rcrit_psn := 1000;
	 	ELSE
	 		i_rcrit_psn := r.rcrit_psn::INTEGER;
	 	END IF;	 		

		/* 등록일자, 마감일자 정제 */
		--s_reg_dt := TO_CHAR(DATE(r.rcrit_dt),'yyyymmdd');
		--s_clos_dt := TO_CHAR(DATE(r.clos_dt),'yyyymmdd');
		s_reg_dt := r.rcrit_dt;
		s_clos_dt := r.clos_dt;

		/* 근무지 주소 정제 => 근무지 주소 정보 없어 회사주소로 대체 */
		s_work_region := SPLIT_PART(r.rcrit_region_list,'^',1);
		s_work_addr := r.corp_addr;
		s_sido_cd := '';
		s_sgg_cd := '';
		s_emdong_cd := '';

		/* 오늘의 구인 현황 저장 */
	 	INSERT INTO jobsvc.srv_dt_job_sm_refine 
		( jo_no, corp_nm, bsnm_no, indust_class, entrprs_type, corp_sz, labrr_cnt, corp_addr, cap, main_nm, year_sales, main_biz_content, corp_hpage, recru_nm
		, career, acdmcr, wage_type, salary, work_type, emplym_type, rcrit_jssfc, rcrit_psn, reg_dt, clos_dt
		, jo_data_div, jo_data_key, jo_auth_no, pblanc_no
		, work_region, work_addr, sido_cd, sgg_cd, emdong_cd, create_dt )
		VALUES
		( s_jo_no, r.entrprs_nm, r.bsnm_no, s_indust_class, s_entrprs_type, s_corp_sz, i_labrr_cnt, r.corp_addr, bi_cap, '', bi_year_sales, '', '', r.pblanc_nm
		, s_career, s_acdmcr, s_wage_type, bi_salary, s_work_type, s_emplym_type, s_rcrit_jssfc, i_rcrit_psn, s_reg_dt, s_clos_dt
		, r.jo_data_div, r.jo_data_key, r.jo_auth_no, r.pblanc_no
		, s_work_region, s_work_addr, s_sido_cd, s_sgg_cd, s_emdong_cd, r.create_dt )
		;
	
	END LOOP;

	RETURN 'OK';

EXCEPTION WHEN OTHERS THEN 
	RAISE NOTICE '% %', SQLERRM, SQLSTATE;
	RETURN SQLERRM;

END;
$$ LANGUAGE plpgsql;