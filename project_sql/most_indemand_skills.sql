SELECT skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Business Analyst'
    AND job_location = 'India'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5
    /*
     High demand for data manipulation and analysis skills: The high demand for SQL (1st rank) suggests a strong need for Business Analysts who can work with relational databases. This is likely because a significant amount of business data is still stored in relational databases.
     Importance of data visualization: The presence of Tableau (3rd rank) in the top 3 highlights the growing demand for Business Analysts who can present data insights effectively through visualizations. Data visualization is a crucial skill for communicating complex information to stakeholders in a clear and concise way.
     Potential rise of Business Intelligence (BI) tools: Power BI's inclusion (4th rank) suggests a potential rise in demand for BI skills, alongside data analysis. Business Intelligence (BI) tools allow businesses to analyze their data and gain insights that can be used to improve decision-making.
     Python's presence for data science or scripting: Python's inclusion (5th rank) might indicate a need for data science or scripting skills in some Business Analyst roles. Python is a popular programming language that is widely used in data science and data analysis. Business Analysts with Python skills may be able to automate tasks, manipulate data, and build data analysis models.
     Traditional skills remain relevant: Excel's high demand (2nd rank) signifies the continued importance of spreadsheet skills for data manipulation and analysis. Even though there are more advanced data analysis tools available, Excel is still a widely used tool for many business tasks.
     Overall, the data suggests that Business Analysts in India need a blend of technical and soft skills. Technical skills in data manipulation, analysis, and visualization are becoming increasingly important. However, soft skills such as communication and presentation are also essential for Business Analysts to be able to effectively communicate their findings to stakeholders
     */