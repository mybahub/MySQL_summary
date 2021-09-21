/* Medium
https://leetcode.com/problems/active-businesses/
*/

/* Solution 1
*/

WITH summary AS(
    SELECT
        business_id,
        occurences,
        avg(occurences) OVER(PARTITION BY event_type) AS occu_avg
    FROM Events
)

SELECT business_id
FROM summary
GROUP BY business_id
HAVING sum(if(occurences>occu_avg,1,0))>1;


/* Solution 2
*/
WITH summary AS(
    SELECT
        business_id,
        occurences,
        event_type,
        avg(occurences) OVER(PARTITION BY event_type) AS occu_avg
    FROM Events
)

SELECT business_id
FROM summary
WHERE occurences>occu_avg
GROUP BY business_id
HAVING count(event_type)>1;

/* Soltuion 3
*/
WITH avg_summary AS (
    SELECT
        event_type,
        avg(occurences) AS occu_avg
    FROM Events
    GROUP BY event_type
)


SELECT
    e.business_id
FROM avg_summary a
JOIN Events e
ON e.event_type=a.event_type AND e.occurences>a.occu_avg
GROUP BY e.business_id
HAVING count(1)>1;
