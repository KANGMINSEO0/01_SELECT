/* SET OPERATORS */

/* UNION */
-- 두 개 이상의 SELECT 문의 결과를 결합하여 중복된 레코드를 제거한 후 반환하는 연산자
SELECT
       MENU_CODE,
       MENU_NAME,
       MENU_PRICE,
       CATEGORY_CODE,
       ORDERABLE_STATUS
  FROM TBL_MENU
 WHERE CATEGORY_CODE = 10
 UNION
 SELECT
       MENU_CODE,
       MENU_NAME,
       MENU_PRICE,
       CATEGORY_CODE,
       ORDERABLE_STATUS
  FROM TBL_MENU
 WHERE MENU_PRICE < 9000;
 
/* UNION ALL */
-- 두 개 이상의 SELECT 문의 결과를 결합하여 중복된 레코드를 제거하지 않고 모두 반환
SELECT
       MENU_CODE,
       MENU_NAME,
       MENU_PRICE,
       CATEGORY_CODE,
       ORDERABLE_STATUS
  FROM TBL_MENU
 WHERE CATEGORY_CODE = 10
 UNION ALL
 SELECT
       MENU_CODE,
       MENU_NAME,
       MENU_PRICE,
       CATEGORY_CODE,
       ORDERABLE_STATUS
  FROM TBL_MENU
 WHERE MENU_PRICE < 9000;


/* INTERSECT */
-- 두 SELECT문의 결과 중 공통되는 레코드만을 반환하는 연산자이다.
-- MYSQL INTERSECT를 제공하지 않는다.
-- 하지만 INNER JOIN 또는 IN 연산자 활용해서 구현하는 것은 가능하다.

-- INNER JOIN 활용
SELECT
       A.MENU_CODE,
       A.MENU_NAME,
       A.MENU_PRICE,
       A.CATEGORY_CODE,
       A.ORDERABLE_STATUS
  FROM TBL_MENU A
  INNER JOIN (SELECT
                     MENU_CODE,
                     MENU_NAME,
                     MENU_PRICE,
                     CATEGORY_CODE,
                     ORDERABLE_STATUS
			    FROM TBL_MENU
			   WHERE MENU_PRICE < 9000) B ON (A.MENU_CODE = B.MENU_CODE)
WHERE A.CATEGORY_CODE = 10;

/* IN 연산자 활용 */
SELECT
       MENU_CODE,
       MENU_NAME,
       MENU_PRICE,
       CATEGORY_CODE,
       ORDERABLE_STATUS
  FROM TBL_MENU
 WHERE CATEGORY_CODE = 10 AND
	   MENU_CODE IN (SELECT
                            MENU_CODE
					   FROM TBL_MENU
					  WHERE MENU_PRICE < 9000);
                      
/* MINUS */
-- MYSQL은 MINUS를 제공하지 않는다. 하지만 LEFT JOIN을 활용해서 구현하는 것은 가능하다.
SELECT
       A.MENU_CODE,
       A.MENU_NAME,
       A.MENU_PRICE,
       A.CATEGORY_CODE,
       A.ORDERABLE_STATUS
  FROM TBL_MENU A
  LEFT JOIN (SELECT
                    MENU_CODE,
                    MENU_NAME,
                    MENU_PRICE,
                    CATEGORY_CODE,
                    ORDERABLE_STATUS
			   FROM TBL_MENU
			  WHERE MENU_PRICE < 9000) B ON (A.MENU_CODE = B.MENU_CODE)
WHERE A.CATEGORY_CODE = 10 AND
      B.MENU_CODE IS NULL;







 
 
 