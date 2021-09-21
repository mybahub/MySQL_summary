/*medium
https://leetcode.com/problems/highest-grade-for-each-student/
*/

/* Solution 1
window function
*/

WITH summary AS (
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS crank
    FROM Enrollments
)

SELECT student_id,
    course_id,
    grade
FROM summary
WHERE crank=1
ORDER BY student_id


/* Solution 2
*/

WITH summary AS(
    SELECT student_id, max(grade) as grade
    FROM Enrollments
    GROUP BY student_id
)

SELECT
    s.student_id,
    min(e.course_id) as course_id,
    min(s.grade) AS grade
FROM summary s
JOIN Enrollments e
USING(student_id,grade)
GROUP BY s.student_id
ORDER BY s.student_id
