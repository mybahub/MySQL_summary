/* Hard
https://leetcode.com/problems/find-cumulative-salary-of-an-employee/
*/

/* Solution 1
sum window function
*/

WITH summary AS(
    SELECT
        id,
        month,
        sum(salary) OVER (PARTITION BY id ORDER BY month RANGE BETWEEN 2 PRECEDING AND CURRENT ROW) AS total,
        max(month) OVER (PARTITION BY id) AS max_month
    FROM Employee
)

SELECT
    id,
    month,
    total AS salary
FROM summary
WHERE month!=max_month AND total!=0
ORDER BY id,month DESC;


/* Solution 2
join
*/
SELECT a.id, a.month, sum(b.salary) as salary
FROM Employee a
JOIN Employee b
ON  a.id = b.id
AND (b.month BETWEEN (a.month-2) AND a.month)
WHERE a.month!=(SELECT max(month) FROM Employee WHERE id=a.id)
GROUP BY a.id, a.month
ORDER BY id, A.month DESC;
