/* Easy
https://leetcode.com/problems/game-play-analysis-i/
*/

SELECT
    player_id,
    min(event_date) AS first_login
FROM Activity
GROUP BY player_id
ORDER BY 1;
