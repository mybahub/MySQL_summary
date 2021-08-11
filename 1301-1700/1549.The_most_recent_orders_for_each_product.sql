/* Medium*/

/* Solution 1
Dense_rank
*/
WITH rec AS (
    SELECT p.product_name, o.product_id, o.order_id, o.order_date,
    DENSE_RANK() OVER(PARTITION BY o.product_id ORDER BY o.order_date DESC) AS r
    FROM Orders o
    JOIN Products p
    USING (product_id)
)

SELECT product_name,product_id,order_id, order_date
FROM rec
WHERE r=1
ORDER BY product_name,product_id,order_id;
