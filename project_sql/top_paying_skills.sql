SELECT skills,
    ROUND (AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Business Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location = 'India'
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25
    /*
     Data Manipulation and Analysis Still Valued: Excel and SQL remain in the top 5 with high average salaries, indicating a continued need for strong data manipulation and analysis skills.
     Data Visualization Skills Rise: Looker, a data visualization tool, joins the high-paying group (tied for 2nd). This reinforces the growing importance of presenting data insights effectively.
     Python's Value Retained: Python remains a high-paying skill, potentially reflecting its use in data science tasks for Business Analysts.
     Shifting Salary Landscape: Power BI, another data visualization tool, drops significantly in average salary compared to the demand data. This might suggest a higher supply of Power BI skills compared to demand, affecting salary.
     Soft Skills Hold Value: Surprisingly, MS Office skills like PowerPoint hold their own in terms of average salary, highlighting the continued importance of strong communication skills.
     */