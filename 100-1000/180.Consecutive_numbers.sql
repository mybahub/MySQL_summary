/* Medium
https://leetcode.com/problems/consecutive-numbers/
*/

/* Solution 1
*/
SELECT distinct l1.num AS ConsecutiveNums
FROM Logs l1, Logs l2, Logs l3
WHERE l1.id+1=l2.id AND l1.id+2=l3.id AND l1.num=l2.num AND l2.num=l3.num;


/* Solution 2
lead
*/

SELECT distinct num AS ConsecutiveNums
FROM (
    SELECT
        num,
        lead(num) OVER(ORDER BY id) as l2,
        lead(num,2) OVER(ORDER BY id) as l3
    FROM Logs
) t
WHERE num= l2 AND num= l3;
