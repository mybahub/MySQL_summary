/* hard
*/

/* Solution 1
create a full list with union
*/

WITH flist AS(
    SELECT distinct spend_date,'desktop' AS platform FROM Spending
    UNION
    SELECT distinct spend_date,'mobile' AS platform FROM Spending
    UNION
    SELECT distinct spend_date,'both' AS platform FROM Spending
), summary AS(
    SELECT
        user_id,
        spend_date,
        if(count(platform)>1,'both', platform) AS platform,
        if(count(platform)>1,sum(amount),avg(amount)) AS total_amount
    from Spending
    GROUP BY 1,2
)

SELECT
    f.spend_date,
    f.platform,
    sum(IFNULL(s.total_amount,0)) AS total_amount,
    count(s.user_id) AS total_users
FROM flist f
LEFT JOIN summary s
USING(spend_date,platform)
GROUP BY 1,2
