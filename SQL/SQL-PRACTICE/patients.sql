SELECT * FROM patients;

-- Show first name, last name, and gender of patients whose gender is 'M'

SELECT
  first_name, 
  last_name, 
  gender 
FROM patients
WHERE gender = 'M';

-- Show first name and last name of patients who does not have allergies. (null)
SELECT
  first_name, 
  last_name 
FROM patients
WHERE allergies IS NULL;

-- Show first name of patients that start with the letter 'C'
SELECT 
  first_name 
FROM patients
WHERE first_name LIKE 'C%';

-- Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
SELECT 
  first_name, 
  last_name 
FROM patients
WHERE weight BETWEEN 100 AND 120;

-- OR
SELECT
  first_name,
  last_name
FROM patients
WHERE weight >= 100 AND weight <= 120;

-- Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
UPDATE patients
SET allergies = 'NKA'
WHERE allergies IS NULL;

-- CONCAT
-- Show first name and last name concatinated into one column to show their full name.
SELECT
  CONCAT(first_name, ' ', last_name) AS fullname
FROM patients;

-- OR
SELECT first_name || ' ' || last_name
FROM patients;

-- INNER JOIN
-- Show first name, last name, and the full province name of each patient.
-- Example: 'Ontario' instead of 'ON'
SELECT
  first_name,
  last_name,
  province_name
FROM patients
  JOIN province_names ON province_names.province_id = patients.province_id;

-- AGGREGATE FUNCTION
-- Show how many patients have a birth_date with 2010 as the birth year.
SELECT COUNT(*) AS total_patients
FROM patients
WHERE YEAR(birth_date) = 2010;

-- OR
SELECT COUNT(*) AS total_patients
FROM patients
WHERE birth_date LIKE '2010%';

-- OR
SELECT count(first_name) AS total_patients
FROM patients
WHERE
  birth_date >= '2010-01-01'
  AND birth_date <= '2010-12-31'

-- Show the first_name, last_name, and height of the patient with the greatest height.
SELECT
  first_name,
  last_name,
  MAX(height) AS height
FROM patients;

-- OR
SELECT
  first_name,
  last_name,
  height
FROM patients
WHERE height = (
    SELECT MAX(height)
  FROM patients
  )

-- Show all columns for patients who have one of the following patient_ids:
-- 1,45,534,879,1000
SELECT *
FROM patients
WHERE
  patient_id IN (1, 45, 534, 879, 1000);

-- DISTINCT
-- Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
SELECT DISTINCT(city) AS unique_cities
FROM patients
WHERE province_id = 'NS';

-- OR
SELECT city
FROM patients
GROUP BY city
HAVING province_id = 'NS';

-- Show unique birth years from patients and order them by ascending.
SELECT
  DISTINCT YEAR(birth_date) AS birth_year
FROM patients
ORDER BY birth_year;

-- OR
SELECT year(birth_date)
FROM patients
GROUP BY year(birth_date)

-- Show unique first names from the patients table which only occurs once in the list.
-- For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.
SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(first_name) = 1

-- OR
  
SELECT first_name
FROM (
    SELECT
      first_name,
      count(first_name) AS occurrencies
    FROM patients
    GROUP BY first_name
  )
WHERE occurrencies = 1

-- Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
SELECT patient_id, 
  first_name 
FROM patients
WHERE first_name LIKE 's%s' AND	length(first_name) >= 6;

-- OR
SELECT
  patient_id,
  first_name
FROM patients
WHERE first_name LIKE 's____%s';

-- OR
SELECT
  patient_id,
  first_name
FROM patients
where
  first_name like 's%'
  and first_name like '%s'
  and len(first_name) >= 6;

-- Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
-- Primary diagnosis is stored in the admissions table.
SELECT
  patients.patient_id,
  first_name,
  last_name
FROM patients
  JOIN admissions ON admissions.patient_id = patients.patient_id
WHERE diagnosis = 'Dementia';

-- OR
SELECT
  patient_id,
  first_name,
  last_name
FROM patients
WHERE patient_id IN (
    SELECT patient_id
    FROM admissions
    WHERE diagnosis = 'Dementia'
  );

