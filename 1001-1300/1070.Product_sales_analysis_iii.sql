/* Medium
https://leetcode.com/problems/product-sales-analysis-iii/
*/

/* Solution 1
window function
*/
WITH summary AS (
    SELECT
        product_id,
        year,
        quantity,
        price,
        dense_rank() OVER (PARTITION BY product_id ORDER BY year) AS rn
    FROM Sales
)

SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM summary
WHERE rn=1;

/* Solution 2
JOIN
*/

SELECT
    s.product_id,
    s.year as first_year,
    s.quantity,
    s.price
FROM (
    SELECT product_id, min(year) as year
    FROM Sales
    GROUP BY product_id
) t

JOIN Sales s
USING(product_id,year)
