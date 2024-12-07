/* To get the jobs which pays the best and are pretty popular(requirement for more than 200 jobs*/

SELECT 
    skills,
    AVG(salary_year_avg) as avg_salary,
    COUNT(skills) as skill_count
FROM
    job_postings_fact
INNER JOIN 
    skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN 
    skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    
GROUP BY
    skills
HAVING
    COUNT(skills) > 200
ORDER BY
    avg_salary DESC
LIMIT 10
