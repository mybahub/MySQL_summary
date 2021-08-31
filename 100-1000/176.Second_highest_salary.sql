/* Easy
https://leetcode.com/problems/second-highest-salary/
*/

/* Solution 1 */

SELECT max(salary) AS SecondHighestSalary
FROM Employee
WHERE salary<(SELECT max(salary) FROM Employee);


/* Solution 2 */

SELECT
(SELECT distinct salary
FROM Employee
ORDER BY salary DESC
LIMIT 1,1) AS SecondHighestSalary
