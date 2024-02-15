/* GROUP BY */
-- 메뉴가 존재하는 카테고리 그룹 조회
SELECT
       CATEGORY_CODE
  FROM TBL_MENU
  GROUP BY CATEGORY_CODE;	-- 특정열을 결과 집합에 따라 그룹

-- COUNT 함수 활용
SELECT
       CATEGORY_CODE,
       COUNT(*)
  FROM TBL_MENU
  GROUP BY CATEGORY_CODE;	-- 각 카테고리에 몇 개의 메뉴가 있는지 카운트 함수를 이용해서 
  
-- SUM 함수 활용
SELECT
       CATEGORY_CODE,
       SUM(MENU_PRICE)
  FROM TBL_MENU
  GROUP BY CATEGORY_CODE;
  
-- AVG 함수 활용
SELECT
       CATEGORY_CODE,
       AVG(MENU_PRICE)
  FROM TBL_MENU
  GROUP BY CATEGORY_CODE;
  
-- 2개 이상의 그룹 생성
SELECT
       MENU_PRICE,
       CATEGORY_CODE
  FROM TBL_MENU
  GROUP BY MENU_PRICE,
           CATEGORY_CODE;
           

/* HAVING */
SELECT
       CATEGORY_CODE
  FROM TBL_MENU
  GROUP BY CATEGORY_CODE
  HAVING CATEGORY_CODE BETWEEN 5 AND 8;
  
/* ROLL UP */
-- 컬럼 한 개를 활용한 ROLLUP(카테고리별 총합)
SELECT
      CATEGORY_CODE,
      SUM(MENU_PRICE)
  FROM TBL_MENU
  GROUP BY CATEGORY_CODE
  WITH ROLLUP;

-- 컬럼 두 개를 활용한 ROLLUP(같은 메뉴 가격별 총합 및 해당 메뉴 가격별 같은 카테고리의 총합)
-- ROLLUP을 통해 먼저 나온 컬럼의 총합을 구하고 이후 나오는 컬럼의 총합도 구하는 방식이다.
SELECT
       MENU_PRICE,
       CATEGORY_CODE,
       SUM(MENU_PRICE)
  FROM TBL_MENU
  GROUP BY MENU_PRICE,
           CATEGORY_CODE
  WITH ROLLUP;











