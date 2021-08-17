/* Medium
https://leetcode.com/problems/restaurant-growth/
*/

/* Solution 1
window funnction range between
*/

WITH summary AS (
    SELECT visited_on,
    sum(amount) AS amount,
    avg(amount) AS average_amount
    FROM Customer
    GROUP BY visited_on
    ORDER BY visited_on
)

SELECT visited_on,
sum(amount) OVER (ORDER BY visited_on RANGE INTERVAL 6 DAY PRECEDING ) AS amount,
round(avg(amount) OVER (ORDER BY visited_on RANGE INTERVAL 6 DAY PRECEDING ),2) AS average_amount
FROM summary
ORDER BY visited_on
LIMIT 999999 OFFSET 6;
