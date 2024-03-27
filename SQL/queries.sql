-- QUERIES

1-- SELECT

SELECT column_name FROM table_name
  SELECT name FROM movies
SELECT all columns FROM table_name
  SELECT * FROM movies;

2-- AS 
Rename a table_column as an ALIAS
  
SELECT column_name AS 'rename'
FROM table_name
  SELECT name AS 'Title'
  FROM movies;

3-- DISTINCT
Return unique values in the output/filter out all duplicate values in the specified columns

SELECT DISTINCT column_name
FROM table_name

4-- WHERE 
Filter the result you need from the column/s specified.
  Can be filtered with comparison operators [ - > < >= <= = !=]
  or by just using a column_name with a string search

SELECT * FROM movies
WHERE name = 'In the jungle'

SELECT name FROM movies
WHERE imdb_rating > 5;

-- retrieve all the recent movies, specifically those that were released after 2014.
SELECT * FROM movies
WHERE year > 2014;

5-- LIKE
To compare similar values. used with the WHERE clause to search for a specific pattern in a column.
  SELECT * from movies
  WHERE name LIKE 'Se_en';

N/B - 'Se_en' -> wildcard => _ means you can substitute any character in the search.

-- Operating on Numeric Columns - Calculated fields
  
SELECT
    order_id,
    sales,
    profit,
    profit/sales AS 'profit_margin'
FROM orders
LIMIT 8;

-- Integer Division
-- Performing a regular division - we can use the CAST function, like so: CAST(column/value AS new_datatype).  
SELECT 
    CAST(4 AS REAL)/3 AS fort;

-- Write a query that includes:
-- product_id
-- quantity
-- a calculated field that divides quantity by 2 (remember to CAST your integer to a real number)
-- Alias the calculated field as even_or_odd
-- Limit your results to 5 rows
SELECT 
    product_id,
    quantity,
    CAST(quantity AS REAL)/2 AS even_or_odd
FROM orders
LIMIT 5;

-- -- Functions on Fields: ROUND()
ROUND(value, decimal_places)

-- Write a query from the orders table that includes order_id, sales, and quantity.
-- Create a field price_per_unit that divides sales by quantity.
-- Round price_per_unit to the nearest cent.

SELECT
    order_id,
    sales,
    quantity,
    ROUND(sales/quantity, 2) AS 'price_per_unit'
FROM orders
LIMIT 10;

SELECT 
  order_id, 
  ROUND(sales, 2) AS rounded_sales, 
  ROUND(sales * .07, 2) AS rounded_sales_tax
FROM orders;

-- Functions on Fields: UPPER() and LOWER()
SELECT ship_mode AS original_ship_mode,
       UPPER(ship_mode) AS SHIP_MODE
  FROM orders;

-- Write a query that converts customer_name from the orders table to all lowercase letters.
SELECT
    LOWER(customer_name) AS 'customer_name_lower'
FROM orders;
