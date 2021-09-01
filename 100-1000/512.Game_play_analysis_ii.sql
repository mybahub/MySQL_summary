/* easy
https://leetcode.com/problems/game-play-analysis-ii/
*/

/* Solution 1 */
WITH drank AS(
    SELECT
        player_id,
        device_id,
        event_date,
        ROW_NUMBER() OVER( PARTITION BY player_id ORDER BY event_date) AS d_rn
    FROM Activity
)

SELECT
    player_id,
    device_id
FROM drank
WHERE d_rn=1


/* Solution 2 */

WITH flog AS(
    SELECT
        player_id,
        min(event_date) AS event_date
    FROM Activity
    GROUP BY 1
)

SELECT
    a.player_id,
    a.device_id
FROM Activity a
JOIN flog f
ON a.player_id=f.player_id AND a.event_date=f.event_date
