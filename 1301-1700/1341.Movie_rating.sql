/* Medium
https://leetcode.com/problems/movie-rating/
*/

WITH outcome AS (
    (SELECT u.name AS results, count(1) AS num
FROM Users u
JOIN Movie_Rating m
USING(user_id)
GROUP BY u.name
ORDER BY num DESC, u.name
LIMIT 1)

UNION

(SELECT m1.title AS results,
avg(m2.rating) AS num
FROM Movies m1
JOIN Movie_Rating m2
USING(movie_id)
WHERE DATE_FORMAT(created_at,"%Y-%m")="2020-02"
GROUP BY m1.title
ORDER BY num DESC, m1.title
LIMIT 1)

)

SELECT results FROM outcome;
