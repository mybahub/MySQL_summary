/* hard */

/* Solution 1 CTE */
/* Recursive to build a list */

WITH RECURSIVE trans_summary AS (
    SELECT user_id,transaction_date, count(amount) as num
    FROM Transactions
    GROUP BY user_id,transaction_date
), visit_trans AS (
    SELECT v.visit_date, COALESCE (t.num,0) as transactions_count
    FROM Visits v
    LEFT JOIN trans_summary t
    ON v.visit_date = t.transaction_date AND v.user_id = t.user_id
) ,structure AS
(SELECT
0 as transactions_count
UNION ALL
SELECT transactions_count +1
FROM structure
WHERE transactions_count < (select max(transactions_count) from visit_trans)
)


SELECT s.transactions_count, IFNULL(v.visits_count,0) AS visits_count
FROM structure s
LEFT JOIN
(SELECT transactions_count, count(visit_date) AS visits_count
FROM visit_trans
GROUP BY transactions_count) AS v
USING(transactions_count);
