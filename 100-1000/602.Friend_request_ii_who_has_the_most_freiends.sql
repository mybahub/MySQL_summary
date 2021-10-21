/* Medium
https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
*/
/*
Solution 1
Merge columns by union all
*/

WITH flist AS (
    SELECT requester_id AS id
    FROM request_accepted
    UNION ALL
    SELECT accepter_id AS id
    FROM request_accepted
)

SELECT id, count(id) AS num
FROM flist
GROUP BY id
ORDER BY num DESC
LIMIT 1;
