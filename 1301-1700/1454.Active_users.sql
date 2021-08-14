/* Medium */

/* Solution 1
row_number, date_diff()
*/
WITH cat AS (
    SELECT id,
    DATE_SUB(login_date,INTERVAL ROW_NUMBER() OVER(PARTITION BY id ORDER BY login_date ASC) DAY) AS gp
FROM (
    SELECT distinct *
    FROM Logins
) temp

)

SELECT distinct c.id, a.name
FROM cat c
JOIN Accounts a
ON a.id=c.id
GROUP BY c.id,c.gp
HAVING count(1)>4
ORDER BY c.id;
