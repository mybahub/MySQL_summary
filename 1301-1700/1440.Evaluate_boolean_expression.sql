/* Medium
https://leetcode.com/problems/evaluate-boolean-expression/
*/

/* Solution 1
if 2>1 true, return 1
*/

SELECT e.left_operand,e.operator,e.right_operand,
CASE WHEN (e.operator=">" AND v.value>v2.value) OR (e.operator="=" AND v.value=v2.value) OR (e.operator="<" AND v.value<v2.value)  THEN "true"
ELSE "false" END AS value

FROM Expressions AS e,Variables AS v,Variables AS v2
WHERE v.name=e.left_operand AND v2.name=e.right_operand
