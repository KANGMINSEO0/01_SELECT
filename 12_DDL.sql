/* DDL (Data Definition Language */

/* CREATE */
-- 테이블 생성을 위한 구문
-- IF NOT EXISTS를 적용하면 기존에 존재하는 테이블이라도 에러가 발생하지 않는다.

-- tb1 생성
CREATE TABLE IF NOT EXISTS tb1 (
	pk INT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),		-- 255 크기 제한
    CHECK(col1 IN ('Y', 'N'))		-- 제약 조건
)ENGINE=INNODB;

-- 테이블 구조 확인
DESCRIBE tb1;

INSERT INTO tb1 VALUES (1, 10, 'Y');

SELECT * FROM tb1;


/* AUTO_INCREMENT */
-- INSERT 시 PRIMARY키에 해당하는 컬럼에 자동으로 번호를 발생(중복되지 않게)시켜 저장할 수 있다.

-- tb2 테이블 생성
CREATE TABLE IF NOT EXISTS tb2 (
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),		-- 225 크기 제한
    CHECK(col1 IN ('Y', 'N'))		-- 제약 조건
)ENGINE=INNODB;

DESCRIBE tb2;

INSERT INTO tb2 VALUES(NULL, 10, 'Y');
INSERT INTO tb2 VALUES(NULL, 20, 'Y');

SELECT * FROM tb2;

/* ALTER */
-- 테이블에 추가/변경/수정/삭제하는 모든 것은 ALTER 명령어를 사용해 적용한다.
-- 열 추가
ALTER TABLE tb2
ADD col2 INT NOT NULL;

DESCRIBE tb2;

-- 열 이름 및 데이터 형식 변경
ALTER TABLE tb2
CHANGE COLUMN fk change_fk INT NOT NULL;

-- 열 제약 조건 추가 및 삭제
ALTER TABLE tb2
DROP PRIMARY KEY;		-- 에러 발생

-- AUTO_INCREMENT가 걸려 있는 칼럼은 PRIMARY KEY 제거가 안되므로
-- AUTO_INCREMENT를 MODIFY 명령어로 제거한다.
-- MODIFY는 컬럼의 정의를 바꾸는 것이다.
ALTER TABLE tb2
MODIFY pk INT;		-- Extra열에 오토인크리먼트 제거되있음

-- 다시 PRIMARY KEY 제약조건 제거
ALTER TABLE tb2
DROP PRIMARY KEY;

-- PRIMARY KEY 제약조건 추가
ALTER TABLE tb2
ADD PRIMARY KEY(pk);

DESCRIBE tb2;			-- 다시 프라이머리키 생긴거 확인 할 수 있음


/* DROP */
-- 테이블을 삭제하기 위한 구문
-- IF EXISTS 적용하면 존재하지 않는 테이블 삭제 구문이라도 에러가 발생하지 않는다.

-- tb3 테이블 생성
CREATE TABLE IF NOT EXISTS tb3 (
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),		-- 225 크기 제한
    CHECK(col1 IN ('Y', 'N'))		-- 제약 조건
)ENGINE=INNODB;

-- tb3 테이블 삭제
DROP TABLE IF EXISTS tb3;

-- 한번에 여러개의 테이블 삭제
DROP TABLE IF EXISTS tb1, tb2;

/* TRUNCATE */
-- 논리적으로는 WHERE절이 없는 DELETE구문과 큰 차이가 없어 보인다.
-- 하지만 어차피 데이터를 다 삭제할 경우 행마다 하나씩 지워지는 DELETE보다
-- DROP 이후 바로 테이블을 재생성 해주는 TRUNCATE가 훨씬 효율적으로 한번에 테이블을 초기화 시켜준다.
-- 또한 AUTO_INCREMENT 컬럼이 있는 경우 시작 값으로 초기화가 된다.


CREATE TABLE IF NOT EXISTS tb4 (
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),		-- 225 크기 제한
    CHECK(col1 IN ('Y', 'N'))		-- 제약 조건
)ENGINE=INNODB;

INSERT INTO tb4 VALUES(NULL, 10, 'Y');
INSERT INTO tb4 VALUES(NULL, 20, 'Y');
INSERT INTO tb4 VALUES(NULL, 30, 'Y');
INSERT INTO tb4 VALUES(NULL, 40, 'Y');

SELECT * FROM tb4;

-- 테이블 초기화 하기
TRUNCATE tb4;             -- TABLE 키워드 생략 가능





