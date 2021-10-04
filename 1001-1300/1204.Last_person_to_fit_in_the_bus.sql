/* Medium
https://leetcode.com/problems/last-person-to-fit-in-the-bus/
*/


WITH summary AS (
    SELECT
        person_name,
        sum(weight) OVER (ORDER BY turn) AS cum_sum
    FROM Queue
    ORDER BY turn DESC
)

SELECT person_name
FROM summary
WHERE cum_sum<=1000
LIMIT 1;
