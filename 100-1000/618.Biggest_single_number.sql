/* Easy
https://leetcode.com/problems/biggest-single-number/
*/

SELECT max(
    (SELECT num
    FROM my_numbers
    GROUP BY num
    HAVING count(num)=1
    ORDER BY num DESC
    LIMIT 1)
) as num
