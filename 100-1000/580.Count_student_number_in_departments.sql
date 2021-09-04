/* Medium
https://leetcode.com/problems/count-student-number-in-departments/
*/

SELECT d.dept_name, count(s.student_id) AS student_number
FROM department d
LEFT JOIN student s
USING(dept_id)
GROUP BY d.dept_name
ORDER BY student_number DESC
