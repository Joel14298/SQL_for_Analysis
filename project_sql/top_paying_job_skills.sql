WITH top_paying_jobs AS (
    SELECT job_id,
        company_dim.name AS company_name,
        job_title_short,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Business Analyst'
        AND job_location = 'India'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_jobs.*,
    skills
FROM top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
    /*
     Core Data Analysis & Visualization:
     SQL and Excel are present in almost all postings, highlighting their continued importance for data manipulation and analysis.
     Power BI appears in some high-paying roles, suggesting a growing demand for Business Analysts with data visualization skills.
     Optional but Valuable:
     Python is present in a high-paying Gartner posting, suggesting it can be valuable for some Business Analyst roles, potentially for data science tasks.
     Looker, another data visualization tool, is present in a high-paying Deliveroo posting.
     */