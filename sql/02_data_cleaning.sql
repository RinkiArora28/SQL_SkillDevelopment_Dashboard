-- Data cleaning and preprocessing

-- Remove rows with missing job titles (blank/incomplete records)
DELETE FROM job_postings
WHERE job_title IS NULL OR TRIM(job_title) = '';

-- Remove exact duplicate postings (same title, company, and URL)
DELETE t1 FROM job_postings t1
INNER JOIN job_postings t2
WHERE t1.id > t2.id
  AND t1.job_title = t2.job_title
  AND t1.company_name = t2.company_name
  AND t1.post_url = t2.post_url;

-- Standardize "Not disclosed" entries in package_details to NULL
UPDATE job_postings
SET package_details = NULL
WHERE package_details = 'Not disclosed';

-- Trim leading/trailing whitespace from key text fields
UPDATE job_postings
SET job_title = TRIM(job_title),
    company_name = TRIM(company_name),
    locations = TRIM(locations);

-- Extract the first listed city from the locations field for simpler grouping
-- (locations often contain multiple cities separated by commas)
ALTER TABLE job_postings ADD COLUMN primary_location VARCHAR(100);

UPDATE job_postings
SET primary_location = TRIM(SUBSTRING_INDEX(locations, ',', 1));
