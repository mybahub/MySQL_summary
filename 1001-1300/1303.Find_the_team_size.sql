/* Easy
https://leetcode.com/problems/find-the-team-size/
*/

/* Solution 1*/

SELECT
    employee_id,
    count(employee_id) OVER(PARTITION BY team_id) AS team_size
FROM Employee
