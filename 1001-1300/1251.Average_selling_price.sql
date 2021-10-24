/* Easy
https://leetcode.com/problems/average-selling-price/
*/


SELECT
    p.product_id,
    round(sum(p.price*u.units)/sum(u.units),2) AS average_price
FROM Prices p
JOIN UnitsSold u
ON p.product_id=u.product_id AND (u.purchase_date BETWEEN p.start_date AND p.end_date)
GROUP BY p.product_id
