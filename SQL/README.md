-- SELECT COALESCE(salary_hour_avg, 'Not provided')
-- FROM job_postings_fact limit 10;

-- SELECT  FROM job_postings_fact;

-- SELECT * FROM company_dim;

-- SELECT * FROM skills_dim;


-- SELECT * FROM skills_job_dim;

-- Same as

-- SELECT 
	-- skills_job_dim.job_id,
    -- skills_job_dim.skill_id
-- FROM skills_job_dim;

-- LIMIT

-- SELECT * FROM job_postings_fact LIMIT 10;

-- DISTINCT - unique 
-- SELECT DISTINCT(job_title_short) FROM job_postings_fact;

-- WHERE

/* SELECT 
	job_title_short, 
    job_location, 
    job_via, 
    salary_year_avg 
FROM job_postings_fact
WHERE 
	job_title_short = 'Data Analyst' AND salary_year_avg > 90000;
*/ 

-- ORDER BY

/* SELECT 
	job_title_short, 
    job_location, 
    job_via, 
    salary_year_avg 
FROM job_postings_fact
WHERE 
	job_title_short = 'Data Analyst' AND salary_year_avg > 90000
ORDER BY salary_year_avg;
*/

-- TASK 1 Get the unique job locations in the job_postings_fact table. Order in alphabetical order.
/*
SELECT 
	DISTINCT(job_location) 
FROM job_postings_fact
ORDER BY job_location;
*/

-- TASK 2 In the job_postings_fact table get the columns job_id, job_title_short, job_location, and job_via columns. 
-- And order it in ASC order by job_location. 
/*
SELECT
	job_id,
    job_title_short,
    job_location, 
    job_via
FROM job_postings_fact
ORDER BY job_location;
*/

-- TASK 3 In the jobjob_postings_fact table get the columns job_id, job_title_short, job_location, job_via, and salary_year_avg columns. 
-- And only look at rows where job_title_short is 'Data Engineer'
/*
SELECT 
	job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Engineer';
*/ 

-- Comparisons
/* 
  Used within the WHERE or HAVING clause
  Used in conjunction with comparioson operators: 
  = <> > < >= <= 
  Used also in conjuction with logical operators:
  AND OR BETWEEN IN
 */
 
 -- <> & NOT 
/*
 SELECT * 
 FROM job_postings_fact
 -- WHERE job_via <> 'via LinkedIn';
 WHERE NOT 
 	job_via = 'via LinkedIn';
 */

/*
SELECT
 	job_id,
    job_title_short,
    job_via, 
    salary_year_avg 
FROM job_postings_fact
WHERE salary_year_avg > 50000
ORDER BY salary_year_avg;
*/ 

-- AND - only shows records where all conditions are true.
/*
SELECT *
FROM job_postings_fact
WHERE
	salary_year_avg > 100000
    AND job_title = 'Data Analyst'
ORDER BY salary_year_avg;
*/
 -- OR only shows records when any of the conditions are true

/*
SELECT *
FROM job_postings_fact
WHERE
	salary_year_avg > 100000
    OR job_title = 'Data Analyst'
ORDER BY salary_year_avg;
*/
-- BETWEEN - gets values within a given range 
-- Alternative to using AND <= and  >=

-- salary_year_Avg >= 60000 AND salary_year_avg <= 80000
/* 
WHERE
	salary_year_avg BETWEEN 60000 AND 80000;
*/
