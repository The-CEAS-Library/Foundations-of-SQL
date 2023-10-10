


/*Retrieving Data with SELECT Statement*/

/* Using SELECT statement to select data from the database.Where * denotes All  */
SELECT * from station_data

/*Using LIMIT clause to view a limited number of rows*/
SELECT * from station_data LIMIT 3

/*Retrieving specific columns from the table station_data by giving their name*/
SELECT report_code, year, tornado from station_data

/* Adding a new column by modifying the existing column  */
SELECT dew_point,
station_pressure,
visibility,
wind_speed,
(temperature-32)*0.56 AS temperature_celsius
FROM station_data

/*Using the Round function here to decrease the number of decimals in the column*/
SELECT dew_point,
station_pressure,
visibility,
wind_speed,
round((temperature-32)*0.56 )AS temperature_celsius
FROM station_data

/**EXCERCISE 1**/
/**Write a SQL query to select the columns dew_point, station_pressure, visibility and create a new column that has the wind_speed in terms of meters per second upto one decimal **/

   /**Hint: wind_speed_mps = wind_speed*3.6**/






/*****Working with Dates and Times*****/


/*1. Finding the Date now*/
SELECT DATE('now')

/*2. Finding the Date yesterday*/
SELECT DATE('now', '-1 day')

/*3. Finding the Date in Past from now*/
SELECT DATE('now','+3 month', '-1 day')

/*4. Finding the Date in Past from date in past*/
SELECT DATE('2018-12-04','+3 month', '-1 day')

/*5. Finding time now in Greenwich time*/
SELECT TIME('now')

/**EXCERCISE 2**/
/**Write a SQL query to find the present date by adding your AGE in years, months, days to your birthyear **/
  /** Hint: SELECT DATE('YYYY-MM-DD','+AGE year' ,'+no.of month','+no.of day')**/





   
   
/*****Filtering Data using WHERE Statement - Numeric*****/

/*1.Using SELECT statement to view the database*/
SELECT * FROM station_data


/*2.Using WHERE clause in order to filter a record in a particular column*/
SELECT * FROM station_data
WHERE YEAR = 2010

/*3.Using WHERE clause along with 'NOT' to get data other than specific records*/
SELECT * FROM station_data
WHERE YEAR != 2010

/*4.Using WHERE clause to filter data between a range of records*/
SELECT * FROM station_data
WHERE year BETWEEN 2005 AND 2010

/*5.Using WHERE clause and less than equal signs to filter data between a range */
SELECT * FROM station_data
WHERE year >= 2005 AND year <= 2010

/*6.Using WHERE clause to select data from specific records in columns /
SELECT * FROM station_data 
WHERE MONTH = 3
OR MONTH = 6
OR MONTH = 9
OR MONTH = 12

/*7.USING IN OPERATOR*/
SELECT * from station_data
WHERE MONTH IN (3,6,9,12) 

/*8.USING NOT IN Operation*/
SELECT * from station_data
WHERE MONTH NOT IN (3,6,9,12)

/*****Filtering Data using WHERE Statement - Textual(String)*****/

/*9.Filtering Text with WHERE. Wrapping the text value with single quotes*/
SELECT * FROM station_data
WHERE report_code = '513A63'

/*10. Filtering textual data using IN operation*/
SELECT * FROM station_data
WHERE report_code IN ('513A63', '1F8A7B', 'EF616A')

/*11. Filtering data using the length function*/
SELECT * FROM station_data
WHERE length(report_code) != 6

/*12. Filtering data which starts with certain character example A. % represents any number of characters*/
SELECT * FROM station_data
WHERE report_code LIKE 'A%'

/*13. Using underscore as a placeholder for textual filtering*/
SELECT * FROM station_data
WHERE report_code LIKE 'B_C%'

/*14. Using REGEXP operation keyword for textual filtering*/
SELECT * FROM station_data
WHERE report_code REGEXP '^A.*$'  

/**EXCERCISE 3**/
/*** 3a. Write a SQL query to filter all records data between year 2009 and 2012
     3b. Write a SQL query to filter data from the month of May and October of every year
     3c. write a SQL query to filter data where every report_code starts with letter 'C' and has third letter as '9' ***/




/*****Filtering Data using WHERE Statement - Boolean*****/

/*15. Filtering for boolean values */
SELECT * FROM station_data
WHERE tornado = 1 AND hail = 1

