/*medium
*/

/* 1. window function
*/

WITH cte AS (
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS crank
    FROM Enrollments
)

SELECT student_id,
    course_id,
    grade
FROM cte
WHERE crank=1
ORDER BY student_id
