/* Medium
https://leetcode.com/problems/shortest-distance-in-a-plane/
*/

/* Solution 1
cross join
*/

SELECT min(round(sqrt(power(p1.x-p2.x,2)+power(p1.y-p2.y,2)),2)) AS shortest
FROM point_2d p1
CROSS JOIN point_2d p2
WHERE (p1.x,p1.y)!=(p2.x,p2.y)
