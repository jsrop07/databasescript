use menudb;

select
	menu_name,
	menu_price,
	orderable_status	
from
	tbl_menu
where
	orderable_status = 'Y'


-- 직관적	
use menudb;

select
	menu_name,
	menu_price,
	orderable_status	
from
	tbl_menu
where
	orderable_status != 'Y'
	
-- 	q3 메뉴명에 김치가 포함된 메뉴
use menudb;

select
	menu_name,
	menu_price,
	orderable_status	
from
	tbl_menu
where
	menu_name like concat('%', '김치', '%')
	

select 1 or 2, 1 or 0, 1 or 0;

select 0 or 0

select 1 or null, 0 or null, null or null

orderable_status



select
	menu_name,
	menu_price,
	category_code,
	orderable_status	
from
	tbl_menu
where
	orderable_status = 'Y' or category_code
-- 	menu_name like concat('%', '김치', '%')
order by
	category_code desc; -- 오름차순
	
	
select
	*
from
	tbl_menu
where
	menu_price  >= 5000 or category_code = 10
	
	
-- select 1 or 0 or 0
-- select (1 or 0) or 0


SELECT 
    menu_name, 
    menu_price, 
    category_code,
    orderable_status
FROM
    tbl_menu
WHERE
    orderable_status = 'Y' AND
    category_code = 10;


SELECT 
    menu_code, 
    menu_name, 
    menu_price,
    category_code,
    orderable_status
FROM
    tbl_menu
where
	category_code = 4 or
    menu_price > 5000 AND 
    category_code = 10;


SELECT 
    menu_name, 
    menu_price, 
    category_code
FROM
    tbl_menu
WHERE
    menu_price >= 10000 AND 
    menu_price <= 25000
ORDER BY 
    menu_price;



SELECT 
    menu_code, 
    menu_name, 
    menu_price,
    category_code,
    orderable_status
FROM
    tbl_menu
where
	menu_price>= 10000 and menu_price  <= 25000
order by 
	menu_price;


SELECT 
    menu_name, 
    menu_price, 
    category_code
FROM
    tbl_menu
WHERE
    menu_price BETWEEN 10000 AND 25000
ORDER BY 
    menu_price;


SELECT 
    menu_name, 
    menu_price, 
    category_code
FROM
    tbl_menu
WHERE
    menu_price not BETWEEN 10000 AND 25000
ORDER BY 
    menu_price;


-- SELECT 
--     menu_name, 
--     menu_price
-- FROM
--     tbl_menu
-- WHERE
--     menu_name LIKE '%마늘%'
-- ORDER BY 
--     menu_name;
SELECT 
    menu_name, 
    menu_price
FROM
    tbl_menu
WHERE
    menu_name LIKE concat('%','%마늘%',)
ORDER BY 
    menu_name;

SELECT 
    menu_name, 
    menu_price
FROM
    tbl_menu
where
    menu_name LIKE concat('%','빵') -- 빵이 마지막글자로

    
SELECT 
*
FROM
    tbl_menu
where 
    menu_price >= 5000 and 
    category_code  = 10 and 
    menu_name not like '%갈치%'
    

SELECT 
*
FROM
    tbl_menu
where  
    category_code  = 4 or  
	category_code  = 5 or
	category_code  = 6
	

	
select
*
from 
	tbl_category
where
	ref_category_code is null;
-- 	ref_category_code is not null;

select
	 menu_code,
	 menu_name,
	 menu_price
from
	tbl_menu
order by
	menu_price asc,
	menu_name 

select
	 menu_code,
	 menu_price,
	 menu_name,
	 menu_price * menu_code as mul
from 
	tbl_menu
order by
	menu_code *menu_price desc
	
SELECT FIELD('A', 'A', 'B', 'C');

SELECT FIELD('B', 'A', 'B', 'C');

SELECT 
    FIELD(orderable_status, 'N', 'Y')
FROM 
    tbl_menu;

SELECT 
    menu_name, 
    orderable_status
FROM
    tbl_menu
ORDER BY FIELD(orderable_status, 'N', 'Y');


SELECT 
    category_code,
    category_name,
    ref_category_code
FROM
    tbl_category
ORDER BY 
--     ref_category_code ASC;
    ref_category_code;    -- ASC 생략 가능
    
    
SELECT 
    category_code,
    category_name,
    ref_category_code
FROM
    tbl_category
ORDER BY 
--     ref_category_code IS null ASC;    -- ASC 생략 가능
    ref_category_code IS null DESC;
-- 	ref_category_code DESC;