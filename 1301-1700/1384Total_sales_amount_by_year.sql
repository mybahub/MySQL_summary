/*hard
1.how to break one record into several records
2. cut off the datetimes
*/

/* 1. Recursive
by Melinalaimon */
WITH RECURSIVE CTE AS(
    SELECT product_id,
        period_start,
        period_end,
        average_daily_sales,
        LEAST(period_end,DATE_FORMAT(period_start,"%Y-12-31")) AS current_end,
        DATEDIFF(LEAST(period_end,DATE_FORMAT(period_start,"%Y-12-31")),period_start)+1 AS day_num

    FROM Sales
    UNION ALL
    SELECT product_id,
        DATE_ADD(current_end,INTERVAL 1 DAY) As period_start,
        period_end,
        average_daily_sales,
        LEAST(period_end,DATE_ADD(current_end,INTERVAL 1 YEAR)) AS current_end,
        DATEDIFF(
            LEAST(period_end,DATE_ADD(current_end,INTERVAL 1 YEAR)) ,
            DATE_ADD(current_end,INTERVAL 1 DAY))+1 AS day_num
    FROM CTE
    WHERE period_end>current_end

)

SELECT c.product_id,
    p.product_name,
    DATE_FORMAT(c.current_end,"%Y") AS report_year,
    c.day_num*c.average_daily_sales AS total_amount
FROM CTE c JOIN Product p USING(product_id)
ORDER BY c.product_id, report_year
