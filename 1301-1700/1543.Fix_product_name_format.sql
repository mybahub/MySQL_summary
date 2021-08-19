/* Easy
https://leetcode.com/problems/fix-product-name-format/
*/

/* Solution1

*/

SELECT lower(trim(product_name)) AS product_name,
DATE_FORMAT(sale_date,"%Y-%m") AS sale_date,
count(sale_id) AS total
FROM Sales
GROUP BY 1,2
ORDER BY product_name, sale_date;
