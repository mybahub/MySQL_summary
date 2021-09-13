/* Medium
https://leetcode.com/problems/customers-who-bought-all-products/
*/

/* Solution 1
group+subquery
*/
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING count(distinct product_key)=(SELECT count(distinct product_key) FROM Product)
