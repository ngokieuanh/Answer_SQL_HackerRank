/*Population Census*/
SELECT SUM(City.Population) 
from city JOIN country on city.countrycode = country.code
where country.continent= "Asia"
/* African Cities */
SELECT city.name FROM city
JOIN country ON city.Countrycode=country.Code
where country.continent="Africa"
/*Average Population of Each Continent*/
select ct.continent, AVG(c.population) from country as ct join city as c on ct.code=c.countrycode
group by ct.continent
/*The Report*/
SELECT
CASE 
WHEN g.Grade > 7 THEN s.Name ELSE "NULL" 
END, g.Grade, s.Marks 
FROM Students s JOIN Grades g ON s.Marks BETWEEN Min_Mark AND Max_Mark
ORDER BY  g.Grade DESC,  s.Name
/* Top Competitors*/
SELECT H.hacker_id, H.name FROM Submissions S 
JOIN Challenges C ON S.challenge_id = C.challenge_id 
JOIN Difficulty D ON C.difficulty_level = D.difficulty_level 
JOIN Hackers H ON S.hacker_id = H.hacker_id 
WHERE S.score = D.score 
GROUP BY H.hacker_id, H.name 
HAVING COUNT(DISTINCT S.challenge_id) > 1 
ORDER BY COUNT(DISTINCT S.challenge_id) DESC, H.hacker_id ASC
/*Ollivander's Inventory */
SELECT w.id, wp.age, w.coins_needed, w.power FROM Wands w 
JOIN Wands_Property wp ON w.code=wp.code 
WHERE wp.is_evil=0 AND 
w.coins_needed =  (SELECT MIN(coins_needed)
                    FROM WANDS AS w1
                    JOIN WANDS_PROPERTY AS wp1 ON w1.code = wp1.code
                     WHERE w1.power = w.power AND wp1.age = wp.age)
ORDER BY w.power DESC, wp.age DESC
/*Challenges*/
WITH challenges_created AS (
    SELECT
                h.hacker_id AS id,
                h.name AS hacker_name,
                COUNT(c.challenge_id) AS created
    FROM Hackers AS h
    JOIN Challenges AS c ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
),
counts AS (
SELECT
            created AS created,
            COUNT(created) AS count_created
FROM challenges_created
GROUP BY created
)
SELECT 
            cc.id,
            cc.hacker_name,
            cc.created
FROM counts c
JOIN challenges_created cc ON cc.created = c.created
WHERE cc.created = (SELECT MAX(created) 
                                    FROM challenges_created)
OR c.count_created = 1
ORDER BY cc.created DESC, cc.id
/* Contest Leaderboard */
WITH Create_Challenges AS (SELECT h1.hacker_id, s1.challenge_id, MAX(s1.score) as score1 FROM Hackers h1
JOIN Submissions s1 ON h1.hacker_id = s1.hacker_id
GROUP BY h1.hacker_id, s1.challenge_id)
SELECT h.hacker_id, h.name, SUM(cc.score1) FROM Hackers h JOIN Create_Challenges cc
ON h.hacker_id =cc.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(cc.score1) >0
ORDER BY SUM(cc.score1) DESC, h.hacker_id ASC

