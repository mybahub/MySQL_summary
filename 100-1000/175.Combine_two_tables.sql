/* Easy
https://leetcode.com/problems/combine-two-tables/
*/

SELECT
    p.firstname,
    p.lastname,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
USING(personid);
