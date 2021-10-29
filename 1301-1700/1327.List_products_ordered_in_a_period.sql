/* Easy
https://leetcode.com/problems/list-the-products-ordered-in-a-period/
*/

/*Solution 1*/

SELECT
    p.product_name,
    sum(o.unit) as unit
FROM Products p
JOIN Orders o
USING(product_id)
WHERE order_date LIKE "2020-02%"
GROUP BY 1
HAVING unit>=100;
