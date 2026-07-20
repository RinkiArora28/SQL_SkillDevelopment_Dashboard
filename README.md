# SQL Skill Development Dashboard

## Overview
This project uses SQL to analyze a real-world job postings dataset from Naukri.com, focused on Data Science roles in India. It demonstrates end-to-end SQL workflow — from schema design and data cleaning to exploratory analysis and advanced querying — to uncover hiring trends, in-demand skills, and salary patterns.

## Dataset
- **Source:** Naukri.com Job Postings (Data Science roles)
- **File:** `NaukriData_Data Science.csv`
- **Contents:** Job titles, company names, experience requirements, package details, locations, skills, post URL, and post time

## Tools Used
- SQL
- GitHub for version control

## Project Structure
## Key Business Questions Answered
1. Which companies have the most job postings?
2. Which cities have the highest concentration of Data Science hiring?
3. What experience range is most commonly required?
4. Which job titles are most frequently listed?
5. What proportion of postings are recent (last 7 days) vs older?

## Sample Query
```sql
SELECT company_name, COUNT(*) AS job_postings
FROM job_postings
GROUP BY company_name
ORDER BY job_postings DESC
LIMIT 10;
```

## Key Insights
- Top hiring companies and cities for Data Science roles identified
- Most frequently listed job titles surfaced from postings
- Distribution of experience requirements analyzed across postings

## Limitations
- Salary/package data is almost entirely marked "Not disclosed" in the source data, so compensation analysis was not possible
- The skills field lacks consistent delimiters, so skill extraction is approximate
- Some postings list multiple cities; analysis uses the first listed city as the primary location

## How to Run
1. Clone this repo
2. Run `sql/01_schema_creation.sql` to set up tables
3. Import `NaukriData_Data Science.csv`
4. Run scripts 02–05 in order

## Author
Rinki Arora
