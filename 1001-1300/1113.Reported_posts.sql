/* Easy
https://leetcode.com/problems/reported-posts/
*/

/* Solution 1
*/
SELECT
    extra AS report_reason,
    count(distinct post_id) AS report_count
FROM Actions
WHERE action_date='2019-07-05'-INTERVAL 1 DAY AND action='report'
GROUP BY extra
