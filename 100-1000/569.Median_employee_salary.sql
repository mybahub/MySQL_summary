/* Hard
https://leetcode.com/problems/median-employee-salary/
*/

/* Solution 1
*/
WITH slist AS(
    SELECT
        id,
        company,
        salary,
        ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary,id) AS rn,
        count(id) OVER( PARTITION BY company) as maxNum
    FROM Employee
)

SELECT
    id,
    company,
    salary
FROM slist
WHERE rn BETWEEN maxNum/2 AND maxNUM/2+1
ORDER BY id;

/* Solution 2
desc, asc, where
*/

WITH cte AS(
SELECT
    Id,
    Company,
    Salary,
    ROW_NUMBER() OVER(PARTITION BY Company ORDER BY Salary, Id) AS a_rank,
    ROW_NUMBER() OVER(PARTITION BY Company ORDER BY Salary DESC, Id DESC) AS d_rank
FROM Employee
)

SELECT Id, Company, Salary
FROM cte
WHERE a_rank = d_rank + 1 OR a_rank = d_rank - 1 OR a_rank = d_rank
ORDER BY Company, Salary
