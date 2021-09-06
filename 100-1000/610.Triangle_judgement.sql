/* Easy
https://leetcode.com/problems/triangle-judgement/
*/

/* Solution 1
greatest
*/
SELECT*,
    IF(x+y+z>2*greatest(x,y,z),'Yes','No') AS 'triangle'
FROM triangle;
