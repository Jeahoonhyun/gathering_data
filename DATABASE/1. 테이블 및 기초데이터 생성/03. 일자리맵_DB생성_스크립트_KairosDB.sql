/*
	DROP TABLE srv_dt_job_sm_refine CASCADE;
	DROP TABLE srv_dt_job_sm CASCADE;
	DROP TABLE srv_dt_job_hope_area_sm CASCADE;
	DROP TABLE srv_dt_job_entrprs_type_sm CASCADE;
	DROP TABLE srv_dt_job_corp_sz_sm CASCADE;
	DROP TABLE srv_dt_job_indust_class_sm CASCADE;
	DROP TABLE srv_dt_job_jssfc_sm CASCADE;
	DROP TABLE srv_dt_job_salary_sm CASCADE;
	DROP TABLE srv_dt_job_emplym_type_sm CASCADE;
	DROP TABLE srv_dt_job_work_type_sm CASCADE;
	DROP TABLE srv_dt_job_acdmcr_sm CASCADE;
	DROP TABLE srv_dt_job_career_sm CASCADE;
	DROP TABLE srv_dt_job_board_sm CASCADE;
	DROP TABLE srv_dt_job_stat_data_info CASCADE;
	
*/

-- 오늘의구인현황정제
CREATE TABLE SRV_DT_JOB_SM_REFINE (
	JO_NO            CHAR(20)      NOT NULL, -- 구인번호
	CORP_NM          VARCHAR2(100) NOT NULL, -- 회사명
	BSNM_NO          CHAR(13)      NOT NULL, -- 사업자번호
	INDUST_CLASS     VARCHAR2(6)   NOT NULL, -- 산업분류
	ENTRPRS_TYPE     CHAR(2)       NOT NULL, -- 기업형태
	CORP_SZ          VARCHAR2(4)   NOT NULL, -- 회사규모
	LABRR_CNT        INTEGER       NOT NULL, -- 근로자수
	CORP_ADDR        VARCHAR2(200) NOT NULL, -- 회사주소
	CAP              BIGINT        NOT NULL, -- 자본금
	MAIN_NM          VARCHAR2(100)  NULL,     -- 대표자명
	YEAR_SALES       BIGINT        NULL,     -- 연매출액
	MAIN_BIZ_CONTENT VARCHAR2(1000) NULL,     -- 주요사업내용
	CORP_HPAGE       VARCHAR2(200) NULL,     -- 회사홈페이지
	RECRU_NM         VARCHAR2(200) NOT NULL, -- 채용명
	CAREER           CHAR(1)       NOT NULL, -- 경력
	ACDMCR           CHAR(2)       NOT NULL, -- 학력
	WAGE_TYPE        CHAR(1)       NOT NULL, -- 임금형태
	SALARY           BIGINT        NOT NULL, -- 급여
	WORK_TYPE        CHAR(1)       NOT NULL, -- 근무형태
	EMPLYM_TYPE      VARCHAR2(2)   NOT NULL, -- 고용형태
	RCRIT_JSSFC      VARCHAR2(6)   NOT NULL, -- 모집직종
	RCRIT_PSN        INTEGER       NOT NULL, -- 모집인원
	REG_DT           CHAR(8)       NOT NULL, -- 등록일자
	CLOS_DT          CHAR(8)       NOT NULL, -- 마감일자
	JO_AUTH_NO       VARCHAR2(20)  NULL,     -- 구인인증번호
	PBLANC_NO        VARCHAR2(20)  NULL,     -- 공고번호
	JO_DATA_DIV      CHAR(1)       NOT NULL, -- 구인자료구분
	JO_DATA_KEY      VARCHAR2(20)  NOT NULL, -- 구인자료키
	WORK_REGION      VARCHAR2(200) NOT NULL, -- 근무지역
	WORK_ADDR        VARCHAR2(200) NOT NULL, -- 근무주소
	SIDO_CD          CHAR(2)       NOT NULL, -- 시도코드
	SGG_CD           CHAR(3)       NOT NULL, -- 시군구코드
	EMDONG_CD        CHAR(2)       NOT NULL, -- 읍면동코드
	RID              VARCHAR2(10)   NULL,     -- RID
	X                VARCHAR2(20)  NULL,     -- X
	Y                VARCHAR2(20)  NULL,     -- Y
	MAPPING_STATUS   CHAR(1)       NULL,     -- MAPPING_STATUS
	API_NAME         VARCHAR2(8)   NULL,     -- API_NAME
	ADDR             VARCHAR2(200) NULL,     -- ADDR
	TOT_OA_CD        VARCHAR2(15)  NULL,     -- TOT_OA_CD
	TOT_X            VARCHAR2(20)  NULL,     -- TOT_X
	TOT_Y            VARCHAR2(20)  NULL,     -- TOT_Y
	PNU              VARCHAR2(20)  NULL,     -- PNU
	MGT              VARCHAR2(30)  NULL,     -- MGT
	CREATE_DT        CHAR(8)       NOT NULL  -- 생성일자
);

-- 오늘의구인현황정제
ALTER TABLE SRV_DT_JOB_SM_REFINE
	ADD
		CONSTRAINT PK_SRV_DT_JOB_SM_REFINE -- 오늘의구인현황정제 기본키
		PRIMARY KEY (
			JO_NO -- 구인번호
		);

-- 오늘의구인현황정제
COMMENT ON TABLE SRV_DT_JOB_SM_REFINE IS '오늘의구인현황정제';

-- 구인번호
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.JO_NO IS '구인번호';

-- 회사명
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.CORP_NM IS '회사명';

-- 사업자번호
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.BSNM_NO IS '사업자번호';

-- 산업분류
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.INDUST_CLASS IS '산업분류';

-- 기업형태
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.ENTRPRS_TYPE IS '기업형태';

-- 회사규모
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.CORP_SZ IS '회사규모';

-- 근로자수
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.LABRR_CNT IS '근로자수';

-- 회사주소
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.CORP_ADDR IS '회사주소';

-- 자본금
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.CAP IS '자본금';

-- 대표자명
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.MAIN_NM IS '대표자명';

-- 연매출액
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.YEAR_SALES IS '연매출액';

-- 주요사업내용
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.MAIN_BIZ_CONTENT IS '주요사업내용';

-- 회사홈페이지
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.CORP_HPAGE IS '회사홈페이지';

-- 채용명
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.RECRU_NM IS '채용명';

-- 경력
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.CAREER IS '경력';

-- 학력
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.ACDMCR IS '학력';

-- 임금형태
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.WAGE_TYPE IS '임금형태';

-- 급여
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.SALARY IS '급여';

-- 근무형태
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.WORK_TYPE IS '근무형태';

-- 고용형태
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.EMPLYM_TYPE IS '고용형태';

-- 모집직종
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.RCRIT_JSSFC IS '모집직종';

-- 모집인원
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.RCRIT_PSN IS '모집인원';

-- 등록일자
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.REG_DT IS '등록일자';

-- 마감일자
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.CLOS_DT IS '마감일자';

-- 구인자료구분
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.JO_DATA_DIV IS '구인자료구분';

