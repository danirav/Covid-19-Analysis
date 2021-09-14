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


/* Querying the precentage of deaths from those who infected in chosen countries */
SELECT 
    location,
    total_cases,
    total_deaths,
    CONCAT(ROUND((ROUND(total_deaths / total_cases, 4)) * 100,
                    2),
            '%') AS precentage_of_deaths
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
			
	
    
/* QUERYING THE POSITIVE RATE FOR EACH DAY , WITH THE NEW CASES AND NEW VACCINATIONS , 
SO WE CAN SEE THE CHANGES AMONG THE POSITIVE RATE AND THE NEW CASES DUE TO THE VACCINATIONS */
    
SELECT 
    c.date_of_case,
    c.new_Cases_smoothed,
    v.new_vaccinations,
    t.positive_rate
FROM
    cases_deaths c
        JOIN
    vaccinations v ON c.location = v.location
        AND c.date_of_case = v.date_of_case
        JOIN
    tests_and_positivity t ON v.location = t.location
        AND v.date_of_case = t.date_of_case
WHERE
    c.location = 'israel'
ORDER BY date_of_case;










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
                






