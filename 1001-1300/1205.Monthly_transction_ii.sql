/*medium*/

/* Solution 1
FUll join= left join +right join+union
*/

WITH trans_by_month AS (
    SELECT DATE_FORMAT(trans_date,"%Y-%m") AS month,
    country,
    count(country) AS approved_count ,
    sum(amount) AS approved_amount
    FROM Transactions
    WHERE state="approved"
    GROUP BY month,country
),cb_by_month AS(
    SELECT DATE_FORMAT(c.trans_date,"%Y-%m") AS month,
    t.country,
    count(t.country) AS chargeback_count,
    sum(t.amount) AS chargeback_amount
    FROM Chargebacks c
    JOIN Transactions t
    ON t.id=c.trans_id
    GROUP BY month,t.country
)

SELECT t.month, t.country,
    t.approved_count,
    t.approved_amount,
    COALESCE(c.chargeback_count,0) AS chargeback_count,
    COALESCE(c.chargeback_amount,0) AS chargeback_amount
FROM trans_by_month t
LEFT JOIN cb_by_month c
ON t.month=c.month AND t.country=c.country

UNION

SELECT c.month, c.country,
    COALESCE(t.approved_count,0),
    COALESCE(t.approved_amount,0),
    c.chargeback_count,
    c.chargeback_amount
FROM trans_by_month t
RIGHT JOIN cb_by_month c
ON t.month=c.month AND t.country=c.country

/* Solution 2
by ZacksAmber

1. build a table containing all approved and chargeback records
2. use if function create new columns
*/

WITH CTE AS
	(
	SELECT
		id, country, state, amount,
		DATE_FORMAT(trans_date, '%Y-%m') AS month
	FROM Transactions
	WHERE state = 'approved'
	UNION
	SELECT
		c.trans_id, t.country, 'chargeback' AS state, t.amount,
		DATE_FORMAT(c.trans_date, '%Y-%m') AS month
	FROM Chargebacks c
	LEFT JOIN Transactions t ON c.trans_id = t.id
	)
# SELECT * FROM CTE;
SELECT
	month,
    country,
    SUM(IF(state='approved', 1, 0)) AS approved_count,
    SUM(IF(state='approved', amount, 0)) AS approved_amount,
    SUM(IF(state='chargeback', 1, 0)) AS chargeback_count,
    SUM(IF(state='chargeback', amount, 0)) AS chargeback_amount
FROM CTE
GROUP BY month, country
ORDER BY month, country;
