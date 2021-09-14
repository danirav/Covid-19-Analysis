/* Querying the percentage of deaths from those who infected in chosen countries */
SELECT 
    location,
    total_cases,
    total_deaths,
    CONCAT(ROUND((ROUND(total_deaths / total_cases, 4)) * 100,
                    2),
            '%') AS percentage_of_deaths
FROM
    cases_deaths
WHERE
    location IN ('israel' , 'united states',
        'united kingdom',
        'china',
        'italy',
        'spain')
        AND date_of_case >= ALL (SELECT 
            date_of_case
        FROM
            cases_deaths
        WHERE
            location IN ('israel' , 'united states',
                'united kingdom',
                'china',
                'italy',
                'spain'));
