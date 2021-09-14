/* QUERYING THE PRECENT OF POPULATION WHO INFECTED , AND PRECENT OF POPULATION DIED */

SELECT 
    c.location,
    total_cases,
    total_deaths,
    p.population,
    ROUND((total_cases / p.population) * 100, 2) AS Precent_Population_Infected,
    ROUND((total_deaths / p.population) * 100, 2) AS Precent_Population_Died
FROM
    cases_deaths c
        JOIN
    population_and_ages p ON c.location = p.location
        AND c.date_of_case = p.date_of_case
WHERE
    c.location IN ('israel' , 'united states',
        'united kingdom',
        'china',
        'italy',
        'spain')
        AND c.date_of_case >= ALL (SELECT 
            c.date_of_case
        FROM
            cases_deaths c
        WHERE
            c.location IN ('israel' , 'united states',
                'united kingdom',
                'china',
                'italy',
                'spain'));
