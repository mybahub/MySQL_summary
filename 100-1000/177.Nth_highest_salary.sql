/* Medium
https://leetcode.com/problems/nth-highest-salary/
*/

/* Solution 1 */

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
        WITH srank AS (
            SELECT distinct salary,
                dense_rank() OVER(ORDER BY salary DESC) AS rn
            FROM Employee
        )
        SELECT salary
        FROM srank
        WHERE rn=N
  );
END

/* Solution 2*/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M=N-1;
  RETURN (
      # Write your MySQL query statement below.
     SELECT distinct salary
      FROM Employee
      ORDER BY salary DESC
      LIMIT M,1

  );
END
