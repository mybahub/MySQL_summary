/* Medium
https://leetcode.com/problems/product-price-at-a-given-date/
*/

WITH lastPrice AS(
    SELECT
        distinct product_id,
        last_value(new_price) OVER(PARTITION BY product_id ORDER BY change_date range BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS new_price
    FROM Products
    WHERE change_date<='2019-08-16'
)

SELECT
    t.product_id,
    IFNULL(l.new_price,10) AS price
FROM (SELECT distinct product_id FROM Products)t
LEFT JOIN lastPrice l
USING(product_id)
