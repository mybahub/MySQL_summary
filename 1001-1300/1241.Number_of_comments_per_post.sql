/* Easy
https://leetcode.com/problems/number-of-comments-per-post/
*/

/* s1
*/

SELECT
    s1.sub_id AS post_id,
    count(distinct s2.sub_id) AS number_of_comments
FROM Submissions s1
LEFT JOIN Submissions s2
ON s1.sub_id=s2.parent_id
WHERE s1.parent_id IS NULL
GROUP BY post_id
ORDER BY post_id;

/* S2 by wolfgang_amadeus
*/
select distinct p.sub_id post_id,
(select count(distinct sub_id) from Submissions where parent_id = p.sub_id)
number_of_comments from Submissions p
where p.parent_id is null
order by post_id
