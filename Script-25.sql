select * from employee;
select * from job;

-- 	직원명, 직급명, 급여, 사원번호,이메일,전화번호,입사일
select
	e.emp_name, j.job_name, e.salary, e.emp_no, e.email, e.phone, e.hire_date
from employee e
join job j on e.job_code = j.job_code
where j.join_name = '대리'
and e.ent_yn = 'N'

-- dept code : 부서별 인원 / salary : 급여 합계 / 평균
# 3
select * from employee	
select * from department	
	
select
	count(*) as '부서명',
	avg(salary),sum(salary)
from
	employee
group by dept_code

describe employee

SELECT 
    d.dept_title AS '부서명',
    COUNT(*) AS '인원',
    SUM(e.SALARY) AS '급여합계',
    AVG(e.SALARY) AS '급여평균'
FROM employee e
left JOIN department d ON e.DEPT_CODE = d.dept_id
WHERE e.ENT_YN = 'N'  
GROUP BY d.dept_title
with ROLLUP


select * from employee where ENT_YN = 'N'

select * from job

SELECT
    '전체' AS '부서명',
    COUNT(EMP_ID) AS '인원',
    SUM(SALARY) AS '급여합계',
    AVG(SALARY) AS '급여평균'
FROM employee
WHERE ENT_YN = 'N';

# 4번
select
	e.emp_name as '직원명',
	e.emp_no as '주민등록번호',
	e.hire_date as '입사일',
    d.dept_title AS '부서명',
    j.job_name as '직급'
from 
	employee E
	left join department d on e.dept_code = d.dept_id
	join job j on e.job_code = j.job_code
	order by hire_date
	
JOIN department  
	ON DEPT_CODE = dept_id
order by
	hire_date


# 5번
select * from employee;

-- 5-1
select
	count(*)
from employee
where manager_id is not null

-- 5-2
select 
	count(*) 
from 
	employee e1 
join employee e2 on e1.manager_id = e2.emp_id # e1은 직원이 출력

-- 5-3
select * from employee
select
	e1.emp_name as 직원명
	e1.emp_name as 직원명
from employee e1
left join employee e2 on e1.manager_id = e2.emp_id 

select * from employee where manager_id is not null

select * from department;

select 
	e1.emp_name,
	d1.dept_code,
	e2.emp_name,
	d2.dept_title 
from employee e1

left join department d1 on e1.dept_code = d1.dept_id
join employee e2 on d1.manager_id = e2.emp_id
left join department d2 on e2.dept_code = d2.dept_id

from employee e1
