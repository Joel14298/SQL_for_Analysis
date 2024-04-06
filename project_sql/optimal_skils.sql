WITH skills_demand AS (
    SELECT skills,
        skills_dim.skill_id,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Business Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location = 'India'
    GROUP BY skills_dim.skill_id
),
average_salary AS (
    SELECT skills_dim.skill_id,
        ROUND (AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Business Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location = 'India'
    GROUP BY skills_dim.skill_id
)
SELECT skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM skills_demand
    INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY avg_salary DESC,
    demand_count DESC
    /*
     Overall, the data suggests that Business Analysts in India with a strong foundation in data analysis (SQL) and data visualization (Power BI) are in high demand. Python skills can be a plus for some roles, while domain-specific IT skills might require deeper specialization. Soft skills like communication (present in the high salary for PowerPoint) are likely still important for Business Analysts.
     Focus on Core Business Analysis Skills: The high importance of SQL suggests a focus on core data analysis skills for Business Analysts.
     Data Visualization Gaining Traction: The presence of Power BI and Looker suggests a growing need for data visualization skills alongside core analysis.
     Data Science Skills Can Be a Plus: Python's presence in a high-paying role might indicate a demand for data science skills in some Business Analyst roles.
     Specialization for Domain-Specific Skills: The Teva Pharmaceuticals posting with domain-specific skills might represent a specific type of Business Analyst role requiring IT or system administration expertise.
     */