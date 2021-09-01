/* Medium 550. Game Play Analysis IV
https://leetcode.com/problems/median-employee-salary
*/


/*
1. combine with condition
*/

WITH first_day AS(
    SELECT
        player_id,
        min(event_date) AS flog
    FROM Activity
    GROUP BY 1
), second_day AS(
    SELECT distinct f.player_id
    FROM first_day f
    JOIN Activity a
    ON f.flog+ INTERVAL 1 DAY =a.event_date AND f.player_id=a.player_id
)


SELECT round(count(player_id)/(SELECT count(player_id) FROM first_day),2) AS fraction
FROM second_day;
