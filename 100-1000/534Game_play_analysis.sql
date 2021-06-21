/*Medium
*/

/*Solution 1 Windows function
*/
SELECT player_id,
event_date,
sum(games_played) OVER(PARTITION BY player_id ORDER BY event_date ASC) AS games_played_so_far
FROM Activity
ORDER BY 1,2
