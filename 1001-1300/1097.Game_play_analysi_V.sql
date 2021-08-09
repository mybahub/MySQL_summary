/* hard */

/* Solution 1 join with DATE_SUB */

WITH freq_summary AS (
    SELECT a.player_id, a.event_date, b.games_played
    FROM Activity a
    JOIN  Activity b
    WHERE a.player_id=b.player_id AND a.event_date=DATE_SUB(b.event_date, INTERVAL 1 DAY)
), install_summary AS(
    SELECT player_id, min(event_date) AS install_dt
    FROM Activity
    GROUP BY player_id
)


SELECT i.install_dt,
count(i.player_id) AS installs,
round(count(f.games_played)/count(i.player_id),2) AS Day1_retention
FROM install_summary i
LEFT JOIN freq_summary f
ON i.player_id=f.player_id AND i.install_dt=f.event_date
GROUP BY i.install_dt
