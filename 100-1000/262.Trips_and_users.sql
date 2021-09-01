/* Hard
https://leetcode.com/problems/trips-and-users/
*/

/* Solution 1
3 Join
*/

SELECT
    t.request_at AS day,
    round(avg(if(t.status="completed",0,1)),2) AS "Cancellation Rate"
FROM Trips t
JOIN Users u1
JOIN Users u2
ON t.client_id=u1.users_id AND t.driver_id=u2.users_id
WHERE u1.banned="No" AND u2.banned="No" AND t.request_at BETWEEN "2013-10-01" AND "2013-10-03"
GROUP BY day;

/* Solution 2
in
*/
SELECT Request_at AS "Day",ROUND(1-SUM(IF(Status='completed',1,0))/COUNT(Status) ,2) AS "Cancellation Rate"
FROM Trips
WHERE Client_iD IN (SELECT Users_Id FROM Users WHERE Banned="No" AND Role='client') AND
Driver_Id IN (SELECT Users_Id FROM Users WHERE Banned="No" AND Role='driver')
GROUP BY Request_at
HAVING Request_at BETWEEN "2013-10-01" AND "2013-10-03"
