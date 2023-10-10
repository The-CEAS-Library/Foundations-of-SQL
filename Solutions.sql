Excercise 1
SELECT dew_point,
station_pressure,
visibility,
round(wind_speed*3.6) AS wind_speed_mps
FROM station_data

Excercise 2

SELECT DATE('2000-09-18','+23 year', '+22 day')

Excercise 3
a. SELECT * FROM station_data
WHERE year >= 2009 AND year <= 2012

b.SELECT * FROM station_data
WHERE MONTH IN (5,10)

c.WHERE report_code LIKE 'C__9%'

Excercise 4

SELECT year,month,
SUM(wind_speed) AS total_wind,
SUM(visibility) AS total_visibility,
MAX(visibility) AS visibility
FROM station_data
WHERE year>= 2004
GROUP BY year,month
ORDER BY year DESC,month