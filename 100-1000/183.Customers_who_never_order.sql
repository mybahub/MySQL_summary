/* Easy
https://leetcode.com/problems/customers-who-never-order/
*/

SELECT a.Name AS Customers
FROM Customers a LEFT JOIN Orders b ON a.Id=b.CustomerId
WHERE b.CustomerId IS NULL;
