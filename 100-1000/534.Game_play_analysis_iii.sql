/* Medium
https://leetcode.com/problems/game-play-analysis-iii/
*/

SELECT
    player_id,
    event_date,
    sum(games_played) OVER(PARTITION BY player_id ORDER BY event_date) AS games_played_so_far
FROM Activity



/* Solution 2
from zhihui329
self join + group by
*/

select
	now.player_id,
	now.event_date,
	sum(prevs.games_played) as games_played_so_far
from activity now
join activity prevs
on now.player_id = prevs.player_id
and now.event_date >=prevs.event_date # find all previous dates before and on current date
group by 1,2
