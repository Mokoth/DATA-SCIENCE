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

-- Concatenating Fields - using column || ' ' || column
SELECT city || ", " || state AS "location"
  FROM orders;

-- Write a query that includes order_id, region, and state.
-- Create a new column called local_store that concatenates the word "Superstore" with city.
SELECT
    order_id,
    region,
    state,
    "Superstore" || " " || city AS 'local_store'
FROM orders
LIMIT 10;

-- -- Constant Values

-- Sometimes we'll want to add a column to our query that shows a constant number for every record. 
--   We can do this by specifying the number in the SELECT clause and adding an alias for readability (note that the alias isn't required):
SELECT sales, 2 AS promotional_discount
  FROM orders;

-- You've been asked to create a table that shows the salary for all the regional managers.
-- Write a query from managers that includes all fields.
-- Create a new column with the manager salary amount: $51,000. Alias it as salary.

SELECT 
    person,
    region,
    51000 AS 'salary'
FROM managers;

-- Create a field called address that combines city, state, and postal_code in the following format:

-- city, state 99999
SELECT
    city || "," || state || " " || postal_code AS address
FROM orders;

-- Create a field called tax that finds 7% of sales, rounded to the nearest cent.
SELECT
    ROUND(sales * .07, 2) AS tax
FROM orders;

-- Create a field called shipping_cost with a value of 4.99.
SELECT
    4.99 AS 'shipping_cost'
FROM orders;

/*
Create a field called total_cost that adds the values from sales, shipping_cost, and tax together, rounded to the nearest cent.
For readability, your final query should include the following fields:
address
sales
tax
shipping_cost
total_cost
Limit your results to 10 rows.
*/

SELECT
    city || ", " || state || " " || postal_code AS address,
    sales,
    ROUND(sales * .07, 2) AS tax,
    4.99 AS 'shipping_cost',
    -- sales + shipping_cost + tax AS 'total_cost'
    ROUND((sales * .07) + 4.99 + sales, 2) AS total_cost
FROM orders
LIMIT 10;

-- Write a query that includes order_id, subcategory, product_name, and a calculated field aliased price_per_unit.
-- Filter your query so you only see records with a price_per_unit less than $0.50.
SELECT
    order_id,
    subcategory,
    product_name,
    sales/quantity AS 'price_per_unit' -- sales/quantity = price_per_unit
FROM orders
WHERE sales/quantity < 0.50;

-- Checking for Membership in a Non-Consecutive Range IN
SELECT order_id, category, subcategory,
       product_name, sales, discount
  FROM orders
 WHERE discount IN (0.15, 0.32, 0.45);

/*
Write a query that includes order_id, product_name, sales, and quantity from the orders table.
Include only the following sales amounts:
3
14
15
*/

SELECT
    order_id,
    product_name,
    sales,
    quantity
FROM orders
WHERE sales IN(3, 14, 15);

-- Checking for Missing Values = NULL values
-- used with IS or IS NOT
NB - COALESCE
SELECT order_id, postal_code
  FROM orders
 WHERE postal_code IS NULL;

/*
Write a query that identifies all missing values from the segment field.
Include all fields.
After you run your query, write an inline comment with any trends in the missing data.
*/
SELECT *
    FROM orders
WHERE segment IS NULL; -- NULL values from customer_name = Nat Gilpin

/*
Write a query to select at least product_name and a calculated field aliased as price_per_unit that divides sales by quantity.
Only select records in 'Storage' where the price per unit is more than $300.
*/
SELECT
    product_name,
    sales/quantity AS price_per_unit
FROM orders
WHERE subcategory = 'Storage' 
    AND sales/quantity > 300;

-- OR
/*
Write a query that includes at least product_name, profit, and quantity.
Include a filter for profits lower than -$100 or quantities of 1.
*/
SELECT
    product_name,
    profit,
    quantity
FROM orders
WHERE profit < -100 OR quantity = 1;
