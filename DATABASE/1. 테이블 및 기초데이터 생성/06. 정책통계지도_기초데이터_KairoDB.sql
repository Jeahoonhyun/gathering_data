-- 즐겨찾기연령
CREATE TABLE SRV_DT_FAVORITE_AGE (
	AGE_ID       INTEGER NOT NULL,  -- 고유번호 (PK)
	AGE_FROM     INTEGER NOT NULL,  -- 연령범위 시작
	AGE_TO       INTEGER NOT NULL,  -- 연령범위 끝
	AGE_NM       VARCHAR(100) NOT NULL,  -- 연령범위 표시이름
	PRIVATE_YN   CHAR(1),  -- 비공개 여부
	DISP_RANK    INTEGER NOT NULL,  -- 연령범위 목록 표시 순서
	USE_YN       CHAR(1) NOT NULL,  -- 사용여부
	REG_TS       TIMESTAMP,   -- 등록일시
	REG_ID       VARCHAR(100),   -- 등록 아이디
	MOD_TS       TIMESTAMP,   -- 수정일시
	MOD_ID       VARCHAR(100)   -- 수정 아이디
);

-- 즐겨찾기연령
ALTER TABLE SRV_DT_FAVORITE_AGE
	ADD
		CONSTRAINT PK_SRV_DT_FAVORITE_AGE -- 즐겨찾기연령 기본키
		PRIMARY KEY (
			AGE_ID -- 고유번호
		);
