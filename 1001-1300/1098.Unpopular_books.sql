/* Medium
https://leetcode.com/problems/unpopular-books/
*/

/* Solution 1
Not in
*/
SELECT book_id, name
FROM Books
WHERE available_from <=DATE_SUB("2019-06-23", INTERVAL 1 MONTH) AND book_id NOT IN
(
    SELECT book_id
    FROM Orders
    WHERE dispatch_date BETWEEN DATE_SUB("2019-06-23", INTERVAL 1 YEAR) AND "2019-06-23"
    GROUP BY book_id
    HAVING sum(quantity)>=10
)


/* Solution 2

left join+ filter in ON
*/

SELECT
    b.book_id,
    b.name
FROM Books b
LEFT JOIN Orders o
USING(book_id)
WHERE b.available_from<=DATE_SUB('2019-06-23',INTERVAL 1 MONTH )
GROUP BY b.book_id
HAVING sum(if(o.dispatch_date>DATE_SUB('2019-06-23', INTERVAL 1 YEAR),o.quantity,0))<10;

/* Solution 3
left join+ if/case when
*/
SELECT B.book_id, B.name

FROM Books B
LEFT JOIN Orders O
USING(book_id)
WHERE available_from <= DATE_SUB('2019-06-23', INTERVAL 1 MONTH)
GROUP BY B.book_id
HAVING SUM(CASE WHEN O.dispatch_date >= DATE_SUB('2019-06-23', INTERVAL 1 YEAR) THEN O.quantity ELSE 0 END) < 10
