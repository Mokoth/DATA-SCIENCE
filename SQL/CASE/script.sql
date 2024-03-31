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

-- The manager of Superstore Los Angeles is concerned about the Supplies subcategory because of low performance. They want you to provide data that groups profit margin (profit/sales) into "Great" and "Terrible," and they don't care about the labels in between.

-- Write a query that includes order_id, product_name, a new field called profit_margin calculated by profit/sales, and a CASE expression aliased as profit_category.
-- Your CASE expression should create the following groups:
-- If profit margin is greater than 0.3, assign the result as 'Great'.
-- If profit margin is less than 0.1, assign the result 'Terrible'.
-- The remaining values should not be assigned a result (but should still appear in the query's output).
-- Make sure your results only include the 'Supplies' subcategory for the city of 'Los Angeles.'
-- Order your results by profit_category in descending order.

SELECT 
    order_id,
    product_name,
    profit/sales AS profit_margin,
    
    CASE
        WHEN profit/sales > 0.3 THEN 'Great'
        WHEN profit/sales < 0.1 THEN 'Terrible'
        -- ELSE 'None'
    END AS profit_category
FROM orders
WHERE subcategory = 'Supplies' AND city = 'Los Angeles'
ORDER BY profit_category DESC;


-- The manager of Superstore Watertown in New York noticed that the Corporate segment is the most profitable, followed by the Consumer segment. They want you to write a query with the most profitable segments on top so they can learn more about the products these segments purchase.

-- Write a query that includes:
-- segment
-- subcategory
-- product_name
-- sales
-- profit
-- Limit your results to just the city of Watertown. (There is only one city in the database with this name.)
-- Order your results so that the Corporate segment appears first, then the Consumer segment, followed by any remaining segments.

SELECT
    segment,
    subcategory,
    product_name,
    sales,
    profit
FROM orders
WHERE city = 'Watertown'
ORDER BY
    CASE
        WHEN segment = 'Corporate' THEN 1
        WHEN segment = 'Consumer' THEN 2
        ELSE 3
    END;
