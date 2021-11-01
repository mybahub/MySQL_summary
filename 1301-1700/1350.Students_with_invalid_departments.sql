/* Easy
https://leetcode.com/problems/students-with-invalid-departments/
*/

SELECT id,name
FROM Students
WHERE department_id NOT IN (
    SELECT id FROM Departments
);

/* Solution 2*/
SELECT
    s.id,
    s.name
FROM students s
LEFT JOIN Departments d
ON s.department_id=d.id
WHERE d.id IS NULL;
