### HAVING
> Filter groups, not rows. 
> Used to limit the results of a query based on an aggregate property.
`HAVING`  statement always comes after  `GROUP BY`, but before `ORDER BY`  and `LIMIT`

```
SELECT year, 
	genre,
	COUNT(name)
FROM movies
GROUP BY 1, 2
HAVING COUNT(name) > 10;
```

Add a  `HAVING`  clause to restrict the query to price points that have more than 10 apps.
  
```
SELECT price,
ROUND(AVG(downloads)),
COUNT(*)
FROM fake_apps
GROUP  BY price
HAVING  COUNT(downloads) > 10;
```
