/* Medium
https://leetcode.com/problems/biggest-window-between-visits/
*/

/* Solution 1
lead+datediff
*/

WITH summary AS (
    SELECT
        user_id,
        datediff(COALESCE(lead(visit_date,1) OVER(PARTITION BY user_id ORDER BY visit_date),"2021-1-1"),visit_date) as diff
    FROM UserVisits
    WHERE visit_date<="2021-1-1"
)

SELECT
    user_id,
    max(diff) AS biggest_window
FROM summary
GROUP BY user_id
ORDER BY user_id;
