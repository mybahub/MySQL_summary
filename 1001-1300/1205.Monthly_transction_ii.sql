/*medium*/

/* Solution 1
FUll join= left join +right join+union
*/

WITH trans_summary AS (
    SELECT
        DATE_FORMAT(trans_date,'%Y-%m') AS month,
        country,
        count(id) AS approved_count,
        sum(amount) AS approved_amount
    FROM Transactions
    WHERE state='approved'
    GROUP BY 1,2
), cb_summary AS(
    SELECT
        DATE_FORMAT(c.trans_date,'%Y-%m') AS month,
        t.country,
        count(c.trans_id) AS chargeback_count,
        sum(t.amount) AS chargeback_amount
    FROM Transactions t
    JOIN Chargebacks c
    ON t.id=c.trans_id
    GROUP BY 1,2
)

SELECT
    t.month,
    t.country,
    t.approved_count,
    t.approved_amount,
    IFNULL(c.chargeback_count,0) AS chargeback_count,
    IFNULL(c.chargeback_amount,0) AS chargeback_amount
FROM trans_summary t
LEFT JOIN cb_summary c
USING(month,country)
UNION
SELECT
    c.month,
    c.country,
    IFNULL(t.approved_count,0) AS approved_count,
    IFNULL(t.approved_amount,0) AS approved_amount,
    c.chargeback_count,
    c.chargeback_amount
FROM cb_summary c
LEFT JOIN trans_summary t
USING(month,country)

/* Solution 2
by ZacksAmber

1. build a table containing all approved and chargeback records
2. use if function create new columns
*/

WITH summary AS (
    SELECT
        id,
        country,
        state,
        amount,
        trans_date
    FROM Transactions
    WHERE state='approved'
    UNION
    SELECT
        c.trans_id AS id,
        t.country,
        'chargeback' AS state,
        t.amount,
        c.trans_date
    FROM Chargebacks c
    LEFT JOIN Transactions t
    ON t.id=c.trans_id
)

SELECT
    DATE_FORMAT(trans_date,'%Y-%m') AS month,
    country,
    sum(IF(state='approved',1,0)) AS approved_count,
    sum(IF(state='approved',amount,0)) AS approved_amount,
    sum(IF(state='chargeback',1,0)) AS chargeback_count,
    sum(IF(state='chargeback',amount,0)) AS chargeback_amount

FROM summary
GROUP BY 1,2;
