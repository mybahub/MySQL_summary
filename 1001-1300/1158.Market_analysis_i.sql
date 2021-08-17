/* Medium
https://leetcode.com/problems/market-analysis-i/
*/

/* Solution 1
filter in ON
*/

SELECT u.user_id AS buyer_id,u.join_date, count(COALESCE(o.order_id)) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o
ON u.user_id=o.buyer_id AND year(order_date)=2019
GROUP BY u.user_id
