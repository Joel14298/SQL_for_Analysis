SELECT job_title_short,
    job_location,
    job_via,
    job_posted_date::date,
    salary_year_avg
FROM (
        SELECT *
        FROM january_jobs
        WHERE salary_year_avg > 70000
        UNION ALL
        SELECT *
        FROM february_jobs
        WHERE salary_year_avg > 70000
        UNION ALL
        SELECT *
        FROM march_jobs
        WHERE salary_year_avg > 70000
    ) AS quater1_job_postings
WHERE quater1_job_postings.salary_year_avg > 70000
    AND quater1_job_postings.job_title_short = 'Business Analyst'
ORDER BY quater1_job_postings.salary_year_avg DESC