/* Hard
https://leetcode.com/problems/page-recommendations-ii/
*/

/* Solution 1
UNION ALL +left join to filter
*/
WITH flist AS (
    SELECT
        user1_id AS user_id, user2_id AS friend_id
    FROM Friendship
    UNION ALL
    SELECT
        user2_id AS user_id, user1_id AS friend_id
    FROM Friendship
)

SELECT f.user_id,l1.page_id,
    count(f.friend_id) AS friends_likes
FROM flist f
JOIN Likes l1
ON f.friend_id=l1.user_id
LEFT JOIN Likes l2
ON f.user_id=l2.user_id AND l1.page_id =l2.page_id
WHERE l2.page_id IS NULL
GROUP BY 1,2
ORDER BY 1,2
