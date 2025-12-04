# 1번
select 
	category_code,
	category_name
-- 	ref_category_code
from
	tbl_category 
order by
	category_name is not null desc;

#2번
select
	menu_name,
	menu_price
from
	tbl_menu
where 
	menu_name like '%밥%' and (menu_price between 20000 and 30000)
	
# 3번
select
	menu_name,
	menu_price
from
	tbl_menu
where 
	menu_name like '%김치%' and (menu_price <=10000)
order by 
	menu_price  and menu_name desc
	
# 4번
select 
	category_code,
	menu_name,
	menu_price,
	orderable_status
from	
	tbl_menu
where
	category_code not in ('10','9','8') and menu_price =13000 and orderable_status = 'Y'
	

	

