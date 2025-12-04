use employeedb;

select 
	EMP_ID,
	EMP_NAME,
	PHONE,
	HIRE_DATE,
	ENT_YN
from 
	employee
where
	ENT_YN = 'N'and PHONE like 	'%2' 
order by 
	hire_date desc 
limit 3
