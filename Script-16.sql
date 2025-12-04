use menudb;

select
	menu_name,
	menu_price,
	ordertable_status	
from
	tbl_menu
where
	orderable_status = 'Y'