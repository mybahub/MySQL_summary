/* Medium
https://leetcode.com/problems/count-salary-categories/
*/

/* Solution 1
union all to create a full list + left join
*/
SELECT l.category, COALESCE(t.accounts_count,0) AS accounts_count
FROM (
    SELECT "Low Salary" AS category
    UNION ALL
    SELECT "Average Salary" AS category
    UNION ALL
    SELECT "High Salary" AS category
) l

LEFT JOIN

(SELECT
CASE
WHEN income<20000 THEN "Low Salary"
WHEN income<=50000 THEN "Average Salary"
ELSE "High Salary" END AS category,
count(account_id) AS accounts_count
FROM Accounts
GROUP BY category) t
USING (category)

/* Solution 2
union all +ifnull()
*/

SELECT "Low Salary" AS category, IFNULL(count(account_id),0) AS accounts_count FROM Accounts WHERE income<20000
UNION ALL
SELECT "Average Salary" AS category, IFNULL(count(account_id),0) AS accounts_count FROM Accounts WHERE income>=20000 AND income<=50000
UNION ALL
SELECT "High Salary" AS category, IFNULL(count(account_id),0) AS accounts_count FROM Accounts WHERE income>50000
