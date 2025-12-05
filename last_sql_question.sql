use employeedb;


select * from employee

### 1번  
select emp_name,concat(substring(phone, 1, 3),'-',substring(phone, 4, 4),'-',substring(phone, 8, 4)) as employees 
from employee
-- where phone like '%010%'
where substring(phone,1,3) = '010'

### 2번 다시풀기
SELECT emp_name AS 직원명,
       DATE_FORMAT(hire_date, "%y년 %m월 %d일") AS birth,
       salary AS 급여
FROM employee;

select 
	 emp_name as '직원명',
	 DATE_FORMAT(hire_date, "%y년 %m월 %d일") AS 입사일,
-- 	 concat(year(hire_date),'년', month(hire_date),'월 ', day(hire_date), '일' ),
	 salary as '급여'
FROM employee;
where datediff(now(), hire_date) > (20*365)
order by
	salary desc


select emp_name as 직원명,
		salary as 급여,
		round(salary + ifnull(bonus,0)) as '보너스 더한 금액'
from employee

# 3번
select 
	emp_name as EMP_NAME,
	format(salary,0) as SALARY,
	concat(format(bonus*100,'%')) as BONUS,
	format(salary + round(salary * ifnull(bonus,0)),0) as 'total_salary'
from employee
order by 
	total_salary desc
	
# 4번
select 
	emp_name as 'EMP_NAME',
	lpad(email, (select MAX(length(EMAIL)) from employee),' ') as email
from employee

# 5번
select 
	CONCAT(EMP.EMP_NAME, ' ', ifnull(dept.dept_title, ''),'님') as name_tag,
	rpad(SUBSTRING(emp.emp_no ,1,8),13,'*') as EMP_NO,
	concat(loc.local_name,'지사 ', dept.dept_title,'소속') as belong,
	manager.emp_name as manager_name
from 
	employee EMP
left join department dept on emp.dept_code = dept.dept_id
left join LOCATION loc on dept.location_id = loc.local_code
left join employee manager on emp.MANAGER_ID = manager.emp_id
left join job j  on emp.job_code = j.job_code
join nation nat on loc.national_code = nat.national_code
order by manager_name