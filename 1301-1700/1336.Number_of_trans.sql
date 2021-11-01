/* hard
https://leetcode.com/problems/number-of-transactions-per-visit/
*/

/* Solution 1 CTE */
/* Recursive to build a list */

WITH recursive trans_summary AS (
    SELECT
        v.user_id,
        v.visit_date,
        ifnull(count(amount),0) AS transactions_count
    FROM Visits v
    LEFT JOIN Transactions t
    ON v.user_id=t.user_id AND v.visit_date=t.transaction_date
    GROUP BY 1,2
), full_list AS(
    SELECT 0 AS transactions_count
    UNION ALL
    SELECT transactions_count+1 AS transactions_count
    FROM full_list
    WHERE transactions_count< (SELECT max(transactions_count) FROM trans_summary)
)

SELECT
    f.transactions_count,
    count(user_id) AS visits_count
FROM full_list f
LEFT JOIN trans_summary t
ON f.transactions_count=t.transactions_count
GROUP BY 1
ORDER BY 1
