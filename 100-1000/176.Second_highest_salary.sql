/* Easy
https://leetcode.com/problems/second-highest-salary/
*/

/* Solution 1 */

WITH salary_max AS(
    SELECT max(salary) as smax
    FROM Employee
)

SELECT max(salary) AS SecondHighestSalary
FROM Employee
WHERE salary<(SELECT smax FROM salary_max);

/* Solution 2 */

SELECT max(salary) AS SecondHighestSalary
FROM Employee
WHERE salary<(SELECT max(salary) FROM Employee);


/* Solution 3 */

SELECT
(SELECT distinct salary
FROM Employee
ORDER BY salary DESC
LIMIT 1,1) AS SecondHighestSalary
