/* Querying the precentage of total deaths in the world */
SELECT 
    total_cases,
    date_of_case,
    total_deaths,
    CONCAT(ROUND(total_deaths / total_cases, 4) * 100,
            '%') AS precentage_of_deaths
FROM
    cases_deaths
WHERE
    location = 'World'
ORDER BY date_of_case DESC
LIMIT 1;
