/* Medium
https://leetcode.com/problems/project-employees-iii
*/

/* Solution 1
max+ partition by
*/

WITH summary AS (
    SELECT
      p.project_id,
      p.employee_id,
      e.experience_years,
      max(e.experience_years) OVER(PARTITION BY p.project_id ) as exp_max
    FROM Project p
    JOIN Employee e
    USING(employee_id)
)

SELECT project_id,employee_id
FROM emax
WHERE experience_years=exp_max;


/* Solution 2
rank
*/
WITH summary AS(
    SELECT
        p.project_id,
        p.employee_id,
        RANK() OVER(PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS rn
    FROM Employee e
    JOIN Project p
    USING(employee_id)
)

SELECT project_id, employee_id
FROM summary
WHERE rn=1;
