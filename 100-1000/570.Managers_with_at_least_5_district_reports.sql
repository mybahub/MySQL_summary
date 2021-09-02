/* Medium
https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
*/

SELECT e1.name
FROM Employee e1
JOIN Employee e2
ON e1.id=e2.managerid
GROUP BY e1.name
HAVING count(1)>4;
