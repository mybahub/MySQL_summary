/* Medium
https://leetcode.com/problems/running-total-for-different-genders/
*/

/* Solution 1
sum+ wf order by
*/
SELECT
    gender,
    day,
    sum(score_points) OVER(PARTITION BY gender ORDER BY day) as "total"
FROM Scores
GROUP BY 1,2
ORDER BY 1,2


/* Solution 2
from Slayerrevenge
select filter in subquery
*/

Select gender, day, (select sum(score_points) from Scores t where s.gender = t.gender and s.day>=t.day) as total
from Scores s
order by gender,day
