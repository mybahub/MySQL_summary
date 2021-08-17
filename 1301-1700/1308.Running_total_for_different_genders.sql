/* Medium
https://leetcode.com/problems/running-total-for-different-genders/
*/

/* Solution 1
sum+ wf order by
*/
SELECT gender, day, sum(score) OVER(PARTITION BY gender ORDER BY day) AS total
FROM (
    SELECT gender, day,
sum(score_points) AS score
FROM Scores
GROUP BY day,gender
ORDER BY gender, day
) t


/* Solution 2
from Slayerrevenge
select filter in subquery
*/

Select gender, day, (select sum(score_points) from Scores t where s.gender = t.gender and s.day>=t.day) as total
from Scores s
order by gender,day
