/* Easy
https://leetcode.com/problems/friend-requests-i-overall-acceptance-rate/
*/

/* Solution 1
plain way
*/

With sent AS (
    SELECT distinct sender_id,send_to_id
    FROM FriendRequest

), receive AS (
    SELECT distinct requester_id, accepter_id
    FROM RequestAccepted
)

SELECT round(ifnull((SELECT count(requester_id) FROM receive)/count(sender_id),0),2) AS accept_rate
FROM sent;


/* Solution 2
concat
*/
SELECT round(ifnull(
(
    SELECT
        count(distinct(concat(requester_id,accepter_id)))
    FROM RequestAccepted
)/ count(distinct(concat(sender_id,send_to_id)))
              ,0),2) as accept_rate
FROM FriendRequest
