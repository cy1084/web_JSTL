-- 답변형게시판

-- ROOT 글입력
SELECT ANSWERBOARD_SEQ.NEXTVAL
	FROM DUAL;

SELECT NVL(MAX(SEQ),0) +1 
	FROM ANSWERBOARD a ;

INSERT INTO ANSWERBOARD
					(SEQ, ID, TITLE, 
					CONTENT, "REF", STEP, 
					"DEPTH", REGDATE, DELFLAG)
		VALUES(ANSWERBOARD_SEQ.NEXTVAL, 'A001', 'ROOT글 첫번째', 
				'첫번째 ROOT 글의 내용 작성', (SELECT NVL(MAX(REF),0)+1 FROM ANSWERBOARD a), 0, 
			   0, SYSDATE, 'N');
INSERT INTO ANSWERBOARD
					(SEQ, ID, TITLE, 
					CONTENT, "REF", STEP, 
					"DEPTH", REGDATE, DELFLAG)
		VALUES(ANSWERBOARD_SEQ.NEXTVAL, 'A002', 'ROOT글 두번째', 
				'두번째 ROOT 글의 내용 작성', (SELECT NVL(MAX(REF),0)+1 FROM ANSWERBOARD a), 0, 
			   0, SYSDATE, 'N');
INSERT INTO ANSWERBOARD
					(SEQ, ID, TITLE, 
					CONTENT, "REF", STEP, 
					"DEPTH", REGDATE, DELFLAG)
		VALUES(ANSWERBOARD_SEQ.NEXTVAL, 'A002', 'ROOT글 삭제글', 
				'두번째 ROOT 글의 삭제내용 작성', (SELECT NVL(MAX(REF),0)+1 FROM ANSWERBOARD a), 0, 
			   0, SYSDATE, 'Y');
	
SELECT SEQ, ID, 
		CASE DELFLAG 
			WHEN 'Y' THEN '--삭제된 글입니다--' 
			ELSE LPAD(' ', DEPTH*10) || TITLE 
			END AS TITLE, 
       "REF", STEP, "DEPTH", REGDATE, DELFLAG, NAME
	FROM ANSWERBOARD a JOIN USERINFO u 
	USING(ID)
	ORDER BY REF DESC, STEP;

-- 상세글 조회
SELECT SEQ, ID, TITLE, CONTENT ,REGDATE 
	FROM ANSWERBOARD a 
	WHERE SEQ ='3';

--- 글수정
UPDATE ANSWERBOARD SET CONTENT = '두번째 ROOT 글내용'
	WHERE SEQ = '3';

SELECT CONTENT
	FROM ANSWERBOARD a 
	WHERE SEQ ='3';

-- 글삭제
UPDATE ANSWERBOARD SET DELFLAG ='Y'
	WHERE SEQ = '2';

-- 답글(Transaction 처리)
-- 1) 입력되는 값보다 큰 STEP을 찾아서 모두 +1 해 준다
UPDATE ANSWERBOARD SET STEP = STEP +1
	WHERE REF = (SELECT REF FROM ANSWERBOARD a WHERE SEQ ='8')
		AND STEP > (SELECT STEP FROM ANSWERBOARD a WHERE SEQ ='8');

-- 2) 부모의 REF, 부모의 STEP +1, 부모의 DEPTH +1
INSERT INTO ANSWERBOARD
				(SEQ, ID, TITLE, 
				CONTENT, "REF", STEP, 
				"DEPTH", REGDATE, DELFLAG)
		VALUES(ANSWERBOARD_SEQ.NEXTVAL, 'A001', '답글답글', 
			   '답글답글 내용', (SELECT REF FROM ANSWERBOARD a WHERE SEQ='8'), (SELECT STEP FROM ANSWERBOARD a2 WHERE SEQ='8')+1, 
			   (SELECT "DEPTH"  FROM ANSWERBOARD a2 WHERE SEQ='8')+1, SYSDATE, 'N');