-- 구인자료키
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.JO_DATA_KEY IS '구인자료키';

-- 근무지역
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.WORK_REGION IS '근무지역';

-- 근무주소
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.WORK_ADDR IS '근무주소';

-- 시도코드
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.SIDO_CD IS '시도코드';

-- 시군구코드
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.SGG_CD IS '시군구코드';

-- 읍면동코드
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.EMDONG_CD IS '읍면동코드';

-- RID
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.RID IS 'RID';

-- X
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.X IS 'X';

-- Y
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.Y IS 'Y';

-- MAPPING_STATUS
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.MAPPING_STATUS IS 'MAPPING_STATUS';

-- API_NAME
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.API_NAME IS 'API_NAME';

-- ADDR
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.ADDR IS 'ADDR';

-- TOT_OA_CD
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.TOT_OA_CD IS 'TOT_OA_CD';

-- TOT_X
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.TOT_X IS 'TOT_X';

-- TOT_Y
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.TOT_Y IS 'TOT_Y';

-- PNU
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.PNU IS 'PNU';

-- MGT
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.MGT IS 'MGT';

-- 생성일자
COMMENT ON COLUMN SRV_DT_JOB_SM_REFINE.CREATE_DT IS '생성일자';

-- 오늘의구인현황정제 기본키
COMMENT ON INDEX PK_SRV_DT_JOB_SM_REFINE IS '오늘의구인현황정제 기본키';

-- 오늘의구인현황정제 기본키
--COMMENT ON CONSTRAINT SRV_DT_JOB_SM_REFINE.PK_SRV_DT_JOB_SM_REFINE IS '오늘의구인현황정제 기본키';

-- 오늘의구인현황
CREATE TABLE SRV_DT_JOB_SM (
	JO_NO            CHAR(20)       NOT NULL, -- 구인번호
	CORP_NM          VARCHAR2(100)  NOT NULL, -- 회사명
	BSNM_NO          CHAR(13)       NOT NULL, -- 사업자번호
	INDUST_CLASS     VARCHAR2(6)    NOT NULL, -- 산업분류
	ENTRPRS_TYPE     CHAR(2)        NOT NULL, -- 기업형태
	CORP_SZ          VARCHAR2(4)    NOT NULL, -- 회사규모
	LABRR_CNT        INTEGER        NOT NULL, -- 근로자수
	CORP_ADDR        VARCHAR2(200)  NOT NULL, -- 회사주소
	CAP              BIGINT         NOT NULL, -- 자본금
	MAIN_NM          VARCHAR2(100)  NULL,     -- 대표자명
	YEAR_SALES       BIGINT         NULL,     -- 연매출액
	MAIN_BIZ_CONTENT VARCHAR2(1000) NULL,     -- 주요사업내용
	CORP_HPAGE       VARCHAR2(200)  NULL,     -- 회사홈페이지
	RECRU_NM         VARCHAR2(200)  NOT NULL, -- 채용명
	CAREER           CHAR(1)        NOT NULL, -- 경력
	ACDMCR           CHAR(2)        NOT NULL, -- 학력
	WAGE_TYPE        CHAR(1)        NOT NULL, -- 임금형태
	SALARY           BIGINT         NOT NULL, -- 급여
	WORK_TYPE        CHAR(1)        NOT NULL, -- 근무형태
	EMPLYM_TYPE      VARCHAR2(2)    NOT NULL, -- 고용형태
	RCRIT_JSSFC      VARCHAR2(6)    NOT NULL, -- 모집직종
	RCRIT_PSN        INTEGER        NOT NULL, -- 모집인원
	REG_DT           CHAR(8)        NOT NULL, -- 등록일자
	CLOS_DT          CHAR(8)        NOT NULL, -- 마감일자
	JO_AUTH_NO       VARCHAR2(20)   NULL,     -- 구인인증번호
	PBLANC_NO        VARCHAR2(20)   NULL,     -- 공고번호
	JO_DATA_DIV      CHAR(1)        NOT NULL, -- 구인자료구분
	JO_DATA_KEY      VARCHAR2(20)   NOT NULL, -- 구인자료키
	WORK_REGION      VARCHAR2(200)  NOT NULL, -- 근무지역
	WORK_ADDR        VARCHAR2(200)  NOT NULL, -- 근무주소
	SIDO_CD          CHAR(2)        NOT NULL, -- 시도코드
	SGG_CD           CHAR(3)        NOT NULL, -- 시군구코드
	EMDONG_CD        CHAR(2)        NOT NULL, -- 읍면동코드
	TOT_OA_CD        VARCHAR2(15)   NULL,     -- 집계구코드
	X                VARCHAR2(20)   NULL,     -- X좌표
	Y                VARCHAR2(20)   NULL,     -- Y좌표
	PT               st_point       NULL,     -- 포인트
	CREATE_DT        CHAR(8)        NOT NULL  -- 생성일자
);

-- 오늘의구인현황
ALTER TABLE SRV_DT_JOB_SM
	ADD
		CONSTRAINT PK_SRV_DT_JOB_SM -- 오늘의구인현황 기본키
		PRIMARY KEY (
			JO_NO -- 구인번호
		);

-- 오늘의구인현황
COMMENT ON TABLE SRV_DT_JOB_SM IS '오늘의구인현황';

-- 구인번호
COMMENT ON COLUMN SRV_DT_JOB_SM.JO_NO IS '구인번호';

-- 회사명
COMMENT ON COLUMN SRV_DT_JOB_SM.CORP_NM IS '회사명';

-- 사업자번호
COMMENT ON COLUMN SRV_DT_JOB_SM.BSNM_NO IS '사업자번호';

-- 산업분류
COMMENT ON COLUMN SRV_DT_JOB_SM.INDUST_CLASS IS '산업분류';

-- 기업형태
COMMENT ON COLUMN SRV_DT_JOB_SM.ENTRPRS_TYPE IS '기업형태';

-- 회사규모
COMMENT ON COLUMN SRV_DT_JOB_SM.CORP_SZ IS '회사규모';

-- 근로자수
COMMENT ON COLUMN SRV_DT_JOB_SM.LABRR_CNT IS '근로자수';

-- 회사주소
COMMENT ON COLUMN SRV_DT_JOB_SM.CORP_ADDR IS '회사주소';

-- 자본금
COMMENT ON COLUMN SRV_DT_JOB_SM.CAP IS '자본금';

-- 대표자명
COMMENT ON COLUMN SRV_DT_JOB_SM.MAIN_NM IS '대표자명';

-- 연매출액
COMMENT ON COLUMN SRV_DT_JOB_SM.YEAR_SALES IS '연매출액';

-- 주요사업내용
COMMENT ON COLUMN SRV_DT_JOB_SM.MAIN_BIZ_CONTENT IS '주요사업내용';

-- 회사홈페이지
COMMENT ON COLUMN SRV_DT_JOB_SM.CORP_HPAGE IS '회사홈페이지';

-- 채용명
COMMENT ON COLUMN SRV_DT_JOB_SM.RECRU_NM IS '채용명';

