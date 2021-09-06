/* easy
https://leetcode.com/problems/sales-person/
*/

/* Solution 1
not in;
*/

WITH redlist AS (
    SELECT distinct o.sales_id
    FROM company c
    JOIN orders o
    USING (com_id)
    WHERE c.name="RED"
)

SELECT name
FROM salesperson
WHERE sales_id NOT IN (SELECT sales_id FROM redlist);


/* Solution 2
JOIN
*/

WITH redlist AS(
    SELECT distinct o.sales_id
    FROM company c
    JOIN orders o
    USING(com_id)
    WHERE c.name="RED"
)

SELECT s.name
FROM salesperson s
LEFT JOIN redlist r
USING(sales_id)
WHERE r.sales_id IS NULL;
