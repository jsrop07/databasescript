use menudb;

select menu_name from tbl_menu;

-- select menu_name as 메뉴이름
-- from tbl_menu


select
	menu_code, menu_name, menu_price
from tbl_menu

select now();

SELECT 
    menu_name, 
    menu_price, 
    orderable_status
FROM
    tbl_menu
WHERE
    menu_price  = 13000;


SELECT 
    menu_code,
    menu_name, 
    orderable_status
FROM
    tbl_menu
WHERE
--     orderable_status <> 'Y';
    orderable_status != 'Y';


SELECT 6 + 3;   
SELECT 6 * 3;
SELECT 6 % 3;

select concat('홍',' ','길동') as name
select concat('2',' ','0') as 나이
