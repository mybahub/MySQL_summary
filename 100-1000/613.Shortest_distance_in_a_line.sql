/* Easy
https://leetcode.com/problems/shortest-distance-in-a-line/
*/

/*Solutio 1
join
*/

SELECT min(abs(p1.x-p2.x)) AS shortest
FROM point p1
CROSS JOIN point p2
WHERE p1.x!=p2.x;


/* Solution 2*/
WITH pair AS (
    SELECT
        x,
        lag(x) OVER (ORDER BY x) AS y
    FROM point
)

SELECT min(abs(y-x)) AS shortest
FROM pair
WHERE y IS NOT NULL;
