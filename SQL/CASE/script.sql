-- Two new leadership positions have been created at Superstore: Territory Supervisors, who each oversee two regions. Territory 1 consists of the Central and South regions, whereas Territory 2 is made up of the West and East regions. The new Territory Supervisors have requested sales information about their areas.

-- Write a query that includes order_id, state, sales, and a new column named territory.
-- For territory, use a CASE expression to categorize the 'Central' and 'South' regions from region as 'Territory 1' and the remaining regions as 'Territory 2'.

SELECT 
    order_id, 
    state, 
    sales,
    -- region,
    CASE
        WHEN region IN ('Central', 'South') THEN 'Territory 1'
    ELSE 'Territory 2' -- WHEN region IN ('West', 'East') THEN 'Territory 2'
    END AS 'territory'
FROM orders;

 -- Binning Continuous Variables With CASE

-- Your supervisor wants a way to see sales categorized into groups.

-- Return order_id, product_id, sales, and a binned column sales_size from orders that meets the following rules:
-- If the sale is between 0 and 49.99, it's a 'small sale.'
-- If it's between 50 and 99.99, it's a 'medium sale.'
-- If it's 100 or greater, it's a 'large sale.'

SELECT
    order_id,
    product_id,
    sales,
    CASE
        WHEN sales BETWEEN 0 AND 49.99 THEN 'small sale'
        WHEN sales BETWEEN 50 AND 99.99 THEN 'medium sale'
        ELSE 'large sale'
    END AS 'sales_size'
FROM orders;


-- Superstore wants to improve the efficiency of their shipping process. You've been asked to help with this by writing a query that creates a shipping prioritization field.

-- Write a query that includes order_date, order_id, ship_mode, and a grouped field aliased as ship_priority.
-- Assign shipping priority based on ship mode:
-- If ship_mode is 'Same Day', assign 'High Priority.'
-- If ship_mode is 'First Class', assign 'Medium Priority.'
-- Everything else should be assigned 'Low Priority.'
-- Order your results to show the most recent orders first.

SELECT
    order_date,
    order_id,
    ship_mode,
    
    CASE
        WHEN ship_mode = 'Same Day' THEN 'High Priority'
        WHEN ship_mode = 'First Class' THEN 'Medium Priority'
        ELSE 'Low Priority'
    END AS 'ship_priority'
FROM orders
ORDER BY order_date DESC;
