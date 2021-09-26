/* Easy
https://leetcode.com/problems/immediate-food-delivery-i/
*/

SELECT
    round(avg(if(order_date=customer_pref_delivery_date,1,0))*100,2) AS immediate_percentage
FROM Delivery
