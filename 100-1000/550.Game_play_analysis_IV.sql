/* Medium 550. Game Play Analysis IV
https://leetcode.com/problems/median-employee-salary
*/


/*
1. combine with condition
*/

WITH total_players AS(
    SELECT count(distinct player_id) as num
    FROM Activity
), target_players AS (
    SELECT a.player_id
    FROM Activity a
    JOIN
    (SELECT player_id, min(event_date) AS first_log
     FROM Activity
     GROUP BY player_id
    ) b
    ON a.player_id=b.player_id
    WHERE a.event_date=b.first_log+INTERVAL 1 DAY
)

SELECT round(count(distinct player_id) / (SELECT num FROM total_players),2) AS fraction

FROM target_players;
