-- Key business questions

-- 1. Which companies have the most job postings?
SELECT company_name, COUNT(*) AS job_postings
FROM job_postings
GROUP BY company_name
ORDER BY job_postings DESC
LIMIT 10;

-- 2. Which single-city locations appear most frequently?
SELECT primary_location, COUNT(*) AS postings
FROM job_postings
GROUP BY primary_location
ORDER BY postings DESC
LIMIT 10;

-- 3. What experience range is most commonly required?
SELECT experience_required, COUNT(*) AS postings
FROM job_postings
GROUP BY experience_required
ORDER BY postings DESC
LIMIT 10;

-- 4. Which job titles are most frequently listed?
SELECT job_title, COUNT(*) AS postings
FROM job_postings
GROUP BY job_title
ORDER BY postings DESC
LIMIT 10;

-- 5. How many postings were made recently (last 7 days) vs older?
SELECT
    CASE
        WHEN post_time LIKE '%Day%' AND CAST(SUBSTRING_INDEX(post_time, ' ', 1) AS UNSIGNED) <= 7 THEN 'Last 7 Days'
        ELSE 'Older'
    END AS recency,
    COUNT(*) AS postings
FROM job_postings
GROUP BY recency;
