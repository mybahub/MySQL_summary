/* Hard
https://leetcode.com/problems/leetcodify-similar-friends/
*/

/* Solution 1
union + join to filter
*/

WITH f AS(
    SELECT user1_id AS user_id, user2_id AS friend_id FROM Friendship
    UNION ALL
    SELECT user2_id AS user_id, user1_id AS friend_id FROM Friendship
), same_songs AS(
    SELECT l1.user_id,
        l1.song_id,
        l1.day,
        l2.user_id AS friend_id
    FROM Listens l1
    JOIN LIstens l2
    ON l1.song_id=l2.song_id AND l1.day=l2.day
    JOIN f
    ON l1.user_id=f.user_id AND l2.user_id=f.friend_id
)

SELECT distinct user_id AS user1_id,
friend_id AS user2_id
FROM same_songs
WHERE user_id<friend_id
GROUP BY day, user_id,friend_id
HAVING count(distinct song_id)>2

/* Solution 2
simplified version of solution 1
*/
SELECT distinct l1.user_id AS user1_id, l2.user_id AS user2_id
FROM Listens l1
JOIN Listens l2
ON l1.song_id=l2.song_id AND l1.day=l2.day AND l1.user_id<l2.user_id
JOIN Friendship f
ON l1.user_id=f.user1_id AND l2.user_id=f.user2_id
GROUP BY l1.day,l1.user_id,l2.user_id
HAVING count(distinct l1.song_id)>2;


/* Solution 3
JOIN + exists
*/
SELECT distinct l1.user_id AS user1_id,l2.user_id AS user2_id
FROM Listens l1
JOIN Listens l2
ON l1.song_id=l2.song_id AND l1.day=l2.day AND l1.user_id<l2.user_id
WHERE EXISTS (SELECT * FROM Friendship WHERE l1.user_id=user1_id AND l2.user_id=user2_id)
GROUP BY l1.day,l1.user_id,l2.user_id
HAVING count(distinct l1.song_id)>2
