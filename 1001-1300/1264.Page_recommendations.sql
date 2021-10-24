/* Medium
https://leetcode.com/problems/page-recommendations/
*/


/* Solution 1 */

SELECT
    distinct l.page_id AS recommended_page
FROM (
    SELECT
        *
    FROM Friendship
    UNION ALL
    SELECT
        user2_id AS user1_id,
        user1_id AS user2_id
    FROM Friendship) f
JOIN Likes l
ON f.user2_id=l.user_id
WHERE f.user1_id=1 AND l.page_id NOT IN (SELECT page_id FROM Likes WHERE user_id=1)
