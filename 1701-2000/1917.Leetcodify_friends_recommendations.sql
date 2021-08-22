/* Hard
https://leetcode.com/problems/leetcodify-friends-recommendations/
*/

/* Solution 1
UNION ALL + left JOIN to filter
*/

WITH flist AS (
    SELECT user1_id AS user_id, user2_id AS friend_id FROM Friendship
    UNION ALL
    SELECT user2_id AS user_id, user1_id AS friend_id FROM Friendship
), same_songs AS(
    SELECT
        l1.user_id,
        l1.song_id,
        l1.day,
        l2.user_id AS recommended_id
    FROM Listens l1
    JOIN Listens l2
    ON l1.song_id=l2.song_id AND l1.day=l2.day AND l1.user_id !=l2.user_id
    LEFT JOIN flist f
    ON l1.user_id=f.user_id AND l2.user_id=f.friend_id
    WHERE f.friend_id IS NULL
)

SELECT distinct user_id, recommended_id
FROM same_songs
GROUP BY day,user_id,recommended_id
HAVING count(distinct song_id)>2

/* Solution 2
from nikamir
where not exist + union 
*/
WITH
allRecs AS (
SELECT DISTINCT
  l1.user_id AS user1_id,
  l2.user_id AS user2_id
FROM Listens l1 INNER JOIN Listens l2 ON l1.song_id = l2.song_id AND l1.day=l2.day AND l1.user_id < l2.user_id
WHERE NOT EXISTS(SELECT * FROM Friendship f WHERE l1.user_id = f.user1_id AND l2.user_id = f.user2_id)
GROUP BY l1.user_id, l2.user_id, l1.day
HAVING COUNT(DISTINCT l1.song_id) >= 3
)
SELECT user1_id AS user_id,
       user2_id AS recommended_id
FROM allRecs
UNION
SELECT user2_id AS user_id,
       user1_id AS recommended_id
FROM allRecs
