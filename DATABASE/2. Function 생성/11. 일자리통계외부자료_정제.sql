CREATE OR REPLACE FUNCTION FN_JOB_EXTENAL_FILE_DATA_REFINE()
	RETURNS TEXT
    AS $$

DECLARE

BEGIN
	DELETE FROM jobsvc.srv_dt_kosis_data WHERE link_id like 'E32%';

	/* -------------------------------------------------------------------------
    Step00-01. 일자리증감 > 외부자료 집계 > 전국
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_total as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '00' as c1
		 , '전국' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;

	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 집계 > 전국 완료!!!'; 

	 /* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 서울
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_11 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '11' as c1
		 , '서울특별시' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 서울특별시 > 서울특별시 완료!!!'; 

	/* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 부산광역시
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_21 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '21' as c1
		 , '부산광역시' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 부산광역시 > 부산광역시 완료!!!'; 

	/* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 대구광역시
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_22 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '22' as c1
		 , '대구광역시' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 대구광역시 > 대구광역시 완료!!!'; 

	 /* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 인천광역시
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_23 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '23' as c1
		 , '인천광역시' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 인천광역시 > 인천광역시 완료!!!'; 

	  /* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 광주광역시
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_24 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '24' as c1
		 , '광주광역시' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 광주광역시 > 광주광역시 완료!!!'; 

	/* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 대전광역시
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_25 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '25' as c1
		 , '대전광역시' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 대전광역시 > 대전광역시 완료!!!'; 

	 /* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 울산광역시
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_26 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '26' as c1
		 , '울산광역시' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 울산광역시 > 울산광역시 완료!!!'; 

	/* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 세종특별자치시
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_29 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '29' as c1
		 , '세종특별자치시' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 세종특별자치시 > 세종특별자치시 완료!!!'; 

	 /* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 경기도
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_31 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '31' as c1
		 , '경기도' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 경기도 > 경기도 완료!!!';

	/* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 강원도
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_32 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '32' as c1
		 , '강원도' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 강원도 > 강원도 완료!!!'; 

	/* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 충청북도
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_33 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '33' as c1
		 , '충청북도' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 충청북도 > 충청북도 완료!!!';

	 /* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 충청남도
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_34 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '34' as c1
		 , '충청남도' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 충청남도 > 충청남도 완료!!!'; 

	  /* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 전라북도
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_35 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '35' as c1
		 , '전라북도' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 충청남도 > 전라북도 완료!!!'; 

	/* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 전라남도
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_36 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '36' as c1
		 , '전라남도' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 전라남도 > 전라남도 완료!!!'; 

	 /* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 경상북도
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_37 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '37' as c1
		 , '경상북도' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 경상북도 > 경상북도 완료!!!';

	/* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 경상남도
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_38 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '38' as c1
		 , '경상남도' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 경상남도 > 경상남도 완료!!!'; 

	 /* -------------------------------------------------------------------------
    Step00-02. 일자리증감 > 외부자료 집계 > 제주특별자치도
 	------------------------------------------------------------------------- */
	INSERT INTO jobsvc.srv_dt_kosis_data ( itm_id, itm_nm, org_id, prd_de, tbl_id, tbl_nm, dt, unit_nm, c1, c1_nm, link_id, create_dt )
	SELECT CASE WHEN itm_nm = '신규구인인원(명)' THEN 'T10'
		 		WHEN itm_nm = '전대비 증감율(%)' THEN 'T20'
		 		WHEN itm_nm = '구인배수' THEN 'T30'
		 		WHEN itm_nm = '취득자수(명)' THEN 'T40'
		 		WHEN itm_nm = '상실자수(명)' THEN 'T50'	 
		 		WHEN itm_nm = '취업건수(명)' THEN 'T60'
		 		WHEN itm_nm = '신규구직건수(건)' THEN 'T70' END itm_id
		 , itm_nm
		 , '101'
		 , prd_de
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'TBL_E3222'
		 		WHEN tbl_nm = '상실자_지역별' THEN 'TBL_E3223'
		 		WHEN tbl_nm = '피보험자_지역별' THEN 'TBL_E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'TBL_E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'TBL_E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'TBL_E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'TBL_E3219' END tbl_id
		 , tbl_nm	 
		 , area_39 as dt
		 , replace(split_part(itm_nm,'(',2),')','') as unit_nm
		 , '39' as c1
		 , '제주특별자치도' as c1_nm
		 , CASE WHEN tbl_nm = '취득자_지역별' THEN 'E3222'
				WHEN tbl_nm = '상실자_지역별' THEN 'E3223'
				WHEN tbl_nm = '피보험자_지역별' THEN 'E3224'
				WHEN tbl_nm = '구인인원_지역별' THEN 'E3208'
				WHEN tbl_nm = '구인배수_지역별' THEN 'E3221'
				WHEN tbl_nm = '구직건수_지역별' THEN 'E3218'
				WHEN tbl_nm = '취업건수_지역별' THEN 'E3219' END link_id
		 , TO_CHAR(now(),'yyyymmdd') as create_dt
	 FROM jobsvc.srv_dt_job_external_file_raw
	 ;
	 RAISE INFO '=> Step00-01. 일자리증감 > 외부자료 제주특별자치도 > 제주특별자치도 완료!!!'; 
	 
	 DELETE FROM jobsvc.srv_dt_job_external_file_raw; 
	 RAISE INFO '=> Step00-02. 원시자료 삭제 완료!!!';

	RETURN 'OK';

EXCEPTION WHEN OTHERS THEN 
	RAISE NOTICE '% %', SQLERRM, SQLSTATE;
	RETURN SQLERRM;

END;
$$ LANGUAGE plpgsql;