-- 경력
COMMENT ON COLUMN SRV_DT_JOB_SM.CAREER IS '경력';

-- 학력
COMMENT ON COLUMN SRV_DT_JOB_SM.ACDMCR IS '학력';

-- 임금형태
COMMENT ON COLUMN SRV_DT_JOB_SM.WAGE_TYPE IS '임금형태';

-- 급여
COMMENT ON COLUMN SRV_DT_JOB_SM.SALARY IS '급여';

-- 근무형태
COMMENT ON COLUMN SRV_DT_JOB_SM.WORK_TYPE IS '근무형태';

-- 고용형태
COMMENT ON COLUMN SRV_DT_JOB_SM.EMPLYM_TYPE IS '고용형태';

-- 모집직종
COMMENT ON COLUMN SRV_DT_JOB_SM.RCRIT_JSSFC IS '모집직종';

-- 모집인원
COMMENT ON COLUMN SRV_DT_JOB_SM.RCRIT_PSN IS '모집인원';

-- 등록일자
COMMENT ON COLUMN SRV_DT_JOB_SM.REG_DT IS '등록일자';

-- 마감일자
COMMENT ON COLUMN SRV_DT_JOB_SM.CLOS_DT IS '마감일자';

-- 구인자료구분
COMMENT ON COLUMN SRV_DT_JOB_SM.JO_DATA_DIV IS '구인자료구분';

-- 구인자료키
COMMENT ON COLUMN SRV_DT_JOB_SM.JO_DATA_KEY IS '구인자료키';

-- 근무지역
COMMENT ON COLUMN SRV_DT_JOB_SM.WORK_REGION IS '근무지역';

-- 근무주소
COMMENT ON COLUMN SRV_DT_JOB_SM.WORK_ADDR IS '근무주소';

-- 시도코드
COMMENT ON COLUMN SRV_DT_JOB_SM.SIDO_CD IS '시도코드';

-- 시군구코드
COMMENT ON COLUMN SRV_DT_JOB_SM.SGG_CD IS '시군구코드';

-- 읍면동코드
COMMENT ON COLUMN SRV_DT_JOB_SM.EMDONG_CD IS '읍면동코드';

-- TOT_OA_CD
COMMENT ON COLUMN SRV_DT_JOB_SM.TOT_OA_CD IS 'TOT_OA_CD';

-- TOT_X
COMMENT ON COLUMN SRV_DT_JOB_SM.X IS 'X좌표';

-- TOT_Y
COMMENT ON COLUMN SRV_DT_JOB_SM.Y IS 'Y좌표';

-- 포인트
COMMENT ON COLUMN SRV_DT_JOB_SM.PT IS '포인트';

-- 생성일자
COMMENT ON COLUMN SRV_DT_JOB_SM.CREATE_DT IS '생성일자';

-- 오늘의구인현황 기본키
COMMENT ON INDEX PK_SRV_DT_JOB_SM IS '오늘의구인현황 기본키';

-- 오늘의구인현황 기본키
--COMMENT ON CONSTRAINT SRV_DT_JOB_SM.PK_SRV_DT_JOB_SM IS '오늘의구인현황 기본키';

-- 희망지역_구인_현황
CREATE TABLE SRV_DT_JOB_HOPE_AREA_SM (
	REG_DT        CHAR(8) NOT NULL, -- 등록일자
	SIDO_CD       CHAR(2) NOT NULL, -- 시도코드
	SGG_CD        CHAR(3) NOT NULL, -- 시군구코드
	EMDONG_CD     CHAR(2) NOT NULL, -- 읍면동코드
	JO_CNT        INTEGER NOT NULL, -- 구인건수
	CORP_CNT      INTEGER NOT NULL, -- 업체수
	RCRIT_PSN_CNT INTEGER NOT NULL  -- 모집인원수
);

ALTER TABLE SRV_DT_JOB_HOPE_AREA_SM
	ADD
		CONSTRAINT PK_SRV_DT_JOB_HOPE_AREA_SM -- 희망지역_구인_현황 기본키
		PRIMARY KEY (
			REG_DT,    -- 등록일자
			SIDO_CD,   -- 시도코드
			SGG_CD,    -- 시군구코드
			EMDONG_CD
		);

-- 희망지역_구인_현황
COMMENT ON TABLE SRV_DT_JOB_HOPE_AREA_SM IS '희망지역_구인_현황';

-- 등록일자
COMMENT ON COLUMN SRV_DT_JOB_HOPE_AREA_SM.REG_DT IS '등록일자';

-- 근무시도
COMMENT ON COLUMN SRV_DT_JOB_HOPE_AREA_SM.sido_cd IS '근무시도';

-- 근무시군구
COMMENT ON COLUMN SRV_DT_JOB_HOPE_AREA_SM.sgg_cd IS '근무시군구';

-- 근무읍면동
COMMENT ON COLUMN SRV_DT_JOB_HOPE_AREA_SM.emdong_cd IS '근무읍면동';

-- 구인건수
COMMENT ON COLUMN SRV_DT_JOB_HOPE_AREA_SM.JO_CNT IS '구인건수';

-- 업체수
COMMENT ON COLUMN SRV_DT_JOB_HOPE_AREA_SM.CORP_CNT IS '업체수';

-- 모집인원수
COMMENT ON COLUMN SRV_DT_JOB_HOPE_AREA_SM.RCRIT_PSN_CNT IS '모집인원수';

-- 기업형태_구인_현황
CREATE TABLE SRV_DT_JOB_ENTRPRS_TYPE_SM (
	REG_DT        CHAR(8) NOT NULL, -- 등록일자
	SIDO_CD       CHAR(2) NOT NULL, -- 시도코드
	SGG_CD        CHAR(3) NOT NULL, -- 시군구코드
	EMDONG_CD     CHAR(2) NOT NULL, -- 읍면동코드
	ENTRPRS_TYPE  CHAR(2) NOT NULL, -- 기업형태
	JO_CNT        INTEGER NOT NULL, -- 구인건수
	CORP_CNT      INTEGER NOT NULL, -- 업체수
	RCRIT_PSN_CNT INTEGER NOT NULL  -- 모집인원수
);

ALTER TABLE SRV_DT_JOB_ENTRPRS_TYPE_SM
	ADD
		CONSTRAINT PK_SRV_DT_JOB_ENTRPRS_TYPE_SM -- 기업형태_구인_현황 기본키
		PRIMARY KEY (
			REG_DT,       -- 등록일자
			SIDO_CD,      -- 시도코드
			SGG_CD,       -- 시군구코드
			EMDONG_CD,    -- 읍면동코드
			ENTRPRS_TYPE  -- 기업형태
		);

-- 기업형태_구인_현황
COMMENT ON TABLE SRV_DT_JOB_ENTRPRS_TYPE_SM IS '기업형태_구인_현황';

-- 등록일자
COMMENT ON COLUMN SRV_DT_JOB_ENTRPRS_TYPE_SM.REG_DT IS '등록일자';

-- 근무시도
COMMENT ON COLUMN SRV_DT_JOB_ENTRPRS_TYPE_SM.sido_cd IS '근무시도';

