/* Medium
https://leetcode.com/problems/new-users-daily-count/
*/

/* Solution 1
*/
SELECT
    login_date,
    count(user_id) AS user_count
FROM(
    SELECT
        user_id,
        min(activity_date) AS login_date
    FROM Traffic
    WHERE activity="login"
    GROUP BY user_id
)t

WHERE login_date>= DATE_SUB('2019-06-30',INTERVAL 90 DAY)
GROUP BY login_date
ORDER BY login_date
