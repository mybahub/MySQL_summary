/* Medmium
https://leetcode.com/problems/immediate-food-delivery-ii/
*/


/* Solution 1
*/

WITH summary AS (
    SELECT
        customer_id,
        order_date,
        customer_pref_delivery_date,
        row_number() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM Delivery
)

SELECT
    round(avg(if(order_date=customer_pref_delivery_date,1,0))*100,2) AS immediate_percentage
FROM summary
WHERE rn=1;


/* Solution 2
*/
WITH summary AS(
    SELECT
        customer_id,
        min(order_date) AS order_date
    FROM Delivery
    GROUP BY customer_id
)

SELECT
    round(avg(if(d.order_date=d.customer_pref_delivery_date,1,0))*100,2) AS immediate_percentage
FROM Delivery d
JOIN summary  s
USING (customer_id,order_date)
