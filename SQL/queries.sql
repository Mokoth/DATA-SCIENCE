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