-- 근무시군구
COMMENT ON COLUMN SRV_DT_JOB_ENTRPRS_TYPE_SM.sgg_cd IS '근무시군구';

-- 근무읍면동
COMMENT ON COLUMN SRV_DT_JOB_ENTRPRS_TYPE_SM.emdong_cd IS '근무읍면동';

-- 기업형태
COMMENT ON COLUMN SRV_DT_JOB_ENTRPRS_TYPE_SM.ENTRPRS_TYPE IS '기업형태';

-- 구인건수
COMMENT ON COLUMN SRV_DT_JOB_ENTRPRS_TYPE_SM.JO_CNT IS '구인건수';

-- 업체수
COMMENT ON COLUMN SRV_DT_JOB_ENTRPRS_TYPE_SM.CORP_CNT IS '업체수';

-- 모집인원수
COMMENT ON COLUMN SRV_DT_JOB_ENTRPRS_TYPE_SM.RCRIT_PSN_CNT IS '모집인원수';

-- 회사규모_구인_현황
CREATE TABLE SRV_DT_JOB_CORP_SZ_SM (
	REG_DT        CHAR(8)     NOT NULL, -- 등록일자
	SIDO_CD       CHAR(2)     NOT NULL, -- 시도코드
	SGG_CD        CHAR(3)     NOT NULL, -- 시군구코드
	EMDONG_CD     CHAR(2)     NOT NULL, -- 읍면동코드
	CORP_SZ       VARCHAR2(4) NOT NULL, -- 회사규모
	JO_CNT        INTEGER     NOT NULL, -- 구인건수
	CORP_CNT      INTEGER     NOT NULL, -- 업체수
	RCRIT_PSN_CNT INTEGER     NOT NULL  -- 모집인원수
);

ALTER TABLE SRV_DT_JOB_CORP_SZ_SM
	ADD
		CONSTRAINT PK_SRV_DT_JOB_CORP_SZ_SM -- 회사규모_구인_현황 기본키
		PRIMARY KEY (
			REG_DT,    -- 등록일자
			SIDO_CD,   -- 시도코드
			SGG_CD,    -- 시군구코드
			EMDONG_CD, -- 읍면동코드
			CORP_SZ    -- 회사규모
		);

-- 회사규모_구인_현황
COMMENT ON TABLE SRV_DT_JOB_CORP_SZ_SM IS '회사규모_구인_현황';

-- 등록일자
COMMENT ON COLUMN SRV_DT_JOB_CORP_SZ_SM.REG_DT IS '등록일자';

-- 근무시도
COMMENT ON COLUMN SRV_DT_JOB_CORP_SZ_SM.sido_cd IS '근무시도';

-- 근무시군구
COMMENT ON COLUMN SRV_DT_JOB_CORP_SZ_SM.sgg_cd IS '근무시군구';

-- 근무읍면동
COMMENT ON COLUMN SRV_DT_JOB_CORP_SZ_SM.emdong_cd IS '근무읍면동';

-- 회사규모
COMMENT ON COLUMN SRV_DT_JOB_CORP_SZ_SM.CORP_SZ IS '회사규모';

-- 구인건수
COMMENT ON COLUMN SRV_DT_JOB_CORP_SZ_SM.JO_CNT IS '구인건수';

-- 업체수
COMMENT ON COLUMN SRV_DT_JOB_CORP_SZ_SM.CORP_CNT IS '업체수';

-- 모집인원수
COMMENT ON COLUMN SRV_DT_JOB_CORP_SZ_SM.RCRIT_PSN_CNT IS '모집인원수';

-- 산업분류_구인_현황
CREATE TABLE SRV_DT_JOB_INDUST_CLASS_SM (
	REG_DT        CHAR(8)     NOT NULL, -- 등록일자
	SIDO_CD       CHAR(2)     NOT NULL, -- 시도코드
	SGG_CD        CHAR(3)     NOT NULL, -- 시군구코드
	EMDONG_CD     CHAR(2)     NOT NULL, -- 읍면동코드
	INDUST_CLASS  VARCHAR2(6) NOT NULL, -- 산업분류
	JO_CNT        INTEGER     NOT NULL, -- 구인건수
	CORP_CNT      INTEGER     NOT NULL, -- 업체수
	RCRIT_PSN_CNT INTEGER     NOT NULL  -- 모집인원수
);

ALTER TABLE SRV_DT_JOB_INDUST_CLASS_SM
	ADD
		CONSTRAINT PK_SRV_DT_JOB_INDUST_CLASS_SM -- 산업분류_구인_현황 기본키
		PRIMARY KEY (
			REG_DT,       -- 등록일자
			SIDO_CD,      -- 시도코드
			SGG_CD,       -- 시군구코드
			EMDONG_CD,    -- 읍면동코드
			INDUST_CLASS  -- 산업분류
		);

-- 산업분류_구인_현황
COMMENT ON TABLE SRV_DT_JOB_INDUST_CLASS_SM IS '산업분류_구인_현황';

-- 등록일자
COMMENT ON COLUMN SRV_DT_JOB_INDUST_CLASS_SM.REG_DT IS '등록일자';

-- 근무시도
COMMENT ON COLUMN SRV_DT_JOB_INDUST_CLASS_SM.sido_cd IS '근무시도';

-- 근무시군구
COMMENT ON COLUMN SRV_DT_JOB_INDUST_CLASS_SM.sgg_cd IS '근무시군구';

-- 근무읍면동
COMMENT ON COLUMN SRV_DT_JOB_INDUST_CLASS_SM.emdong_cd IS '근무읍면동';

-- 산업분류
COMMENT ON COLUMN SRV_DT_JOB_INDUST_CLASS_SM.INDUST_CLASS IS '산업분류';

-- 구인건수
COMMENT ON COLUMN SRV_DT_JOB_INDUST_CLASS_SM.JO_CNT IS '구인건수';

-- 업체수
COMMENT ON COLUMN SRV_DT_JOB_INDUST_CLASS_SM.CORP_CNT IS '업체수';

-- 모집인원수
COMMENT ON COLUMN SRV_DT_JOB_INDUST_CLASS_SM.RCRIT_PSN_CNT IS '모집인원수';

-- 직종분류_구인_현황
CREATE TABLE SRV_DT_JOB_JSSFC_SM (
	REG_DT        CHAR(8)     NOT NULL, -- 등록일자
	SIDO_CD       CHAR(2)     NOT NULL, -- 시도코드
	SGG_CD        CHAR(3)     NOT NULL, -- 시군구코드
	EMDONG_CD     CHAR(2)     NOT NULL, -- 읍면동코드
	JSSFC_CLASS   VARCHAR2(6) NOT NULL, -- 직종분류
	JO_CNT        INTEGER     NOT NULL, -- 구인건수
	CORP_CNT      INTEGER     NOT NULL, -- 업체수
	RCRIT_PSN_CNT INTEGER     NOT NULL  -- 모집인원수
);

