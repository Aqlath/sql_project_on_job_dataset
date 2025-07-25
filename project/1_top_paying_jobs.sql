/*
Write an SQL query to retrieve the 
top 10 highest-paying Data Science roles located in India
,including the company name, job title, and average salary.
*/
SELECT
    job_title,
    salary_year_avg,
    name AS company_name,
    job_posted_date::date
    
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

/* 
INSIGHTS:
-> GSK offers the highest average salary (~$204k) for the Principal Data Scientist role.

-> Shell, HRS, and KONE offer consistent salaries (~$170k) for standard data scientist positions.

-> Carousell Group offers a slightly lower salary (~$166k) for a lead/head-level role, suggesting possible variation in company valuation or location perks.

-> Gartner offers the lowest average salary in this set (~$162.5k)
*/