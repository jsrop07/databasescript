SELECT 
    category_code
FROM
    tbl_menu
GROUP BY category_code;

-- count 함수 활용
select 
	category_code,
	count(*)
from tbl_menu
group by category_code

-- sum 함수 활용
select
	category_code,
	sum(menu_price),
	count(*)
from tbl_menu
group by category_code;

	
-- avg 함수 활용
select 
	category_code,
	avg(menu_price),
	count(*)
from 
	tbl_menu
group by category_code;

-- 2개 이상의 그룹 생성
select
	 menu_price,
	 category_code
from 
	tbl_menu
group by
	menu_price,
	category_code
order by menu_price, category_code;

-- HAVING
select
	menu_price,
	category_code
from
	tbl_menu
group by
	menu_price,
	category_code 
having
	category_code >=5 and category_code <= 8;

-- ROLLUP
select
	category_code,
	sum(menu_price)
from
	tbl_menu
group by 
	category_code
WITH rollup;