ALTER TABLE SRV_DT_JOB_JSSFC_SM
	ADD
		CONSTRAINT PK_SRV_DT_JOB_JSSFC_SM -- 직종분류_구인_현황 기본키
		PRIMARY KEY (
			REG_DT,      -- 등록일자
			SIDO_CD,     -- 시도코드
			SGG_CD,      -- 시군구코드
			EMDONG_CD,   -- 읍면동코드
			JSSFC_CLASS  -- 직종분류
		);

-- 직종분류_구인_현황
COMMENT ON TABLE SRV_DT_JOB_JSSFC_SM IS '직종분류_구인_현황';

-- 등록일자
COMMENT ON COLUMN SRV_DT_JOB_JSSFC_SM.REG_DT IS '등록일자';

-- 근무시도
COMMENT ON COLUMN SRV_DT_JOB_JSSFC_SM.sido_cd IS '근무시도';

-- 근무시군구
COMMENT ON COLUMN SRV_DT_JOB_JSSFC_SM.sgg_cd IS '근무시군구';

-- 근무읍면동
COMMENT ON COLUMN SRV_DT_JOB_JSSFC_SM.emdong_cd IS '근무읍면동';

-- 직종분류
COMMENT ON COLUMN SRV_DT_JOB_JSSFC_SM.JSSFC_CLASS IS '직종분류';

-- 구인건수
COMMENT ON COLUMN SRV_DT_JOB_JSSFC_SM.JO_CNT IS '구인건수';

-- 업체수
COMMENT ON COLUMN SRV_DT_JOB_JSSFC_SM.CORP_CNT IS '업체수';

-- 모집인원수
COMMENT ON COLUMN SRV_DT_JOB_JSSFC_SM.RCRIT_PSN_CNT IS '모집인원수';

-- 급여수준_구인_현황
CREATE TABLE SRV_DT_JOB_SALARY_SM (
	REG_DT        CHAR(8) NOT NULL, -- 등록일자
	SIDO_CD       CHAR(2) NOT NULL, -- 시도코드
	SGG_CD        CHAR(3) NOT NULL, -- 시군구코드
	EMDONG_CD     CHAR(2) NOT NULL, -- 읍면동코드
	WAGE_TYPE     CHAR(1) NOT NULL, -- 임금형태
	SALARY        BIGINT  NOT NULL, -- 급여
	JO_CNT        INTEGER NOT NULL, -- 구인건수
	CORP_CNT      INTEGER NOT NULL, -- 업체수
	RCRIT_PSN_CNT INTEGER NOT NULL  -- 모집인원수
);

ALTER TABLE SRV_DT_JOB_SALARY_SM
	ADD
		CONSTRAINT PK_SRV_DT_JOB_SALARY_SM -- 급여수준_구인_현황 기본키
		PRIMARY KEY (
			REG_DT,    -- 등록일자
			SIDO_CD,   -- 시도코드
			SGG_CD,    -- 시군구코드
			EMDONG_CD, -- 읍면동코드
			WAGE_TYPE, -- 임금형태
			SALARY     -- 급여
		);

-- 급여수준_구인_현황
COMMENT ON TABLE SRV_DT_JOB_SALARY_SM IS '급여수준_구인_현황';

-- 등록일자
COMMENT ON COLUMN SRV_DT_JOB_SALARY_SM.REG_DT IS '등록일자';

-- 근무시도
COMMENT ON COLUMN SRV_DT_JOB_SALARY_SM.sido_cd IS '근무시도';

-- 근무시군구
COMMENT ON COLUMN SRV_DT_JOB_SALARY_SM.sgg_cd IS '근무시군구';

-- 근무읍면동
COMMENT ON COLUMN SRV_DT_JOB_SALARY_SM.emdong_cd IS '근무읍면동';

-- 임금형태
COMMENT ON COLUMN SRV_DT_JOB_SALARY_SM.WAGE_TYPE IS '임금형태';

-- 급여
COMMENT ON COLUMN SRV_DT_JOB_SALARY_SM.SALARY IS '급여';

-- 구인건수
COMMENT ON COLUMN SRV_DT_JOB_SALARY_SM.JO_CNT IS '구인건수';

-- 업체수
COMMENT ON COLUMN SRV_DT_JOB_SALARY_SM.CORP_CNT IS '업체수';

-- 모집인원수
COMMENT ON COLUMN SRV_DT_JOB_SALARY_SM.RCRIT_PSN_CNT IS '모집인원수';

-- 고용형태_구인_현황
CREATE TABLE SRV_DT_JOB_EMPLYM_TYPE_SM (
	REG_DT        CHAR(8)     NOT NULL, -- 등록일자
	SIDO_CD       CHAR(2)     NOT NULL, -- 시도코드
	SGG_CD        CHAR(3)     NOT NULL, -- 시군구코드
	EMDONG_CD     CHAR(2)     NOT NULL, -- 읍면동코드
	EMPLYM_TYPE   VARCHAR2(2) NOT NULL, -- 고용형태
	JO_CNT        INTEGER     NOT NULL, -- 구인건수
	CORP_CNT      INTEGER     NOT NULL, -- 업체수
	RCRIT_PSN_CNT INTEGER     NOT NULL  -- 모집인원수
);

ALTER TABLE SRV_DT_JOB_EMPLYM_TYPE_SM
	ADD
		CONSTRAINT PK_SRV_DT_JOB_EMPLYM_TYPE_SM -- 고용형태_구인_현황 기본키
		PRIMARY KEY (
			REG_DT,      -- 등록일자
			SIDO_CD,     -- 시도코드
			SGG_CD,      -- 시군구코드
			EMDONG_CD,   -- 읍면동코드
			EMPLYM_TYPE  -- 고용형태
		);

-- 고용형태_구인_현황
COMMENT ON TABLE SRV_DT_JOB_EMPLYM_TYPE_SM IS '고용형태_구인_현황';

-- 등록일자
COMMENT ON COLUMN SRV_DT_JOB_EMPLYM_TYPE_SM.REG_DT IS '등록일자';

-- 근무시도
COMMENT ON COLUMN SRV_DT_JOB_EMPLYM_TYPE_SM.sido_cd IS '근무시도';

-- 근무시군구
COMMENT ON COLUMN SRV_DT_JOB_EMPLYM_TYPE_SM.sgg_cd IS '근무시군구';

-- 근무읍면동
COMMENT ON COLUMN SRV_DT_JOB_EMPLYM_TYPE_SM.emdong_cd IS '근무읍면동';

-- 고용형태
COMMENT ON COLUMN SRV_DT_JOB_EMPLYM_TYPE_SM.EMPLYM_TYPE IS '고용형태';

-- 구인건수
COMMENT ON COLUMN SRV_DT_JOB_EMPLYM_TYPE_SM.JO_CNT IS '구인건수';

-- 업체수
COMMENT ON COLUMN SRV_DT_JOB_EMPLYM_TYPE_SM.CORP_CNT IS '업체수';

-- 모집인원수
COMMENT ON COLUMN SRV_DT_JOB_EMPLYM_TYPE_SM.RCRIT_PSN_CNT IS '모집인원수';

