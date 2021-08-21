/* Medium
https://leetcode.com/problems/group-employees-of-the-same-salary/
*/

/* Solution 1
CET + dense_rank()
*/
WITH summary AS(
    SELECT *,
    count(employee_id) OVER (PARTITION BY salary) AS snum
    FROM Employees
)

SELECT
    employee_id,
    name,
    salary,
    dense_rank() OVER(ORDER BY salary) AS team_id
FROM summary
WHERE snum>1
ORDER BY team_id, employee_id;

/* Solution2
from linweihsiang0629
not in + dense_rank()
*/
SELECT *,
    DENSE_RANK() OVER(ORDER BY salary) team_id
FROM Employees
WHERE salary NOT IN(
			SELECT salary
			FROM Employees
			GROUP BY salary
			HAVING COUNT(*) = 1)
ORDER BY team_id, employee_id
