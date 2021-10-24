/* Medium
https://leetcode.com/problems/all-people-report-to-the-given-manager/
*/

/* Solution 1*/
WITH recursive summary AS(
    SELECT employee_id, manager_id
    FROM Employees
    WHERE employee_id!=manager_id AND manager_id=1
    UNION
    SELECT
        e.employee_id,
        s.manager_id
    FROM Employees e
    JOIN summary s
    ON e.manager_id=s.employee_id
)

SELECT  employee_id FROM summary
