/* Easy
https://leetcode.com/problems/sales-analysis-iii/
*/

/* Solution 1
IN between; not in ...
*/

WITH outrange AS(
    SELECT distinct product_id
    FROM Sales
    WHERE sale_date>"2019-03-31" OR sale_date<"2019-01-01"
)


SELECT distinct s.product_id,p.product_name
FROM Sales s
JOIN Product p
USING(product_id)
WHERE s.product_id NOT IN (SELECT product_id FROM outrange) AND (sale_date BETWEEN "2019-01-01" AND "2019-03-31");

/* Solution 2
from JaniceJ
group by + min >=  AND max <=
*/

SELECT s.product_id, p.product_name
FROM Sales s JOIN Product p
ON p.product_id = s.product_id
GROUP BY s.product_id
HAVING MIN(s.sale_date) >= '2019-01-01' AND MAX(s.sale_date) <='2019-03-31 '
