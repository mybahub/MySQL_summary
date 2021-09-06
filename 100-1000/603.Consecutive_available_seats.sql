/* Easy
https://leetcode.com/problems/consecutive-available-seats/
*/

/* Solution 1
JOIN
*/

SELECT distinct c1.seat_id
FROM cinema c1
JOIN cinema c2
ON (c1.seat_id+1=c2.seat_id) OR (c1.seat_id-1=c2.seat_id)
WHERE c1.free=1 AND c2.free=1
ORDER BY c1.seat_id;


/* Solution 2
windows function
*/

WITH flist AS (
    SELECT seat_id,
        seat_id-row_number() OVER( ORDER BY seat_id) AS diff
    FROM cinema
    WHERE free=1
), cnlist AS (
    SELECT *,
    count(1) OVER (PARTITION BY diff) AS cn
    FROM flist
)

SELECT seat_id
FROM cnlist
WHERE cn>1
