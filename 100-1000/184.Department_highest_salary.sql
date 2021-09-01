/* Medium
https://leetcode.com/problems/department-highest-salary/
*/

/* Solution 1
*/

WITH max_summary AS(
    SELECT
        name,
        salary,
        departmentid,
        max(salary) OVER(PARTITION BY departmentid) AS max_dept_salary
    FROM Employee
)

SELECT
    d.name AS department,
    m.name AS employee,
    m.salary
FROM max_summary m
JOIN Department d
ON m.departmentid=d.id
WHERE m.salary=m.max_dept_salary

/* Solution 2
slower because of the subquery
*/

SELECT
  d.Name AS Department,
  e.Name AS Employee, e.Salary
FROM Employee e
LEFT JOIN Department d ON e.DepartmentId=d.Id
WHERE (e.Salary,e.DepartmentId) IN
(SELECT max(Salary),DepartmentId FROM Employee GROUP BY DepartmentId) AND d.Name IS NOT NULL;
