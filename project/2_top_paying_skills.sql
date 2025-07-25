/*
Write an SQL query to retrieve the 
top highest-paying skills for top 10 data science job located in India
,including the company name, job title, and salary_year_avg.
*/
WITH top_jobs AS (
    SELECT 
        job_id,
        job_title,
       name as company_name,
       salary_year_avg
FROM
    job_postings_fact AS jf 
LEFT JOIN
    company_dim AS c ON jf.company_id = c.company_id
WHERE 
    job_title_short='Data Scientist' AND
    job_location='India' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10
)

SELECT
    t.*,
    skills
FROM 
    top_jobs AS t
INNER JOIN
    skills_job_dim AS sj ON t.job_id = sj.job_id
INNER JOIN
    skills_dim AS s ON sj.skill_id=s.skill_id
ORDER BY 
    salary_year_avg DESC

/* 
INSIGHTS:
TOP SKILLS REQUIRED FOR DATA SCIENCE JOB IN INDIA
-> Python & SQL are the most essential skills for all data roles.

-> Cloud platforms like AWS and Azure are key for deployment and scaling.

-> Machine Learning libraries (Scikit-learn, TensorFlow, PyTorch) are crucial for building models.

-> Visualization tools (Tableau, Power BI) are expected in analyst roles.

-> Big data tools like Spark, and DevOps tools like Docker & Kubernetes, are required in senior/engineering roles.
*/