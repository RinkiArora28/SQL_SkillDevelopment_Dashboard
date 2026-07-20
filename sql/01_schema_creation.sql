-- Table creation and schema setup

CREATE TABLE job_postings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    job_title VARCHAR(255),
    company_name VARCHAR(255),
    experience_required VARCHAR(50),
    package_details VARCHAR(100),
    locations VARCHAR(500),
    skills TEXT,
    post_url VARCHAR(500),
    post_time VARCHAR(50)
);
