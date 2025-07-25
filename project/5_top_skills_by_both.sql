
-- top skills required for data science job based on both count and salary year average

SELECT 
    skills,
    COUNT(jf.job_id) AS job_count,
    ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM  
    job_postings_fact AS jf
INNER JOIN 
    skills_job_dim AS sj ON jf.job_id=sj.job_id
INNER JOIN 
    skills_dim AS s ON sj.skill_id=s.skill_id
WHERE 
    job_title_short='Data Analyst'
    AND job_location='India'
GROUP BY 
    skills
HAVING 
    AVG(salary_year_avg) IS NOT NULL 
    AND skills IS NOT NULL
ORDER BY 
    avg_salary DESC,
    job_count DESC
LIMIT 10;

/*
INSIGHTS:

Most In-Demand Skill:

SQL leads with 1,016 job postings, despite having the lowest average salary at ~$85K.

Top Paying Skills:

Jira, Confluence, and Visio all offer the highest average salary of $119,250, but have very few job openings (less than 60 each).

Balanced Skill:

Power BI stands out with a high job count (402) and a high average salary (~$118K) — showing strong demand and good pay.

Low Demand + Low Salary:

Word, Sheets, and Flow have lower job demand and are among the lowest-paying.
*/