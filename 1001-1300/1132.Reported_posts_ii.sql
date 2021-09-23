/* Medium
https://leetcode.com/problems/reported-posts-ii/
*/

/* Solution 1
*/

WITH summary AS(
    SELECT
        a.action_date,
        count( distinct r.post_id)/count( distinct a.post_id) AS cancel_rate
    FROM Actions a
    LEFT JOIN Removals r
    USING(post_id)
    WHERE a.action='report' AND extra='spam'
    GROUP BY a.action_date
)

SELECT round(avg(cancel_rate)*100,2) AS 'average_daily_percent'
FROM summary;
