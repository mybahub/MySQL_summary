/* Easy
https://leetcode.com/problems/product-sales-analysis-i/
*/


WITH summary AS(
    SELECT
        s.sale_id,
        p.product_name,
        s.year,
        max(s.price) AS price
    FROM Sales s
    LEFT JOIN Product p
    USING (product_id)
    GROUP BY s.sale_id,p.product_name, s.year
)

SELECT product_name, year, price
FROM summary
