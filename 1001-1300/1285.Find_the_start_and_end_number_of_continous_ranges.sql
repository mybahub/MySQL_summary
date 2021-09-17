/* Medium
https://leetcode.com/problems/find-the-start-and-end-number-of-continuous-ranges/
*/

/* Solution 1 */
WITH summary AS (
    SELECT
        log_id,
        log_id-row_number() OVER(ORDER BY log_id)  AS grp
    FROM Logs
)


SELECT
    min(log_id) AS start_id,
    max(log_id) AS end_id
FROM summary
GROUP BY grp;

/* Solution 2
from xwang139
*/

select min(log_id) as start_id, max(log_id) as end_id
from(
	select *, (@id:=@id+1) as id
	from logs, (select @id:= 0) as init
) tmp
group by log_id - id
