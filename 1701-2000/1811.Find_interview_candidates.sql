/* Medium */

/* Solution 1
row_number - value + group by to get consecutive info
*/
WITH c2 AS (
    SELECT gold_medal AS user_id,
    count(gold_medal) AS gold_num
    FROM Contests
    GROUP BY gold_medal
    HAVING gold_num>2
), c1_prep AS(
    SELECT user_id,contest_id-ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY contest_id ASC ) AS gp
    FROM
    (SELECT gold_medal AS user_id, contest_id FROM Contests
    UNION
    SELECT silver_medal AS user_id, contest_id FROM Contests
    UNION
    SELECT bronze_medal AS user_id, contest_id FROM Contests
     ) temp
), c1 AS(

    SELECT distinct user_id
    FROM
    (
    SELECT user_id, gp, count(gp) as num
    FROM c1_prep
    GROUP BY user_id,gp
    HAVING num >2
    ) temp1

)

SELECT mail,name
FROM Users
WHERE user_id in (SELECT user_id FROM c1 ) OR user_id in (SELECT user_id FROM c2 )
