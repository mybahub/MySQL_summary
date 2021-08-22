/* Easy
https://leetcode.com/problems/employees-whose-manager-left-the-company/
*/

/* Difference between not in AND not exists

in handling null
1. Not exists : not row can return; null is true here
2. NOT IN: null value will return a null, still fails the condition

*/

/* Solution 1
*/

SELECT employee_id
FROM Employees e
WHERE salary <30000 AND NOT EXISTS (SELECT * FROM Employees WHERE employee_id =e.manager_id)
AND manager_id IS NOT null
ORDER BY 1

/* Solution 2
*/

SELECT employee_id
FROM Employees e
WHERE salary <30000 AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY 1
