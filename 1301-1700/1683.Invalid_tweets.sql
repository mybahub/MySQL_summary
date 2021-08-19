/* Easy
https://leetcode.com/problems/invalid-tweets/
*/

/* Solution 1
https://stackoverflow.com/questions/1734334/mysql-length-vs-char-length
LENGTH() returns the length of the string measured in bytes.
CHAR_LENGTH() returns the length of the string measured in characters.
*/

SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) >15
