/* Easy
https://leetcode.com/problems/project-employees-ii/submissions/
*/

/* Solution 1
*/

WITH mnum AS(
    SELECT count(1)
    FROM Project
    GROUP BY project_id
    ORDER BY count(1) DESC
    LIMIT 1
)


SELECT project_id
FROM Project
GROUP BY project_id
HAVING count(1)=(SELECT * FROM mnum);

/* Solution 2
*/
WITH summary AS (
    SELECT
        project_id,
        rank() OVER(ORDER BY count(employee_id) DESC) AS rn
    FROM Project
    GROUP BY project_id
)

SELECT project_id
FROM summary
WHERE rn=1



/* Solution 3
where count >= all() to get the max from KumaG
slow because group by in the where condition run multiple times
*/

select project_id
from project
group by project_id
having count(employee_id) >= all (
    select count(employee_id)
    from project
    group by project_id)
