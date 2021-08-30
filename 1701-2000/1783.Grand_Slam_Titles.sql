/*Medium
1783. Grand Slam Titles
Combine columns
*/

/*1. use union all to stack columns */
WITH summary AS (
    SELECT Wimbledon AS player_id
    FROM Championships
    UNION ALL
    SELECT Fr_open AS player_id
    FROM Championships
    UNION ALL
    SELECT US_open AS player_id
    FROM Championships
    UNION ALL
    SELECT Au_open AS player_id
    FROM Championships
)


SELECT s.player_id, p.player_name, count(s.player_id) AS grand_slams_count
FROM summary s
JOIN Players p USING (player_id)
GROUP BY s.player_id;
