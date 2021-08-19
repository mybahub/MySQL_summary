/* hard
https://leetcode.com/problems/hopper-company-queries-ii/
*/

/* Solution 1
recurisve+ select create cumsum full list
*/

WITH recursive fullList AS(

    SELECT "2020-01-01" AS dt, (SELECT count(driver_id) FROM Drivers WHERE join_date<=last_day("2020-01-01")) AS num
    UNION ALL
    SELECT DATE_ADD(dt,INTERVAL 1 MONTH) ,
    (SELECT count(driver_id) FROM Drivers WHERE join_date<DATE_ADD(dt,INTERVAL 2 MONTH)) AS num
    FROM fullList
    WHERE DATE_ADD(dt,INTERVAL 1 MONTH)<"2021-01-01"

),act_dri AS(
    SELECT month(r.requested_at) AS dt,
    count(distinct a.driver_id) AS actnum
    FROM Rides r
    JOIN AcceptedRides a
    USING(ride_id)
    WHERE year(r.requested_at)=2020
    GROUP BY month(r.requested_at)
)


SELECT  month(f.dt) AS month,
COALESCE(round(a.actnum/f.num*100,2),0) AS working_percentage
FROM fullList f
LEFT JOIN act_dri a
ON month(f.dt)=a.dt
ORDER BY f.dt

/* Solution 2
from shaotingliu007
case when < 2020 1 else month(join_date) end as month
*/
# generate 1-12 month
with recursive CTE1 as
(
    select 1 as month
        union all
    select 1 + month
    from CTE1
    where 1 + month <= 12
),

# generate active drivers
CTE2 as
(
    select driver_id,
           case when year(join_date) < 2020 then 1
                 else month(join_date) end as month
    from Drivers
    where year(join_date) <= 2020
),

CTE3 as
(
    select CTE1.month,
           count(CTE2.driver_id) over (order by CTE1.month) as active_drivers
    from CTE1 left outer join CTE2
    on CTE1.month = CTE2.month
),

# generate accepted rides
CTE4 as
(
    select month(R.requested_at) as month,
           A.driver_id
    from Rides as R, AcceptedRIdes as A
    where R.ride_id = A.ride_id
      and year(R.requested_at) = 2020
),

CTE5 as
(
    select CTE1.month,
           count(distinct CTE4.driver_id) as accepted_rides
    from CTE1 left outer join CTE4
    on CTE1.month = CTE4.month
    group by CTE1.month
)
select distinct CTE3.month,
       round(coalesce(100*CTE5.accepted_rides / CTE3.active_drivers,0),2) as working_percentage
from CTE5, CTE3
where CTE5.month = CTE3.month
