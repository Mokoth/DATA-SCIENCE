## SQL Aggregate Functions
Calculations performed on multiple rows of a table are called  **aggregates**.

### Aggregate functions
- COUNT() - count the number of rows
- SUM() - sum of values in a column
- MAX() / MIN() - largest/smallest value
- AVG() - average values in a column
- ROUND() - round the values in the column

### COUNT
```
SELECT COUNT(*) FROM fake_apps;
```

### SUM
> Takes the name of the column as an arg, and returns the sum of all the values in that column
```
SELECT  SUM(downloads)  FROM fake_apps;
```

### MAX/MIN
```
-- MIN
SELECT  MIN(downloads)  FROM fake_apps;
-- MAX
SELECT  MAX(price)  FROM fake_apps;
```

### AVG
```
SELECT  AVG(price)  FROM fake_apps;
```

### ROUND
> Takes two args:-
- a column name
- an integer
```
-- SELECT name, ROUND(price, 0) FROM fake_apps;
SELECT  ROUND(AVG(price), 2)  FROM fake_apps;
```
