-- top skills for data science job in india based on count 
SELECT 
    skills,
    COUNT(jf.job_id) AS count_of_jobs
FROM  
    job_postings_fact AS jf
INNER JOIN 
    skills_job_dim as sj ON jf.job_id=sj.job_id
INNER JOIN 
    skills_dim as s ON sj.skill_id=s.skill_id
WHERE 
    job_title_short='Data Scientist'
     AND job_location='India'
GROUP BY 
    skills 
ORDER BY 
    count_of_jobs DESC
LIMIT 10;

/*
INSIGHTS: 
Python & SQL dominate as must-have skills.

Cloud (AWS, Azure) and big data tools (Spark) are vital for senior and scalable projects.

Visualization (Tableau, Excel) still matters for stakeholder communication.

Deep learning (TensorFlow) is rising in demand with AI-focused roles.

R & SAS are niche but still valuable in specific industries.
*/