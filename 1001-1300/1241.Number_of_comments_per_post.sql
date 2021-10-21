/* Easy
*/

/* s1
*/

WITH cte AS(
    SELECT distinct sub_id, parent_id
    FROM Submissions
    GROUP BY 1,2
), ctable AS (
    SELECT sub_id,
    0 AS num
    FROM cte
    WHERE parent_id IS NULL
    UNION ALL
    SELECT parent_id AS sub_id,
    1 AS num
    FROM cte
    WHERE parent_id IS NOT NULL
)

SELECT sub_id AS post_id,
sum(num) AS number_of_comments
FROM ctable
WHERE sub_id IN
(SELECT distinct sub_id FROM Submissions WHERE parent_id IS NULL)
GROUP BY sub_id
ORDER BY 1;

/* S2 by wolfgang_amadeus
*/
select distinct p.sub_id post_id,
(select count(distinct sub_id) from Submissions where parent_id = p.sub_id)
number_of_comments from Submissions p
where p.parent_id is null
order by post_id
