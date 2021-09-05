/* hard
https://leetcode.com/problems/human-traffic-of-stadium/
*/

/* Solution 1
id-row_number()
*/
WITH summary AS(
    SELECT *,
        id-row_number() OVER (ORDER BY id) as diff
    FROM Stadium
    WHERE people>99
), freq AS (
    SELECT *,
      count(1) OVER (PARTITION BY diff) as freq
    FROM summary
)

SELECT id,visit_date,people
FROM freq
where freq>2
ORDER BY visit_date;


/* Solution 2
join
*/

SELECT distinct s1.*
FROM Stadium s1,Stadium s2,Stadium s3
WHERE s1.people>99 AND s2.people>99 AND s3.people>99
AND (
(s1.id+1=s2.id AND s1.id+2=s3.id)
    OR (s1.id-1=s2.id AND s1.id+1=s3.id)
    OR (s1.id-2=s2.id AND s1.id-1=s3.id )
)
ORDER BY s1.visit_date;
