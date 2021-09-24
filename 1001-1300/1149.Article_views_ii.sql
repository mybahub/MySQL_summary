/* Medium
https://leetcode.com/problems/article-views-ii/
*/

SELECT distinct viewer_id AS id
FROM Views
GROUP BY viewer_id,view_date
HAVING count(distinct article_id )>1
ORDER BY id;
