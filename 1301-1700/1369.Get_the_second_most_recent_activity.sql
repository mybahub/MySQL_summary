/*hard*/


/* Solution 1 windows function:
row_number()
count
*/

WITH user_summary AS (
    SELECT *,
    row_number() OVER (PARTITION BY username ORDER BY startDate DESC) AS r,
    count(startDate) OVER ( PARTITION BY username) AS num
    FROM UserActivity
)

SELECT username,activity,startDate,endDate
FROM user_summary
WHERE(num=1) OR (num>1 AND r=2);
