/* Medium
https://leetcode.com/problems/get-highest-answer-rate-question/
*/

/* Solution 1
Assume that there is no tie
*/
SELECT
    question_id AS survey_log
FROM survey_log
GROUP BY question_id
ORDER BY count(answer_id)/count(distinct id)  DESC
LIMIT 1;

/* Solution 2 *
Consider scenario of a tie/