-- 근무형태_구인_현황
CREATE TABLE SRV_DT_JOB_WORK_TYPE_SM (
	REG_DT        CHAR(8) NOT NULL, -- 등록일자
	SIDO_CD       CHAR(2) NOT NULL, -- 시도코드
	SGG_CD        CHAR(3) NOT NULL, -- 시군구코드
	EMDONG_CD     CHAR(2) NOT NULL, -- 읍면동코드
	WORK_TYPE     CHAR(1) NOT NULL, -- 근무형태
	JO_CNT        INTEGER NOT NULL, -- 구인건수
	CORP_CNT      INTEGER NOT NULL, -- 업체수
	RCRIT_PSN_CNT INTEGER NOT NULL  -- 모집인원수
);

ALTER TABLE SRV_DT_JOB_WORK_TYPE_SM
	ADD
		CONSTRAINT PK_SRV_DT_JOB_WORK_TYPE_SM -- 근무형태_구인_현황 기본키
		PRIMARY KEY (
			REG_DT,    -- 등록일자
			SIDO_CD,   -- 시도코드
			SGG_CD,    -- 시군구코드
			EMDONG_CD, -- 읍면동코드
			WORK_TYPE  -- 근무형태
		);

-- 근무형태_구인_현황
COMMENT ON TABLE SRV_DT_JOB_WORK_TYPE_SM IS '근무형태_구인_현황';

-- 등록일자
COMMENT ON COLUMN SRV_DT_JOB_WORK_TYPE_SM.REG_DT IS '등록일자';

-- 근무시도
COMMENT ON COLUMN SRV_DT_JOB_WORK_TYPE_SM.sido_cd IS '근무시도';

-- 근무시군구
COMMENT ON COLUMN SRV_DT_JOB_WORK_TYPE_SM.sgg_cd IS '근무시군구';

-- 근무읍면동
COMMENT ON COLUMN SRV_DT_JOB_WORK_TYPE_SM.emdong_cd IS '근무읍면동';

-- 근무형태
COMMENT ON COLUMN SRV_DT_JOB_WORK_TYPE_SM.WORK_TYPE IS '근무형태';

-- 구인건수
COMMENT ON COLUMN SRV_DT_JOB_WORK_TYPE_SM.JO_CNT IS '구인건수';

-- 업체수
COMMENT ON COLUMN SRV_DT_JOB_WORK_TYPE_SM.CORP_CNT IS '업체수';

-- 모집인원수
COMMENT ON COLUMN SRV_DT_JOB_WORK_TYPE_SM.RCRIT_PSN_CNT IS '모집인원수';

-- 학력_구인_현황
CREATE TABLE SRV_DT_JOB_ACDMCR_SM (
	REG_DT        CHAR(8) NOT NULL, -- 등록일자
	SIDO_CD       CHAR(2) NOT NULL, -- 시도코드
	SGG_CD        CHAR(3) NOT NULL, -- 시군구코드
	EMDONG_CD     CHAR(2) NOT NULL, -- 읍면동코드
	ACDMCR        CHAR(2) NOT NULL, -- 학력
	JO_CNT        INTEGER NOT NULL, -- 구인건수
	CORP_CNT      INTEGER NOT NULL, -- 업체수
	RCRIT_PSN_CNT INTEGER NOT NULL  -- 모집인원수
);

ALTER TABLE SRV_DT_JOB_ACDMCR_SM
	ADD
		CONSTRAINT PK_SRV_DT_JOB_ACDMCR_SM -- 학력_구인_현황 기본키
		PRIMARY KEY (
			REG_DT,    -- 등록일자
			SIDO_CD,   -- 시도코드
			SGG_CD,    -- 시군구코드
			EMDONG_CD, -- 읍면동코드
			ACDMCR     -- 학력
		);

-- 학력_구인_현황
COMMENT ON TABLE SRV_DT_JOB_ACDMCR_SM IS '학력_구인_현황';

-- 등록일자
COMMENT ON COLUMN SRV_DT_JOB_ACDMCR_SM.REG_DT IS '등록일자';

-- 근무시도
COMMENT ON COLUMN SRV_DT_JOB_ACDMCR_SM.sido_cd IS '근무시도';

-- 근무시군구
COMMENT ON COLUMN SRV_DT_JOB_ACDMCR_SM.sgg_cd IS '근무시군구';

-- 근무읍면동
COMMENT ON COLUMN SRV_DT_JOB_ACDMCR_SM.emdong_cd IS '근무읍면동';

-- 학력
COMMENT ON COLUMN SRV_DT_JOB_ACDMCR_SM.ACDMCR IS '학력';

-- 구인건수
COMMENT ON COLUMN SRV_DT_JOB_ACDMCR_SM.JO_CNT IS '구인건수';

-- 업체수
COMMENT ON COLUMN SRV_DT_JOB_ACDMCR_SM.CORP_CNT IS '업체수';

-- 모집인원수
COMMENT ON COLUMN SRV_DT_JOB_ACDMCR_SM.RCRIT_PSN_CNT IS '모집인원수';

-- 경력_구인_현황
CREATE TABLE SRV_DT_JOB_CAREER_SM (
	REG_DT        CHAR(8) NOT NULL, -- 등록일자
	SIDO_CD       CHAR(2) NOT NULL, -- 시도코드
	SGG_CD        CHAR(3) NOT NULL, -- 시군구코드
	EMDONG_CD     CHAR(2) NOT NULL, -- 읍면동코드
	CAREER        CHAR(1) NOT NULL, -- 경력
	JO_CNT        INTEGER NOT NULL, -- 구인건수
	CORP_CNT      INTEGER NOT NULL, -- 업체수
	RCRIT_PSN_CNT INTEGER NOT NULL  -- 모집인원수
);

ALTER TABLE SRV_DT_JOB_CAREER_SM
	ADD
		CONSTRAINT PK_SRV_DT_JOB_CAREER_SM -- 경력_구인_현황 기본키
		PRIMARY KEY (
			REG_DT,    -- 등록일자
			SIDO_CD,   -- 시도코드
			SGG_CD,    -- 시군구코드
			EMDONG_CD, -- 읍면동코드
			CAREER     -- 경력
		);

-- 경력_구인_현황
COMMENT ON TABLE SRV_DT_JOB_CAREER_SM IS '경력_구인_현황';

-- 등록일자
COMMENT ON COLUMN SRV_DT_JOB_CAREER_SM.REG_DT IS '등록일자';

-- 근무시도
COMMENT ON COLUMN SRV_DT_JOB_CAREER_SM.sido_cd IS '근무시도';

-- 근무시군구
COMMENT ON COLUMN SRV_DT_JOB_CAREER_SM.sgg_cd IS '근무시군구';

-- 근무읍면동
COMMENT ON COLUMN SRV_DT_JOB_CAREER_SM.emdong_cd IS '근무읍면동';

-- 경력
COMMENT ON COLUMN SRV_DT_JOB_CAREER_SM.CAREER IS '경력';

-- 구인건수
COMMENT ON COLUMN SRV_DT_JOB_CAREER_SM.JO_CNT IS '구인건수';

