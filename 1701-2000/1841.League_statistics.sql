/* Medium*/

/* Solution 1
change column postion with AS + union all record + group by to combine rows
*/
WITH stat AS (
    SELECT home_team_id AS team_id,
        home_team_goals AS goal_for,
        CASE
    WHEN home_team_goals>away_team_goals THEN 3
    WHEN home_team_goals=away_team_goals THEN 1
    ELSE 0 END AS points,
        away_team_goals AS goal_against,
        home_team_goals-away_team_goals AS goal_diff
    FROM Matches

    UNION ALL

    SELECT away_team_id AS team_id,
        away_team_goals AS goal_for,
        CASE
    WHEN away_team_goals>home_team_goals THEN 3
    WHEN away_team_goals=home_team_goals THEN 1
    ELSE 0 END AS points,
        home_team_goals AS goal_against,
        away_team_goals-home_team_goals AS goal_diff
    FROM Matches
)

SELECT t.team_name,
    count(points) AS matches_played,
    sum(points) AS points,
    sum(goal_for) AS goal_for,
    sum(goal_against) AS goal_against,
    sum(goal_diff) AS goal_diff
FROM stat s
