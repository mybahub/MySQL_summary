/* Easy
https://leetcode.com/problems/sales-analysis-i/
*/

WITH summary AS(
    SELECT
        seller_id,
        rank() OVER (ORDER BY sum(price) DESC) AS rn
    FROM Sales
    GROUP BY seller_id

)

SELECT seller_id
FROM summary
WHERE rn=1;
