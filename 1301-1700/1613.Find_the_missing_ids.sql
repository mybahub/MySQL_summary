/* Medium */

/* Solution 1
use recursive to make a full id list
*/

WITH RECURSIVE list AS(
    SELECT 1 AS ids
    UNION
    SELECT ids+1 AS ids
    FROM list
    WHERE ids<(SELECT max(customer_id) FROM Customers)
)

SELECT ids FROM list
WHERE ids NOT IN (SELECT customer_id FROM Customers);
