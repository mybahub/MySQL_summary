/* Medium
*/

/*S1: by definition
*/
WITH cte AS (
    SELECT *,
    CASE WHEN
    id IN (SELECT distinct p_id FROM tree)  THEN "Yes"
    ELSE "No" END AS status
    FROM tree
)

SELECT id,
CASE
WHEN p_id IS NULL THEN "Root"
WHEN status="Yes" THEN "Inner"
ELSE "Leaf" END AS Type
FROM cte
ORDER BY id
