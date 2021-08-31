/* Medium
https://leetcode.com/problems/rank-scores/
*/

SELECT
    score,
    dense_rank() OVER(ORDER BY score DESC) AS 'Rank'
FROM Scores
ORDER BY 'Rank';
