/* Medium
https://leetcode.com/problems/leetflex-banned-accounts/
*/

/* Solution 1
join +where + list conditions
*/
SELECT distinct l1.account_id
FROM LogInfo l1
JOIN LogInfo l2
WHERE l1.account_id=l2.account_id AND l1.ip_address!=l2.ip_address AND (
     (l1.login BETWEEN l2.login AND l2.logout) OR
     (l1.logout BETWEEN l2.login AND l2.logout) OR
     (l1.login>l2.login AND l1.logout<l2.logout) OR
    (l1.login<l2.login AND l1.login >l2.logout)
)


/* Solution 2
from yongjip
simplify
*/
select a.account_id
from loginfo as a
join loginfo as b
    on a.account_id = b.account_id
    and a.ip_address != b.ip_address
    and a.login between b.login and b.logout
group by 1
