/* Medium
https://leetcode.com/problems/strong-friendship/
*/

/* Solution 1
union + where exists
*/

WITH flist AS(
    SELECT user1_id, user2_id FROM Friendship
    UNION
    SELECT user2_id AS user1_id, user1_id AS user2_id FROM Friendship
)

SELECT f1.user1_id, f1.user2_id, count(distinct f2.user2_id) AS common_friend
FROM flist f1
JOIN flist f2
ON f1.user2_id=f2.user1_id AND f1.user1_id<f1.user2_id
WHERE EXISTS (SELECT * FROM flist WHERE user1_id=f1.user1_id AND user2_id=f2.user2_id)
GROUP BY 1,2
HAVING count(distinct f2.user2_id)>2
