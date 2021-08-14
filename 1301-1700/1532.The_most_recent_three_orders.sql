/* Medium *

/*Solution 1
using row_number() to get the rank of date for each customer
*/
WITH order_rank AS(
    SELECT customer_id,order_id,order_date,
        ROW_NUMBER() OVER( PARTITION BY customer_id ORDER BY order_date DESC) as r
    FROM Orders
)

SELECT c.name AS customer_name, o.customer_id,o.order_id,o.order_date
FROM Customers c
JOIN order_rank o
ON c.customer_id=o.customer_id
WHERE o.r<=3
ORDER BY customer_name, o.customer_id,o.order_date DESC;
