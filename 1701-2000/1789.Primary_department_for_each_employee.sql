/* Easy
https://leetcode.com/problems/primary-department-for-each-employee/
*/

/* Solution 1
not in
*/
WITH y AS (
    SELECT employee_id, department_id
FROM Employee
WHERE primary_flag="Y"
    )

SELECT * FROM y
UNION ALL
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag="N" AND employee_id NOT IN (SELECT employee_id FROM y)

/* Solution 2
from mjfun82
coalesce() +CASE WHEN to generate right value
*/
select employee_id,
       coalesce(max(case when primary_flag='Y' then department_id else null end),max(department_id)) department_id
  from employee t
  group by employee_id

/* Solution 3
FROM lattices
first_value
*/
select
	distinct employee_id
	, first_value(department_id) over (partition by employee_id order by primary_flag) as department_id
	from
	Employee
