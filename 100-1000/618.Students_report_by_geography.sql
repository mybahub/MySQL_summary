/*hard*/

/* Solution 1
using row_number + group by to transform one column to many (pivot)
*/

WITH temp AS(
    SELECT row_number() OVER(PARTITION BY continent ORDER BY name) AS row_num,
(CASE WHEN continent="America" THEN name END) as America,
(CASE WHEN continent="Asia" THEN name END) as Asia,
(CASE WHEN continent="Europe" THEN name END) as Europe
FROM student
)

SELECT min(America) AS America, min(Asia) AS Asia,min(Europe) AS Europe
FROM temp
GROUP BY row_num;
