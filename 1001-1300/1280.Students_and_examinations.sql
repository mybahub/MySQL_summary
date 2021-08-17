/* Easy
https://leetcode.com/problems/students-and-examinations/
*/

/* Solution 1
use cross join to create a full list, then left join
*/
WITH fullList AS(
    SELECT *
    FROM Students
    CROSS JOIN Subjects
), ecount AS(
    SELECT *, count(1) AS attended_exams
    FROM Examinations
    GROUP BY student_id,subject_name
)

SELECT f.student_id,f.student_name,f.subject_name,
IFNULL(e.attended_exams,0) AS attended_exams
FROM fullList f
LEFT JOIN ecount e
ON f.student_id=e.student_id AND f.subject_name=e.subject_name
ORDER BY f.student_id,f.subject_name

/* Solution 2
from isaacwu15
A clear version of Solution 1
*/
SELECT s1.student_id,
       s1.student_name,
       s2.subject_name,
       COUNT(e.subject_name) AS attended_exams
FROM students s1
CROSS JOIN subjects s2
LEFT JOIN examinations e
ON s1.student_id = e.student_id
    AND s2.subject_name = e.subject_name
GROUP BY s1.student_id, s2.subject_name
ORDER BY s1.student_id
