/* Medium */

/* Solution 1
max+ partition by
*/

WITH emax AS (
    SELECT p.project_id,
    e.employee_id,
    e.experience_years,
    max(e.experience_years) OVER(PARTITION BY p.project_id ) as exp_max
    FROM Project p
    JOIN Employee e
    USING(employee_id)
)

SELECT project_id,employee_id
FROM emax
WHERE experience_years=exp_max;
