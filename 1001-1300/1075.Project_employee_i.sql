/* Easy
https://leetcode.com/problems/project-employees-i/
*/

SELECT
    p.project_id,
    round(avg(e.experience_years),2) AS average_years
FROM Project p
LEFT JOIN Employee e
USING(employee_id)
GROUP BY p.project_id;
