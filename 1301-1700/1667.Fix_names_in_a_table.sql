/* Easy
https://leetcode.com/problems/fix-names-in-a-table/
*/

/* Solution 1
left + right
*/

SELECT user_id,
concat(upper(left(name,1)),lower(right(name,length(name)-1))) AS name
FROM Users
ORDER BY 1
