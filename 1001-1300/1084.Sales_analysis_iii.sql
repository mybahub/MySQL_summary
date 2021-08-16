/* Easy
https://leetcode.com/problems/sales-analysis-iii/
*/

/* Solution 1
IN between; not in ...
*/

SELECT product_id, product_name
FROM Product
WHERE product_id IN
(SELECT distinct product_id FROM Sales WHERE sale_date BETWEEN "2019-01-01" AND "2019-03-31")
AND product_id NOT IN
(SELECT distinct product_id FROM Sales WHERE sale_date>"2019-03-31" OR sale_date<"2019-01-01")

/* Solution 2
from JaniceJ
group by + min >=  AND max <=
*/

SELECT s.product_id, p.product_name
FROM Sales s JOIN Product p
ON p.product_id = s.product_id
GROUP BY s.product_id
HAVING MIN(s.sale_date) >= '2019-01-01' AND MAX(s.sale_date) <='2019-03-31 '
