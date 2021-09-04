/* Medium
https://leetcode.com/problems/investments-in-2016/
*/

/* Solution 1*/

WITH cri_tiv AS(
    SELECT tiv_2015
    FROM insurance
    GROUP BY tiv_2015
    HAVING count(1)>1
), cri_loc AS(
    SELECT lat,lon
    FROM insurance
    GROUP BY lat,lon
    HAVING count(1)=1
)

SELECT round(sum(TIV_2016),2) AS TIV_2016
FROM insurance
WHERE tiv_2015 IN (SELECT * FROM cri_tiv) AND (lat,lon) IN (SELECT * FROM cri_loc);


/* Solution 2*/

SELECT round(sum(tiv_2016),2) AS tiv_2016
FROM
(
    SELECT *,
        count(*) OVER(PARTITION BY tiv_2015) AS cri_tiv,
        count(*) OVER(PARTITION BY lat, lon) AS cri_loc
    FROM insurance
) AS t
WHERE cri_tiv >1 AND cri_loc =1;
