/* easy
https://leetcode.com/problems/patients-with-a-condition
*/

/* Solution 1
regexp_like(text, pattern)
*/

SELECT *
FROM Patients
WHERE REGEXP_LIKE(conditions,'^DIAB1|\\w+\\sDIAB1')

/* Solution 2
like or like
*/

SELECT *
FROM Patients
WHERE conditions LIKE "DIAB1%" OR conditions LIKE "% DIAB1%"
