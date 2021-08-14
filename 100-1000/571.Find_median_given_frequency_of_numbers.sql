/* hard */

/* Solution 1
restore to full list (recursive)+ row_number()
*/

WITH recursive full_list AS (
    SELECT Number, Frequency
    FROM Numbers
    UNION
    SELECT Number, Frequency - 1
    FROM full_list
    WHERE Frequency >= 2
), num_order AS (
    SELECT number,
    ROW_NUMBER() OVER(ORDER BY number) AS row_num,
    count(number) OVER() as max_num
    FROM full_list
)

SELECT avg(number) AS median
FROM num_order
WHERE row_num BETWEEN max_num/2 AND max_num/2+1

/* Solution 2
from haotong
build intervals +  avg freqency between
*/

with a as (
    select number,
           sum(frequency) over (order by number) - frequency as lower_num,
           sum(frequency) over (order by number) as upper_num,
           sum(frequency) over () / 2 as medium_num
    from numbers
)

select avg(number) as median
from a
where medium_num between lower_num and upper_num
