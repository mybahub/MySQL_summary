/* Easy
https://leetcode.com/problems/sales-analysis-ii/
*/

/* Solution1
*/

WITH sphone AS(
    SELECT distinct s.buyer_id
    FROM Sales s
    JOIN Product p
    USING(product_id)
    WHERE product_name="S8"
), iphone AS(
    SELECT distinct s.buyer_id
    FROM Sales s
    JOIN Product p
    USING(product_id)
    WHERE product_name="iPhone"
)

SELECT buyer_id
FROM sphone
WHERE buyer_id not in (SELECT buyer_id FROM iphone);

/* Solution 2
*/
WITH summary AS (
    SELECT
        s.buyer_id,
        CASE
        WHEN p.product_name="S8" THEN 1
        WHEN p.product_name="iPhone" THEN -10000
        ELSE 0 END as score
    FROM Sales s
    JOIN Product p
    USING(product_id)
)

SELECT  buyer_id
FROM summary
GROUP BY buyer_id
HAVING sum(score)>0;

/* Solution 3*/
SELECT s.buyer_id
FROM Sales s
JOIN Product p
USING(product_id)
GROUP BY s.buyer_id
HAVING sum(if(p.product_name="S8",1,0))>0
AND sum(if(p.product_name="iPhone",1,0))=0
