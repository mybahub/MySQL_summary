/* Easy
https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/
*/


SELECT actor_id, director_id
FROM ActorDirector
GROUP BY 1,2
HAVING count(1)>2
