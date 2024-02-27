RPA Customer Segmentation
The marketing department of Reputable Product Agency (RPA) is looking to segment the company users by a number of different criteria.

In this context, a segment is a subset of users that meet different conditions. Segments are used to send marketing campaigns to users who meet specific criteria or to measure the performance of specific marketing campaigns.

Use SQL queries to generate user lists for the marketing department.


-- 1
-- What are the column names?

SELECT * FROM users;
LIMIT 20;
 
-- 2
-- Find the email addresses and birthdays of users whose 
-- birthday is between 1980-01-01 and 1989-12-31.

SELECT email, birthday FROM users
WHERE birthday BETWEEN '1980-01-01' AND '1989-12-31';
   
-- -- 3
-- We are interested in the group of users that signed up prior to May 2017.
-- Find the emails and creation date of users whose created_at date matches this condition.

SELECT email, created_at FROM users
WHERE created_at < '2017-05-01'
LIMIT 10;

-- 4
-- There was an A/B test performed on users that used cute animal clipart to encourage users to sign up. We’d like to see how the group that was shown ‘bears’ is performing.
-- Find the emails of the users who received the ‘bears’ test.

SELECT email, test FROM users
WHERE test = 'bears';

-- -- 5
-- A total of 4 advertising campaigns were run over this period.

-- There were two sets of ad copy (set 1 and set 2) and both were run on two search engine sites (AAA and BBB).

-- The resulting campaign values are:

-- AAA-1
-- AAA-2
-- BBB-1
-- BBB-2
-- Find all the emails of all users who received a campaign on website BBB.

SELECT email, campaign
FROM users
WHERE campaign LIKE 'BBB%';

-- 6
-- Find all the emails of all users who received ad copy 2 in their campaign.

SELECT email, campaign
FROM users
WHERE campaign LIKE '%-2';

-- 7
-- Find the emails for all users who received both a campaign and a test. 
-- These users will have non-empty entries in the 
-- campaign and test columns.

SELECT * FROM users
-- WHERE campaign IN ('AAA-1', 'AAA-2', 'BBB-1', 'BBB-2') AND test NOT NULL;
WHERE campaign NOT NULL AND test NOT NULL;


-- 8
-- Challenge
-- One of the members of the marketing team had an idea of calculating
-- how old users were when they signed up.

hint
-- SET age = DATE_FORMAT(FROM_DAYS(DATEDIFF(created_at, date_of_birth)), '%Y') + 0;
