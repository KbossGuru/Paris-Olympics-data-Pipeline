-- Athletes by Country
SELECT country_long AS country, 
        SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) AS male,
        SUM(CASE WHEN gender = 'Female' THEN 1 END) AS female,
        COUNT(country_long) AS total
FROM athletes
GROUP BY country_long
ORDER BY COUNT(country_long) DESC;

--Athletes by Gender
SELECT SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) AS male,
        SUM(CASE WHEN gender = 'Female' THEN 1 END) AS female
FROM athletes;    

--Medals by gender
SELECT gender,
        SUM(CASE WHEN medal_type = 'Gold Medal' THEN 1 ELSE 0 END) AS Gold,
        SUM(CASE WHEN medal_type = 'Silver Medal' THEN 1 ELSE 0 END) AS Silver,
        SUM(CASE WHEN medal_type = 'Bronze Medal' THEN 1 ELSE 0 END) AS Bronze,
        COUNT(gender) AS Total
FROM medalist
GROUP BY gender
ORDER BY count(gender) DESC;


-- Medals by Country
SELECT country, 
        GoldMedal, 
        SilverMedal, 
        BronzeMedal, 
        Total
FROM medaltotal
ORDER BY Total DESC;

-- medals by Discipline
SELECT discipline, 
        SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) AS male,
        SUM(CASE WHEN gender = 'Female' THEN 1 END) AS female,
        COUNT(discipline) AS total
FROM medalist
GROUP BY discipline
ORDER BY COUNT(discipline) DESC;

--Top Athlete
SELECT TOP 1 name, 
        discipline,
        COUNT(name) AS total_medals
FROM medalist
GROUP BY name, discipline
ORDER BY COUNT(name) DESC;
