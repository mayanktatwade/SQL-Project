/* Requirements:
- Data Analyst role
- Remote job
Why? 
To get the top 10 highest-paying jobs available. 
*/

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
