/* Medium
https://www.hackerrank.com/challenges/occupations/problem
*/

/* Solution 1
rank+if+max()
*/

SELECT
max(IF (occupation="Doctor",name,null)) AS "Doctor",
max(IF (occupation="Professor",name,null)) AS "Professor",
max(IF (occupation="Singer",name,null)) AS "Singer",
max(IF (occupation="Actor",name,null)) AS "Actor"
FROM (SELECT *,row_number() OVER(PARTITION BY occupation ORDER BY name) AS rn FROM OCCUPATIONS ORDER BY name) t
GROUP BY rn
