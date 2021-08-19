/* Easy
https://leetcode.com/problems/group-sold-products-by-the-date/
*/

/* Solution 1
Group_concat
*/

SELECT sell_date,
count(distinct product) AS num_sold,
group_concat(distinct product) AS products
FROM Activities
GROUP BY sell_date
ORDER BY 1
