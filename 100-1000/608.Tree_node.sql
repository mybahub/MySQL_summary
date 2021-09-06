/* Medium
https://leetcode.com/problems/tree-node/
*/

/* Solution 1
in
*/
SELECT id,
    CASE 
    WHEN p_id IS NULL THEN "Root"
    WHEN id IN (SELECT p_id FROM tree) THEN "Inner"
    ELSE "Leaf" END AS Type
FROM tree
ORDER BY id


/*Solution 1
join
*/

SELECT
    distinct t1.id,
    CASE
    WHEN t1.p_id IS NULL THEN 'Root'
    WHEN t2.id IS NULL THEN 'Leaf'
    ELSE 'Inner' END AS 'Type'
FROM tree t1
LEFT JOIN tree t2
ON t1.id=t2.p_id
ORDER BY t1.id;
