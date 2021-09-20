/* hard
https://leetcode.com/problems/game-play-analysis-v/
*/


/* Solution1
join with DATE_SUB/-INTERVAL 1 DAY
*/
WITH summary AS(
    SELECT
        player_id,
        min(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)

SELECT
    s.first_date AS install_dt,
    count(s.player_id) AS installs,
    round(avg(if(a.event_date IS NULL,0,1)),2) AS Day1_retention
FROM summary s
LEFT JOIN Activity a
ON s.player_id=a.player_id AND s.first_date=a.event_date- INTERVAL 1 DAY
GROUP BY s.first_date

/* Solution 2
window functions
*/

WITH summary AS(
    SELECT
        player_id,
        event_date,
        row_number() OVER(PARTITION BY player_id ORDER BY event_date) AS rn
    FROM Activity
)

SELECT
    s1.event_date AS install_dt,
    count(s1.player_id) AS installs,
    round(avg(if(s2.event_date-s1.event_date=1,1,0)),2) AS Day1_retention
FROM summary s1
LEFT JOIN summary s2
ON s1.player_id=s2.player_id AND s1.rn=s2.rn-1
WHERE s1.rn=1
GROUP BY install_dt
