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
LIMIT 10;
/*
 Salary Range:
 
 The salary range is significant, spanning from $43,200 (BT Group) to $142,025 (Gartner) per year. This highlights a large variation in pay based on factors like:
 Company: Gartner offers the highest average salary.
 Experience: Senior Business Analysts likely command higher salaries.
 Skills: Specific skills required for the role can influence salary.
 Possible Outlier:
 
 The BT Group role with a $43,200 salary is considerably lower than the others. This could be due to it being a:
 Junior position with less experience required.
 Entry-level role focused on developing core Business Analyst skills.
 Role requiring a different skillset compared to the other postings.
 
 Skills and Salary: If you have data on specific skills mentioned in the postings, you might identify skills that correlate with higher salaries.
 Average Salary Comparison: Look online for resources on the average salary for Business Analysts in India to compare this data point.
 Salary Trends: Analyze if there are trends in salary based on the date the job was posted.
 By looking at the data more comprehensively and considering these additional factors, you can gain a deeper understanding of the salary landscape for Business Analyst positions in India.
 
 */