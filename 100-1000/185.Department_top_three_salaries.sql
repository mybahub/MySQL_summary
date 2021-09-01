/* Hard
https://leetcode.com/problems/department-top-three-salaries/
*/

/* Solution 1
*/

WITH salary_rank AS(
    SELECT
        name,
        salary,
        departmentid,
        dense_rank() OVER(PARTITION BY departmentid ORDER BY salary DESC) AS rn
    FROM Employee
)

SELECT
    d.name AS department,
    s.name AS employee,
    s.salary
FROM salary_rank s
JOIN Department d
ON s.departmentid=d.id
WHERE rn<=3
ORDER BY department;
