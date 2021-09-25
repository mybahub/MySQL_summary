/* Hard
https://leetcode.com/problems/market-analysis-ii/
*/

/* Solution 1
row_number()
*/
WITH summary AS(
    SELECT
        o.seller_id,
        i.item_brand,
        row_number() OVER(PARTITION BY o.seller_id ORDER BY o.order_date) AS rn
    FROM Orders o
    JOIN Items i
    USING(item_id)

)

SELECT
    u.user_id AS seller_id,
    if(s.item_brand=u.favorite_brand,'yes','no') AS 2nd_item_fav_brand
FROM Users u
LEFT JOIN summary s
ON u.user_id=s.seller_id AND s.rn=2;
