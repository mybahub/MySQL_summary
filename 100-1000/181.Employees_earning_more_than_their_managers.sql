/* Easy
https://leetcode.com/problems/employees-earning-more-than-their-managers/
*/

SELECT e1.name AS Employee
FROM Employee e1 JOIN Employee e2
ON e1.managerid=e2.id
WHERE  e1.salary>e2.salary;
