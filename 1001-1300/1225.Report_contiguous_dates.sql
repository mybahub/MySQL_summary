/* Hard
https://leetcode.com/problems/report-contiguous-dates/
*/

/* Solution 1 */

WITH full_data AS(
    SELECT
    "failed" AS status,
    fail_date AS date
    FROM Failed
    UNION ALL
    SELECT
    "succeeded" AS status,
    success_date as date
    FROM Succeeded
)

SELECT
    status AS period_state,
    min(date) AS start_date,
    max(date) AS end_date
FROM(
    SELECT *, date_sub(date,INTERVAL row_number() OVER() day) as gp FROM full_data
) t
WHERE date BETWEEN "2019-01-01" AND "2019-12-31"
GROUP BY period_state,gp
ORDER BY start_date
