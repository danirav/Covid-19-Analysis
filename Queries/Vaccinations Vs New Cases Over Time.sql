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