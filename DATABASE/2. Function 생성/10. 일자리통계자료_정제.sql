CREATE OR REPLACE FUNCTION FN_JOB_KOSIS_DATA_REFINE()
	RETURNS TEXT
    AS $$

DECLARE
	cs_get_new_kosis_data CURSOR FOR
		SELECT link_id
			 , prd_de
		  FROM jobsvc.srv_dt_kosis_data 
		 GROUP BY link_id, prd_de
		 ;	
		 
	r RECORD;
BEGIN	
	
	/* ---------------------------------------------------------------------------------------------------------
    Step00. 일자리통계자료 정제 최신자료 현행화
    History. 2018-12-04 : 인구(I3101, I3102, I3103) 시도 변환 추가
 	--------------------------------------------------------------------------------------------------------- */
	/* -------------------------------------------------------------------------
    Step00-00. 2018-12-04 : 인구(I3101, I3102, I3103), 신설법인수:I3206, 폐업수:I3207  시도 변환
 	------------------------------------------------------------------------- */
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '21' where link_id in ('I3101','I3102','I3103') and c1 = '26';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '22' where link_id in ('I3101','I3102','I3103') and c1 = '27';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '23' where link_id in ('I3101','I3102','I3103') and c1 = '28';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '24' where link_id in ('I3101','I3102','I3103') and c1 = '29';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '25' where link_id in ('I3101','I3102','I3103') and c1 = '30';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '26' where link_id in ('I3101','I3102','I3103') and c1 = '31';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '29' where link_id in ('I3101','I3102','I3103') and c1 = '36';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '31' where link_id in ('I3101','I3102','I3103') and c1 = '41';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '32' where link_id in ('I3101','I3102','I3103') and c1 = '42';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '33' where link_id in ('I3101','I3102','I3103') and c1 = '43';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '34' where link_id in ('I3101','I3102','I3103') and c1 = '44';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '35' where link_id in ('I3101','I3102','I3103') and c1 = '45';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '36' where link_id in ('I3101','I3102','I3103') and c1 = '46';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '37' where link_id in ('I3101','I3102','I3103') and c1 = '47';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '38' where link_id in ('I3101','I3102','I3103') and c1 = '48';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '39' where link_id in ('I3101','I3102','I3103') and c1 = '50';
	
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '32' where link_id in ('I3207') and c1 = 'A04';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '31' where link_id in ('I3207') and c1 = 'A03';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '38' where link_id in ('I3207') and c1 = 'A16';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '37' where link_id in ('I3207') and c1 = 'A13';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '24' where link_id in ('I3207') and c1 = 'A09';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '22' where link_id in ('I3207') and c1 = 'A12';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '25' where link_id in ('I3207') and c1 = 'A05';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '21' where link_id in ('I3207') and c1 = 'A14';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '11' where link_id in ('I3207') and c1 = 'A01';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '29' where link_id in ('I3207') and c1 = 'A08';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '26' where link_id in ('I3207') and c1 = 'A15';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '23' where link_id in ('I3207') and c1 = 'A02';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '36' where link_id in ('I3207') and c1 = 'A11';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '35' where link_id in ('I3207') and c1 = 'A10';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '39' where link_id in ('I3207') and c1 = 'A17';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '34' where link_id in ('I3207') and c1 = 'A07';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '33' where link_id in ('I3207') and c1 = 'A06';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '00' where link_id in ('I3207') and c1 = 'A00';

	--update jobsvc.SRV_DT_KOSIS_DATA set  c1 = substring(c1,8,2) where link_id in ('I3206');
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '32' where link_id = 'I3206' and c1_nm = '강원';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '31' where link_id = 'I3206' and c1_nm = '경기';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '38' where link_id = 'I3206' and c1_nm = '경남';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '37' where link_id = 'I3206' and c1_nm = '경북';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '24' where link_id = 'I3206' and c1_nm = '광주';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '22' where link_id = 'I3206' and c1_nm = '대구';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '25' where link_id = 'I3206' and c1_nm = '대전';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '21' where link_id = 'I3206' and c1_nm = '부산';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '11' where link_id = 'I3206' and c1_nm = '서울';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '29' where link_id = 'I3206' and c1_nm = '세종';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '26' where link_id = 'I3206' and c1_nm = '울산';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '23' where link_id = 'I3206' and c1_nm = '인천';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '00' where link_id = 'I3206' and c1_nm = '전국';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '36' where link_id = 'I3206' and c1_nm = '전남';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '35' where link_id = 'I3206' and c1_nm = '전북';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '39' where link_id = 'I3206' and c1_nm = '제주';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '34' where link_id = 'I3206' and c1_nm = '충남';
	update jobsvc.SRV_DT_KOSIS_DATA set c1 = '33' where link_id = 'I3206' and c1_nm = '충북';

 	FOR r IN cs_get_new_kosis_data LOOP
	 	/* -------------------------------------------------------------------------
	    Step00-01. 정제테이블 중복자료 자료 삭제
	 	------------------------------------------------------------------------- */
	 	-- RAISE INFO '=> Step00-01. 정제테이블 중복자료 자료 삭제'; 
	 	DELETE FROM jobsvc.srv_dt_kosis_data_raw WHERE link_id = r.link_id AND prd_de = r.prd_de
	 	;
	 	DELETE FROM jobsvc.srv_dt_kosis_data_refine WHERE link_id = r.link_id AND prd_de = r.prd_de
	 	;
	
		/* -------------------------------------------------------------------------
	    Step00-02. 수집테이블 -> 정제테이블 자료 이관
	 	------------------------------------------------------------------------- */
	 	-- RAISE INFO '=> Step00-02. 수집테이블 -> 정제테이블 자료 이관 '; 
		INSERT
		  INTO jobsvc.srv_dt_kosis_data_refine (
			   itm_id, org_id, tbl_id, dt, link_id, prd_de, c1, create_dt, prd_se, itm_nm, itm_nm_eng, tbl_nm, unit_nm, unit_nm_eng, c1_nm, c1_nm_eng, c1_obj_nm, c1_obj_nm_eng, c2, c2_nm, c2_nm_eng, c2_obj_nm, c2_obj_nm_eng, c3, c3_nm, c3_nm_eng, c3_obj_nm, c3_obj_nm_eng)
		SELECT itm_id, org_id, tbl_id, dt, link_id, prd_de, c1, create_dt, max(prd_se) prd_se, max(itm_nm) itm_nm, max(itm_nm_eng) itm_nm_eng, max(tbl_nm) tbl_nm, max(unit_nm) unit_nm, max(unit_nm_eng) unit_nm_eng, max(c1_nm) c1_nm, max(c1_nm_eng) c1_nm_eng, max(c1_obj_nm) c1_obj_nm, max(c1_obj_nm_eng) c1_obj_nm_eng, c2, max(c2_nm) c2_nm, max(c2_nm_eng) c2_nm_eng, max(c2_obj_nm) c2_obj_nm, max(c2_obj_nm_eng) c2_obj_nm_eng, c3, max(c3_nm) c3_nm, max(c3_nm_eng) c3_nm_eng, max(c3_obj_nm) c3_obj_nm, max(c3_obj_nm_eng) c3_obj_nm_eng
		  FROM jobsvc.srv_dt_kosis_data 
		 WHERE link_id = r.link_id AND prd_de = r.prd_de
		group by itm_id, org_id, tbl_id, dt, link_id, prd_de, c1, create_dt, c2, c3		 
		;
		
 	END LOOP;

	/* -------------------------------------------------------------------------
    Step00-03. 수집테이블 -> 원시테이블 이관 / 수집테이블 자료 삭제
 	------------------------------------------------------------------------- */
 	/* 원시테이블 이관 */
	INSERT
	  INTO jobsvc.srv_dt_kosis_data_raw (
		   itm_id, org_id, tbl_id, dt, link_id, prd_de, c1, create_dt, prd_se, itm_nm, itm_nm_eng, tbl_nm, unit_nm, unit_nm_eng, c1_nm, c1_nm_eng, c1_obj_nm, c1_obj_nm_eng, c2, c2_nm, c2_nm_eng, c2_obj_nm, c2_obj_nm_eng, c3, c3_nm, c3_nm_eng, c3_obj_nm, c3_obj_nm_eng)
	SELECT itm_id, org_id, tbl_id, dt, link_id, prd_de, c1, create_dt, max(prd_se) prd_se, max(itm_nm) itm_nm, max(itm_nm_eng) itm_nm_eng, max(tbl_nm) tbl_nm, max(unit_nm) unit_nm, max(unit_nm_eng) unit_nm_eng, max(c1_nm) c1_nm, max(c1_nm_eng) c1_nm_eng, max(c1_obj_nm) c1_obj_nm, max(c1_obj_nm_eng) c1_obj_nm_eng, c2, max(c2_nm) c2_nm, max(c2_nm_eng) c2_nm_eng, max(c2_obj_nm) c2_obj_nm, max(c2_obj_nm_eng) c2_obj_nm_eng, c3, max(c3_nm) c3_nm, max(c3_nm_eng) c3_nm_eng, max(c3_obj_nm) c3_obj_nm, max(c3_obj_nm_eng) c3_obj_nm_eng
	  FROM jobsvc.srv_dt_kosis_data
	group by itm_id, org_id, tbl_id, dt, link_id, prd_de, c1, create_dt, c2, c3		 
	;

	/* 수집 테이블 자료 삭제 */
 	DELETE FROM jobsvc.srv_dt_kosis_data;

	RETURN 'OK';

EXCEPTION WHEN OTHERS THEN 
	RAISE NOTICE '% %', SQLERRM, SQLSTATE;
	RETURN SQLERRM;

END;
$$ LANGUAGE plpgsql;