/* Medium
https://leetcode.com/problems/suspicious-bank-accounts/
*/


WITH income AS (
    SELECT t.account_id,
    DATE_FORMAT(t.day,"%Y-%m-01") AS month,
    IF (sum(t.amount)-max(max_income)>0,1,0) AS susp
    FROM Transactions t
    JOIN Accounts a
    USING (account_id)
    WHERE t.type="Creditor"
    GROUP BY t.account_id,month

)
/* Solution 1
join
*/

SELECT distinct i1.account_id
FROM income i1
JOIN income i2
ON i1.month=DATE_ADD(i2.month,INTERVAL 1 MONTH) AND i1.account_id=i2.account_id
WHERE i1.susp=1 AND i2.susp=1
ORDER BY i1.account_id;

/* Solution 2
recursive
*/
SELECT distinct account_id
FROM(
    SELECT
        account_id,
        month-ROW_NUMBER() OVER(PARTITION BY account_id ORDER BY month) AS diff
    FROM income
    WHERE susp=1
)t

GROUP BY account_id,diff
HAVING count(diff)>1
ORDER BY 1;
