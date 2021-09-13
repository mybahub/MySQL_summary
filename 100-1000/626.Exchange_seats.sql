/* Medium
https://leetcode.com/problems/exchange-seats/
*/


/* Solution 1
id-1, row_number()
*/

SELECT row_number() over(ORDER BY id) AS id, student
FROM (
    SELECT if( id % 2 =0,id-1,id+1) AS id, student
    FROM seat
    ORDER BY id
) t


/* Solution 2
*/
SELECT
if(id < (SELECT count(1) FROM seat), if(id % 2=0, id-1, id+1), if(id %2 =0,id-1,id)) as id, student
FROM seat
ORDER BY id;
