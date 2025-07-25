-- top skills for data science job in india based on salary year avg


SELECT 
    skills,
    ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM  
    job_postings_fact AS jf
INNER JOIN 
    skills_job_dim AS sj ON jf.job_id=sj.job_id
INNER JOIN
    skills_dim AS s ON sj.skill_id=s.skill_id
WHERE 
    job_title_short='Data Scientist'
    AND job_location='India'
GROUP BY 
    skills
HAVING 
    AVG(salary_year_avg) IS NOT NULL 
    AND skills IS NOT NULL
ORDER BY 
    avg_salary DESC,
    skills
LIMIT 10;

/* 
INSIGHTS:

Databricks, Hadoop, and Snowflake top the list with an average salary of ₹170,575.

Shell scripting closely follows with ₹170,537.50.

Programming skills like C++, Java, Go, and Express offer strong salaries around ₹170,500.

Spark still remains a high-paying skill at ₹168,497.25, despite being slightly lower than others.

Flow also commands a good salary of ₹170,000.

*/

