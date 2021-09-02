/* Medium
https://leetcode.com/problems/winning-candidate/
*/

/* Solution 1 */
SELECT c.name
FROM
(
    SELECT CandidateId as id, count(1) AS num
    FROM Vote
    GROUP BY CandidateId
    ORDER BY num DESC
    LIMIT 1
) t
JOIN Candidate c
USING (id)

/* Solution 2*/

SELECT c.name
FROM Candidate c
JOIN Vote v
ON c.id = v.candidateid
GROUP By v.candidateid
ORDER BY count(v.candidateID) DESC
LIMIT 1
