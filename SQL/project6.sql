/*
TASK 4 In the job_postings_fact table only gets jobs that have an average yearly salary greater than $55000. 
Also get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns
*/

SELECT 
	job_id,
    	job_title_short,
    	job_location,
	job_via,
	salary_year_avg
FROM 
	job_postings_fact
WHERE 
	salary_year_avg > 55000;  

/*
TASK 5 In the jobjob_postings_fact table only gets jobs that have an average yearly salary less than $110000. 
Also return the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. 
*/

SELECT 
	job_id,
    	job_title_short,
    	job_location,
    	job_via,
    	salary_year_avg
FROM 
	job_postings_fact
WHERE 
	salary_year_avg < 110000; 

/*
TASK 6 In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. 
Only return 'Full-Time' jobs. (hint: look at the job_schedule_type column
*/

SELECT
	job_id,
    	job_title_short,
    	job_location,
    	job_via,
    	salary_year_avg
FROM 
	job_postings_fact
WHERE 
	job_schedule_type = 'Full-time';

/*
TASK 7 In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. 
Only return rows where the job location is in 'Tampa, FL'
*/

SELECT
	job_id,
    	job_title_short,
    	job_location,
    	job_via,
    	salary_year_avg
FROM 
	job_postings_fact
WHERE 
	job_location IN ('Tampa', 'FL');

/*
TASK 8 - In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. 
Only look at the jobs that are not 'Part-time' jobs.
*/

SELECT
	job_id,
    	job_title_short,
    	job_location,
    	job_via,
    	salary_year_avg
FROM 
	job_postings_fact
WHERE 
	job_schedule_type <> 'Part-time';

/*
TASK 9 - In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. 
Only look at the jobs that are not posted 'via LinkedIn'.
*/

SELECT
	job_id,
    	job_title_short,
    	job_location,
    	job_via,
    	salary_year_avg
FROM 
	job_postings_fact
WHERE NOT job_via == 'via LinkedIn';

/*
TASK 10 - Get job details for both 'Data Analyst' or 'Business Analyst' positions
	For 'Data Analyst' I want jobs only > $100k 
    For 'Business Analyst', I only want jobs > $70k 
Only include jobs located either: 
	'Boston, MA'
    'Anywhere' (i.e, remote jobs) 
*/ 

SELECT 
	job_title_short, 
	job_location,
  	salary_year_avg
FROM 
	job_postings_fact
WHERE 
	(
    	job_title_short = 'Data Analyst' AND salary_year_avg > 100000
    	OR
    	job_title_short = 'Business Analyst' AND salary_year_avg > 70000
  	)
  	AND 
    	job_location IN ('Boston, MA', 'Anywhere');