-- 업체수
COMMENT ON COLUMN SRV_DT_JOB_CAREER_SM.CORP_CNT IS '업체수';

-- 모집인원수
COMMENT ON COLUMN SRV_DT_JOB_CAREER_SM.RCRIT_PSN_CNT IS '모집인원수';

-- 구인현황판
CREATE TABLE SRV_DT_JOB_BOARD_SM (
	REG_DT             CHAR(8) NOT NULL, -- 등록일자
	SIDO_CD            CHAR(2) NOT NULL, -- 시도코드
	SGG_CD             CHAR(3) NOT NULL, -- 시군구코드
	ALL_JO_CNT         INTEGER NOT NULL, -- 전체구인수
	ALL_CORP_CNT       INTEGER NOT NULL, -- 전체업체수
	ALL_RCRIT_PSN_CNT  INTEGER NOT NULL, -- 전체모집인원수
	NEW_JO_CNT         INTEGER NOT NULL, -- 신규구인수
	NEW_CORP_CNT       INTEGER NOT NULL, -- 신규업체수
	NEW_RCRIT_PSN_CNT  INTEGER NOT NULL, -- 신규모집인원수
	CLOS_JO_CNT        INTEGER NOT NULL, -- 마감구인수
	CLOS_CORP_CNT      INTEGER NOT NULL, -- 마감업체수
	CLOS_RCRIT_PSN_CNT INTEGER NOT NULL  -- 마감모집인원수
);

ALTER TABLE SRV_DT_JOB_BOARD_SM
	ADD
		CONSTRAINT PK_SRV_DT_JOB_BOARD_SM -- 구인현황판 기본키
		PRIMARY KEY (
			REG_DT,  -- 등록일자
			SIDO_CD, -- 시도코드
			SGG_CD   -- 시군구코드
		);

-- 구인현황판
COMMENT ON TABLE SRV_DT_JOB_BOARD_SM IS '구인현황판';

-- 등록일자
COMMENT ON COLUMN SRV_DT_JOB_BOARD_SM.REG_DT IS '등록일자';

-- 근무시도
COMMENT ON COLUMN SRV_DT_JOB_BOARD_SM.sido_cd IS '근무시도';

-- 근무시군구
COMMENT ON COLUMN SRV_DT_JOB_BOARD_SM.sgg_cd IS '근무시군구';

-- 전체구인수
COMMENT ON COLUMN SRV_DT_JOB_BOARD_SM.ALL_JO_CNT IS '전체구인수';

-- 전체업체수
COMMENT ON COLUMN SRV_DT_JOB_BOARD_SM.ALL_CORP_CNT IS '전체업체수';

-- 전체모집인원수
COMMENT ON COLUMN SRV_DT_JOB_BOARD_SM.ALL_RCRIT_PSN_CNT IS '전체모집인원수';

-- 신규구인수
COMMENT ON COLUMN SRV_DT_JOB_BOARD_SM.NEW_JO_CNT IS '신규구인수';

-- 신규업체수
COMMENT ON COLUMN SRV_DT_JOB_BOARD_SM.NEW_CORP_CNT IS '신규업체수';

-- 신규모집인원수
COMMENT ON COLUMN SRV_DT_JOB_BOARD_SM.NEW_RCRIT_PSN_CNT IS '신규모집인원수';

-- 마감구인수
COMMENT ON COLUMN SRV_DT_JOB_BOARD_SM.CLOS_JO_CNT IS '마감구인수';

-- 마감업체수
COMMENT ON COLUMN SRV_DT_JOB_BOARD_SM.CLOS_CORP_CNT IS '마감업체수';

-- 마감모집인원수
COMMENT ON COLUMN SRV_DT_JOB_BOARD_SM.CLOS_RCRIT_PSN_CNT IS '마감모집인원수';


-- 일자리통계자료수집
CREATE TABLE SRV_DT_KOSIS_DATA (
	LINK_ID_SEQ   CHAR(11)      NOT NULL, -- 식별자
	ITM_ID        VARCHAR2(50)  NOT NULL, -- 아이템식별자
	ORG_ID        VARCHAR2(5)   NOT NULL, -- 조직식별자
	TBL_ID        VARCHAR2(50)  NOT NULL, -- 테이블식별자
	DT            VARCHAR2(30)  NOT NULL, -- 값데이터
	LINK_ID       VARCHAR2(10)  NOT NULL, -- 연계ID
	PRD_DE        VARCHAR2(20)  NOT NULL, -- 수록시점
	C1            VARCHAR2(50)  NOT NULL, -- 분류1
	CREATE_DT     CHAR(8)       NOT NULL, -- 생성일자
	PRD_SE        VARCHAR2(20)  NULL,     -- 수록주기
	ITM_NM        VARCHAR2(200) NULL,     -- 아이템명칭
	ITM_NM_ENG    VARCHAR2(300) NULL,     -- 아이템명칭영어
	TBL_NM        VARCHAR2(300) NULL,     -- 테이블명칭
	UNIT_NM       VARCHAR2(50)  NULL,     -- 단위명
	UNIT_NM_ENG   VARCHAR2(200) NULL,     -- 단위명영문
	C1_NM         VARCHAR2(200) NULL,     -- 분류1명
	C1_NM_ENG     VARCHAR2(300) NULL,     -- 분류1명영문
	C1_OBJ_NM     VARCHAR2(200) NULL,     -- 분류값1명
	C1_OBJ_NM_ENG VARCHAR2(300) NULL,     -- 분류값1명영문
	C2            VARCHAR2(50)  NULL,     -- 분류2
	C2_NM         VARCHAR2(200) NULL,     -- 분류2명
	C2_NM_ENG     VARCHAR2(300) NULL,     -- 분류2명영문
	C2_OBJ_NM     VARCHAR2(200) NULL,     -- 분류값2명
	C2_OBJ_NM_ENG VARCHAR2(300) NULL,     -- 분류값2명영문
	C3            VARCHAR2(50)  NULL,     -- 분류3
	C3_NM         VARCHAR2(200) NULL,     -- 분류3명
	C3_NM_ENG     VARCHAR2(300) NULL,     -- 분류3명영문
	C3_OBJ_NM     VARCHAR2(200) NULL,     -- 분류값3명
	C3_OBJ_NM_ENG VARCHAR2(300) NULL      -- 분류값3명영문
);

