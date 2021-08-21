/* Hard
https://leetcode.com/problems/find-the-subtasks-that-did-not-execute/
*/

/* Solution 1
recursive union all count-1
*/

WITH recursive fullist AS (
    SELECT task_id, subtasks_count AS subtask_id
    FROM Tasks
    UNION ALL
    SELECT task_id, subtask_id-1
    FROM fullist
    WHERE subtask_id>=2
)

SELECT f.*
FROM fullist f
LEFT JOIN Executed e
USING(task_id,subtask_id)
WHERE e.subtask_id IS NULL


/* Solution 2
from helenlee519
recursive union all id +1  where  id<count
*/
with recursive t as
(select task_id, 1 as subtask_id, subtasks_count
from tasks t1
union
select task_id, 1+subtask_id, subtasks_count from t where subtask_id<subtasks_count)

select t.task_id, t.subtask_id
from t
left join executed e
on t.task_id=e.task_id
and t.subtask_id=e.subtask_id
where e.subtask_id is null
