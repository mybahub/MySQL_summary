/* easy
https://leetcode.com/problems/ads-performance/
*/



/* Solution 1*/

SELECT
    ad_id,
    ifnull(round(sum(if(action="Clicked",1,0))/ sum(if(action="Clicked" or action="Viewed",1,0))*100,2),0) AS ctr
FROM Ads
GROUP BY ad_id
ORDER BY ctr DESC, ad_id


/* Solution 2
if function break one column to many
*/
WITH action_dum AS (
    SELECT ad_id,user_id,
    IF(action="Clicked",1,0) AS click,
    IF(action="Viewed",1,0) AS viewed,
    IF(action="Ignored",1,0) AS ignored
    FROM ads
)

SELECT ad_id,
    IF(sum(click+viewed)=0,0,round(sum(click)/sum(click+viewed)*100,2)) AS ctr
FROM action_dum
GROUP BY ad_id
ORDER BY ctr DESC, ad_id ASC;
