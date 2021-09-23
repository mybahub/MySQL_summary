/* Easy
https://leetcode.com/problems/user-activity-for-the-past-30-days-ii/
*/


SELECT
    round(IFNULL(count(distinct session_id)/count(distinct user_id),0),2) AS average_sessions_per_user
FROM Activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27',INTERVAL 29 DAY) AND '2019-07-27'
