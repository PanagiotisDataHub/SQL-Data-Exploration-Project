/*
Question: What are the most in-demand skills for Data Analysts?
- Join all job postings with the skills table (similar to Query 2) to match each job with its required skills.
- Identify the top 5 most in-demand skills for Data Analyst roles based on frequency across all job postings (not just high-paying ones).
- Why? This highlights the most sought-after skills in the market, helping job seekers focus on developing expertise that aligns with industry demand.
*/


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
Key Insights:
- SQL and Excel are the most in-demand skills for Data Analysts, emphasizing the importance of strong foundational skills in data manipulation and spreadsheet analysis.
- Python remains a critical skill, reinforcing its role in automation, data processing, and machine learning applications.
- Data visualization tools like Tableau and Power BI are highly sought after, indicating the growing need for data storytelling and decision-making support.
- The demand for these skills reflects the industry's shift toward a balance between technical programming, data processing, and visualization expertise.

RESULTS
=======
[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]
*/