-- 일자리통계자료수집
ALTER TABLE SRV_DT_KOSIS_DATA
	ADD
		CONSTRAINT PK_SRV_DT_KOSIS_DATA -- 일자리통계자료수집 기본키
		PRIMARY KEY (
			LINK_ID_SEQ
		);
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.LINK_ID_SEQ IS '링크아이디식별자';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.ITM_ID IS '아이템식별자';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.ITM_NM IS '아이템명칭';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.ITM_NM_ENG IS '아이템명칭영어';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.ORG_ID IS '조직식별자';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.PRD_DE IS '수록시점';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.PRD_SE IS '수록주기';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.TBL_ID IS '테이블식별자';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.TBL_NM IS '테이블명칭';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.DT IS '일자';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.UNIT_NM IS '단위명';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.UNIT_NM_ENG IS '단위명영문';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C1 IS '분류1';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C1_NM IS '분류1명';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C1_NM_ENG IS '분류1명영문';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C1_OBJ_NM IS '분류값1명';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C1_OBJ_NM_ENG IS '분류값1명영문';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C2 IS '분류2';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C2_NM IS '분류2명';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C2_NM_ENG IS '분류2명영문';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C2_OBJ_NM IS '분류값2명';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C2_OBJ_NM_ENG IS '분류값2명영문';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C3 IS '분류3';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C3_NM IS '분류3명';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C3_NM_ENG IS '분류3명영문';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C3_OBJ_NM IS '분류값3명';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.C3_OBJ_NM_ENG IS '분류값3명영문';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.LINK_ID IS '연계ID';
COMMENT ON COLUMN SRV_DT_KOSIS_DATA.CREATE_DT IS '생성일자';

-- 일자리통계자료정보
CREATE TABLE SRV_DT_JOB_STAT_DATA_INFO (
	LINK_ID         VARCHAR2(10)   NOT NULL, -- 연계ID
	STAT_NM         VARCHAR2(200)  NULL,     -- 통계명
	STAT_DEFINITION VARCHAR2(1000) NULL,     -- 통계정의
	STAT_EXP        VARCHAR2(3000) NULL,     -- 통계설명
	COLCT_SOURCE    VARCHAR2(500)  NULL,     -- 수집출처
	UPDT_CYCLE      VARCHAR2(100)  NULL,     -- 갱신주기
	RECENT_UPDT_DE  VARCHAR2(50)   NULL,     -- 최근갱신일
	STAT_PATH       VARCHAR2(300)  NULL,     -- 통계경로
	REFRN_URL       VARCHAR2(500)  NULL,     -- 참조URL
	CREATE_DT       CHAR(8)        NULL      -- 생성일자
);

-- 일자리통계자료정보
ALTER TABLE SRV_DT_JOB_STAT_DATA_INFO
	ADD
		CONSTRAINT PK_SRV_DT_JOB_STAT_DATA_INFO -- 일자리통계자료정보 기본키
		PRIMARY KEY (
			LINK_ID -- 연계ID
		);

-- 일자리통계자료정보
COMMENT ON TABLE SRV_DT_JOB_STAT_DATA_INFO IS '일자리통계자료정보';

-- 연계ID
COMMENT ON COLUMN SRV_DT_JOB_STAT_DATA_INFO.LINK_ID IS '연계ID';

-- 통계명
COMMENT ON COLUMN SRV_DT_JOB_STAT_DATA_INFO.STAT_NM IS '통계명';

-- 통계정의
COMMENT ON COLUMN SRV_DT_JOB_STAT_DATA_INFO.STAT_DEFINITION IS '통계정의';

-- 통계설명
COMMENT ON COLUMN SRV_DT_JOB_STAT_DATA_INFO.STAT_EXP IS '통계설명';

-- 수집출처
COMMENT ON COLUMN SRV_DT_JOB_STAT_DATA_INFO.COLCT_SOURCE IS '수집출처';

-- 갱신주기
COMMENT ON COLUMN SRV_DT_JOB_STAT_DATA_INFO.UPDT_CYCLE IS '갱신주기';

-- 최근갱신일
COMMENT ON COLUMN SRV_DT_JOB_STAT_DATA_INFO.RECENT_UPDT_DE IS '최근갱신일';

-- 통계경로
COMMENT ON COLUMN SRV_DT_JOB_STAT_DATA_INFO.STAT_PATH IS '통계경로';

-- 참조URL
COMMENT ON COLUMN SRV_DT_JOB_STAT_DATA_INFO.REFRN_URL IS '참조URL';

-- 생성일자
COMMENT ON COLUMN SRV_DT_JOB_STAT_DATA_INFO.CREATE_DT IS '생성일자';

-- 일자리통계자료정보 기본키
COMMENT ON INDEX PK_SRV_DT_JOB_STAT_DATA_INFO IS '일자리통계자료정보 기본키';

-- 일자리통계자료정보 기본키
--COMMENT ON CONSTRAINT SRV_DT_JOB_STAT_DATA_INFO.PK_SRV_DT_JOB_STAT_DATA_INFO IS '일자리통계자료정보 기본키';

-- 일자리보기자료공통
CREATE TABLE SRV_DT_JOBSTAT_DATA (
	TYPE        VARCHAR2(10) NULL, -- 형태
	BASE_YEAR   VARCHAR2(4)   NULL, -- 기초년도
	MODE        VARCHAR2(2)   NULL, -- 모드
	SERIES_CD   VARCHAR2(10) NULL, -- 시리즈코드
	CATEGORY_CD VARCHAR2(10) NULL, -- 카테고리코드
	VAL         NUMBER(10,2) NULL  -- 값
);
-- 일자리보기자료공통
COMMENT ON TABLE SRV_DT_JOBSTAT_DATA IS '일자리보기자료공통';
-- 형태
COMMENT ON COLUMN SRV_DT_JOBSTAT_DATA.TYPE IS '형태';
-- 기초년도
COMMENT ON COLUMN SRV_DT_JOBSTAT_DATA.BASE_YEAR IS '기초년도';
-- 모드
COMMENT ON COLUMN SRV_DT_JOBSTAT_DATA.MODE IS '모드';
-- 시리즈코드
COMMENT ON COLUMN SRV_DT_JOBSTAT_DATA.SERIES_CD IS '시리즈코드';
-- 카테고리코드
COMMENT ON COLUMN SRV_DT_JOBSTAT_DATA.CATEGORY_CD IS '카테고리코드';
-- 값
COMMENT ON COLUMN SRV_DT_JOBSTAT_DATA.VAL IS '값';

-- 일자리보기맵핑공통
CREATE TABLE SRV_DT_COMM_CD_MAP (
	B_CLASS_CD_1 VARCHAR2(10) NULL, -- 대학급코드1
	B_CLASS_CD_2 VARCHAR2(10) NULL, -- 대학급코드2
	S_CLASS_CD_1 VARCHAR2(10) NULL, -- 소학급코드1
	S_CLASS_CD_2 VARCHAR2(10) NULL  -- 소학급코드2
);

-- 일자리보기맵핑공통
COMMENT ON TABLE SRV_DT_COMM_CD_MAP IS '일자리보기맵핑공통';
-- 대학급코드1
COMMENT ON COLUMN SRV_DT_COMM_CD_MAP.B_CLASS_CD_1 IS '대학급코드1';
-- 대학급코드2
COMMENT ON COLUMN SRV_DT_COMM_CD_MAP.B_CLASS_CD_2 IS '대학급코드2';
-- 소학급코드1
COMMENT ON COLUMN SRV_DT_COMM_CD_MAP.S_CLASS_CD_1 IS '소학급코드1';
-- 소학급코드2
COMMENT ON COLUMN SRV_DT_COMM_CD_MAP.S_CLASS_CD_2 IS '소학급코드2';