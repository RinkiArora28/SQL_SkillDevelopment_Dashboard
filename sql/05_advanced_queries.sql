-- Advanced queries: window functions and CTEs

-- Rank companies by number of postings using a window function
WITH company_counts AS (
    SELECT company_name, COUNT(*) AS total_postings
    FROM job_postings
    GROUP BY company_name
)
SELECT
    company_name,
    total_postings,
    RANK() OVER (ORDER BY total_postings DESC) AS company_rank
FROM company_counts
LIMIT 10;

-- Rank locations within each experience bracket
SELECT
    experience_required,
    primary_location,
    COUNT(*) AS postings,
    RANK() OVER (PARTITION BY experience_required ORDER BY COUNT(*) DESC) AS location_rank
FROM job_postings
GROUP BY experience_required, primary_location
ORDER BY experience_required, location_rank
LIMIT 30;
