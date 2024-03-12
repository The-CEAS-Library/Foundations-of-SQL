


/*Retrieving Data with SELECT Statement*/

/* Using SELECT statement to select data from the database.Where * denotes All  */
SELECT * from CUSTOMER

/*Using LIMIT clause to view a limited number of rows*/
SELECT * from CUSTOMER LIMIT 3

/*Retrieving specific columns from the table CUSTOMER by giving their name*/
SELECT CUSTOMER_ID, NAME from CUSTOMER

/*Exploring a different table in the database */
SELECT * from PRODUCT

/* Adding a new column by modifying the existing column  */
SELECT PRODUCT_ID,
DESCRIPTION,
PRICE,
PRICE * 1.25 AS TAXED_PRICE
FROM PRODUCT

/*Using the Round function here to decrease the number of decimals in the column*/
SELECT PRODUCT_ID,
DESCRIPTION,
PRICE,
round(PRICE * 1.25) AS TAXED_PRICE
FROM PRODUCT

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

/*6. Finding time difference*/
SELECT '16:30' - '08:30'

/* JOIN is used to join to two tables to create a much more descriptive view of your data.In here the parent table supplies data and child table receives data*/

/*1. Using JOIN operation*/
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