/*16. Filtering for boolean values with keywords*/
SELECT * FROM station_data
WHERE tornado = TRUE AND hail = FALSE

/*17. Filtering for null. Nulls are empty and blank and there is no value provided*/

/*18. Filtering for null values using IS operator */
SELECT * FROM station_data
WHERE snow_depth IS NULL

/*19. Filtering for null values using IS NOT operator */
SELECT * FROM station_data
WHERE snow_depth IS NOT NULL


/*20. Filtering values for a column, NULL values are always going to qualify for False unless you explicitly handle them*/
SELECT * FROM station_data
WHERE precipitation <= 0.5


/*21. Filtering values for a column that include NULL values*/
SELECT * FROM station_data
WHERE precipitation IS NULL OR precipitation <= 0.5


/*22. Filtering values using COALESCE function that may take NULL value and turn it into a different value if it is indeed NULL. Here we pass two values in this function, One is the column name and the possible value we want the NULL values to take, incase it is NULL*/

SELECT * FROM station_data
WHERE coalesce(precipitation, 0) <=0.5 

/*23. Mixing AND and OR*/
SELECT * FROM station_data
WHERE rain = 1 AND temperature <=32
OR snow_depth > 0

SELECT * FROM station_data
WHERE (rain = 1 AND temperature <=32)
OR snow_depth > 0



/***** Using Aggregate Functions that reduce data into a single value *****/

/*24. Using COUNT function to count the number of aggregate records in the table*/
SELECT COUNT(*) AS record_count
FROM station_data

/*25. Refining the Filtering using WHERE to extract boolean records */
SELECT COUNT(*) AS record_count
FROM station_data
WHERE tornado = 1

/*26.Refining the Filtering using GROUP BY to extract count of  records by year */

SELECT year, 
COUNT(*) AS record_count

FROM station_data

WHERE tornado = 1

GROUP BY year

/*27. Refining the Filtering using GROUP BY to extract count of  records by year and month */
SELECT year,
month, 
COUNT(*) AS record_count

FROM station_data

WHERE tornado = 1

GROUP BY year, month

/*28.Refining the Filtering using GROUP BY to extract count of  records by year and month and using ORDER BY to retrieve ordered results */

SELECT year,
month, 
COUNT(*) AS record_count

FROM station_data

WHERE tornado = 1

GROUP BY year, month
ORDER BY year, month

/*29. Refining the Filtering using GROUP BY to extract count of  records by year and month and using ORDER BY to retrieve ordered results with latest results first*/

SELECT year,
month, 
COUNT(*) AS record_count

FROM station_data

WHERE tornado = 1

GROUP BY year, month
ORDER BY year DESC, month


/*30. Filtering data using AVERAGE FUNCTION and GROUP BY*/
SELECT month,
AVG(temperature) AS avg_temp
FROM station_data
WHERE year >= 2000
GROUP BY month

/*31. Filtering data using SUM aggregate function*/
SELECT year,
SUM(snow_depth) AS total_snow
FROM station_data
WHERE year>= 2005
GROUP BY year

/*32. Filtering data using SUM nd MAX aggregate function*/
SELECT year,
SUM(snow_depth) AS total_snow,
SUM(precipitation) AS total_precipitation,
MAX(precipitation) AS max_precipitation
FROM station_data
WHERE year>= 2005
GROUP BY year


/**EXCERCISE 4**/
/**Write an SQL Query to Select data yearwise and monthwise with data recorded post 2004 and ordered by latest first and giving data of the sum of windspeed, sum of visibility and maximum visibility **/







/*33. Using CASE expression to add another coulmn to the data table*/

SELECT report_code, year, month, day, wind_speed,

CASE
   WHEN wind_speed >= 40 THEN 'HIGH'
   WHEN wind_speed >= 30 THEN 'MODERATE'
   ELSE 'LOW'
END AS wind_severity

FROM station_data



/**** Reviewing the database from rexon_metals*****/
SELECT * FROM CUSTOMER


/* JOIN is used to join to two tables to create a much more descriptive view of your data.In here the parent table supplies data and child table receives data*/

/*34. Using JOIN operation*/
SELECT ORDER_ID,
CUSTOMER.CUSTOMER_ID,
ORDER_DATE,
SHIP_DATE,
NAME,
STREET_ADDRESS,
CITY,
STATE,
ZIP,
PRODUCT_ID,
ORDER_QTY

FROM CUSTOMER INNER JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID 


