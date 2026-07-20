-- Exploratory queries

-- Total number of job postings
SELECT COUNT(*) AS total_postings FROM job_postings;

-- Number of distinct companies hiring
SELECT COUNT(DISTINCT company_name) AS unique_companies FROM job_postings;

-- Number of distinct job titles
SELECT COUNT(DISTINCT job_title) AS unique_job_titles FROM job_postings;

-- Distribution of experience requirements
SELECT experience_required, COUNT(*) AS postings
FROM job_postings
GROUP BY experience_required
ORDER BY postings DESC;

-- How many postings have disclosed salary vs not
SELECT
    CASE WHEN package_details IS NULL THEN 'Not Disclosed' ELSE 'Disclosed' END AS salary_status,
    COUNT(*) AS total
FROM job_postings
GROUP BY salary_status;

-- Most recent vs older postings
SELECT post_time, COUNT(*) AS postings
FROM job_postings
GROUP BY post_time
ORDER BY postings DESC;
