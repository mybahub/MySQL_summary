/* hard
*/

/* Solution 1
create a full list with union
*/

WITH fullList AS(
    SELECT distinct spend_date, "mobile" AS platform FROM Spending
    UNION
    SELECT distinct spend_date, "desktop" AS platform FROM Spending
    UNION
    SELECT distinct spend_date, "both" AS platform FROM Spending
), b AS (
    SELECT user_id, spend_date,
    IF(count(platform)>1,"both", platform) AS platform,
    sum(amount) AS total_amount
    FROM Spending
    GROUP BY user_id,spend_date
)

SELECT f.*,
COALESCE(t.total_amount,0) AS total_amount,
COALESCE(t.total_users,0) AS total_users
FROM fullList f
LEFT JOIN (
    SELECT spend_date,platform,sum(total_amount) AS total_amount,
    count(user_id) AS total_users
    FROM b
    GROUP BY spend_date,platform
) t
ON f.spend_date=t.spend_date AND f.platform=t.platform
