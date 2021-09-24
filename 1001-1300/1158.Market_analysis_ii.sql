/* Medium
https://leetcode.com/problems/market-analysis-i/
*/

/* Solution 1
*/

SELECT
    u.user_id AS buyer_id,
    u.join_date,
    ifnull(count(o.order_id),0) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o
ON u.user_id=o.buyer_id AND year(o.order_date)=2019
GROUP BY u.user_id
