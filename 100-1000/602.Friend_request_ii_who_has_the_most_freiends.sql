/* Medium */
/*
Solution 1
Merge columns by union all
*/

WITH temp AS (
    SELECT requester_id AS id
    FROM request_accepted
    UNION ALL
    SELECT accepter_id AS id
    FROM request_accepted
)

SELECT id, count(id) AS num
FROM temp
GROUP BY id
ORDER BY count(id) DESC
LIMIT 1;
