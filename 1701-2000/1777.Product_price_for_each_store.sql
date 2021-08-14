/* Easy */
/*Solution 1
max(if())+group by to pivot table
*/

SELECT product_id,
    max(IF(store="store1",price,NULL)) AS store1,
    max(IF(store="store2",price,NULL)) AS store2,
    max(IF(store="store3",price,NULL)) AS store3
FROM Products
GROUP BY product_id;
