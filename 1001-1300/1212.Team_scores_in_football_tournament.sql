/* Medium
https://leetcode.com/problems/team-scores-in-football-tournament/
*/


/* Solution 1 */
WITH summary AS(
    SELECT
        host_team AS team_id,
        CASE
        WHEN host_goals>guest_goals THEN 3
        WHEN host_goals=guest_goals THEN 1
        ELSE 0 END AS points
    FROM Matches
    UNION ALL
    SELECT
        guest_team AS team_id,
        CASE
        WHEN host_goals<guest_goals THEN 3
        WHEN host_goals=guest_goals THEN 1
        ELSE 0 END AS points
    FROM Matches
)

SELECT
    t.team_id,
    t.team_name,
    IFNULL(sum(points),0) AS num_points
FROM Teams t
LEFT JOIN summary s
USING (team_id)
GROUP BY t.team_id
ORDER BY num_points DESC,t.team_id;


/* Solution 2*/
SELECT
    t.team_id,
    t.team_name,
    IFNULL(sum(
        CASE
        WHEN t.team_id=m.host_team AND host_goals>guest_goals THEN 3
        WHEN t.team_id=m.guest_team AND host_goals<guest_goals THEN 3
        WHEN host_goals=guest_goals THEN 1
        ELSE 0 END
    ) ,0) AS num_points
FROM Teams t
LEFT JOIN Matches m
ON t.team_id=m.host_team OR t.team_id=m.guest_team
GROUP BY t.team_id
ORDER BY num_points DESC,t.team_id;
