/* Easy
https://leetcode.com/problems/rising-temperature/
*/

SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON w1.recorddate=w2.recorddate+INTERVAL 1 DAY
WHERE w1.temperature>w2.temperature;
