### GROUP BY
> Used with aggregate functions.
> Used in collaboration with `SELECT` to arrange identical data into *groups*.
> GROUP BY comes after `WHERE`, but before `ORDER BY` or `LIMIT`
```
SELECT price, COUNT(*)  FROM fake_apps

GROUP  BY price;
```
Here, aggregate function is  `COUNT()`  and I arranged  `price`  into groups.

> In the previous query, add a  `WHERE`  clause to count the total number of apps that have been downloaded more than 20,000 times, at each price.
```
SELECT price, COUNT(*)  FROM fake_apps
WHERE downloads > 20000
GROUP  BY price;
```

Write a new query that calculates the total number of downloads for each category.
Select  `category`  and  `SUM(downloads)`.
 ```
SELECT category, SUM(downloads)  FROM fake_apps
GROUP  BY category;
```
