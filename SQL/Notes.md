# Take away notes - Data Analysis perspective

## Objectives
- Calc aggregates
- Combine data from multiple tables
- Create usage funnel - checkout example -> got to checkout and made payment and checkout but left unpaid
- Analyze user churn - unsubscribed members from the subscription list
- Determine web traffic attribution. utm -> from which site to our (site)

## Table/Relations
Collection of data organized into rows and columns
*Column* - a set of data values of a particular type => (id(int), name(string), age(int))
*Row* - single record in a table

All data stored in a relational database is of a certain data type
- int
- text -(text string)
- date - (yyyy-mm-dd)
- real - a decimal value

## SQL statements

CREATE TABLE tablename(column_1 data_type, column_2 data_type);

## Clauses
- CREATE
  
- INSERT INTO table_name(id, name, age)VALUES()

- SELECT 
```
SELECT name | * FROM table_name
```

- ALTER - adds a new column to a table / modify a column
```
ALTER TABLE celebs
ADD COLUMN x_handle TEXT
```

- UPDATE - make changes to a record / modify a record
```
UPDATE celebs
SET x_handle = 'ubutnut@gmail.com'
WHERE id = 4;
```

- DELETE - delete a row/record
```
DELETE FROM celebs
WHERE twitter_handle IS NULL 
```

## CONSTRAINTS
Add information about how a column can be used when invoked.
Always done after specifying the data type for a column
Constraint violation

```
CREATE TABLE celebs(
	id INTEGER PRIMARY KEY,
	name TEXT UNIQUE, (columns have different value from other rows)
	date_of_birth TEXT NOT null,
	date_of_death TEXT DEFAULT 'Not Applicable'
);
```

## Index
Index - a powerful tool used in the background of a database to speed up querying.
Pointer to data in a table.
Indexes serve as lookup tables that efficiently store data for quicker retrieval.

## Case example
```
CREATE INDEX customers_by_phone
ON customers (phone_number)
```
