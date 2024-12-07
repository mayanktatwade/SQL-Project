/* To get the information about the skills required in these jobs*/


WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        company_dim.name as company_Name,
        job_location,
        job_schedule_type,
        salary_year_avg as salary,
        job_posted_date
    FROM
        job_postings_fact as job_table
    LEFT JOIN 
        company_dim on company_dim.company_id = job_table.company_id
    WHERE 
        (job_title_short = 'Data Analyst') 
        and (job_work_from_home = TRUE)
        and (salary_year_avg is not NULL)
    ORDER BY
        salary DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM 
    top_paying_jobs
INNER JOIN 
    skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN 
    skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY
    salary DESC

/* Key observations include:

- SQL is a critical skill, highlighting its importance in managing and querying databases.
- Python and R are essential programming languages for data manipulation and statistical analysis.
- Azure and Databricks suggest a focus on cloud computing and big data technologies.

*/