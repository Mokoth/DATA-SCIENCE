-- Changing a column's data type
-- CAST/CONVERT

-- CAST(column_name AS integer) and 
-- column_name::integer produce the same result.

SELECT
  CAST(funding_total_usd AS varchar) AS funding_total_usd_string,
  founded_at_clean::varchar AS founded_as_string
FROM crunchbase_companies_clean_date
