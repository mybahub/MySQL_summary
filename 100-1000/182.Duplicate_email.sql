/* Easy
https://leetcode.com/problems/duplicate-emails/
*/
SELECT email
FROM person
GROUP BY email
HAVING count(1)>1;
