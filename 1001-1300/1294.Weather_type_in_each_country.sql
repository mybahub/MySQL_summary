/* Easy
https://leetcode.com/problems/weather-type-in-each-country/
/*


/* Solution 1 */
SELECT
    c.country_name,
    CASE
    WHEN avg(w.weather_state)<=15 THEN "Cold"
    WHEN avg(w.weather_state)<25 THEN "Warm"
    ELSE "Hot" END AS "weather_type"
FROM Countries c
JOIN Weather w
USING(country_id)
WHERE DATE_FORMAT(w.day,"%Y-%m")='2019-11'
GROUP BY c.country_name;
