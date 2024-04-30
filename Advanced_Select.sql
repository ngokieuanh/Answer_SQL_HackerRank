/* Type of Triangle */
select case
when A+B <= C or A+C <= B or B+C <= A then "Not A Triangle"
when A=B and B=C then "Equilateral"
when A=B or A=C or B=C then "Isosceles"
else "Scalene"
end as triangles_type
from TRIANGLES;
/* The PADS */
select CONCAT(Name,"(", SUBSTRING (Occupation,1,1),")") from OCCUPATIONS
ORDER by Name
 select CONCAT("There are a total of ", COUNT(Occupation)," ",LOWER(Occupation),"s.") from OCCUPATIONS
group by OCCUPATION
ORDER by COUNT(Occupation)
/* OCCUPATIONS */
SELECT 
  MAX(Doctor) AS Doctor,
  MAX(Professor) AS Professor,
  MAX(Singer) AS Singer,
  MAX(Actor) AS Actor
FROM (
  SELECT 
    CASE WHEN Occupation = 'Doctor' THEN Name END AS Doctor,
    CASE WHEN Occupation = 'Professor' THEN Name END AS Professor,
    CASE WHEN Occupation = 'Singer' THEN Name END AS Singer,
    CASE WHEN Occupation = 'Actor' THEN Name END AS Actor,
    ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) AS row_num
  FROM OCCUPATIONS
) AS subquery
GROUP BY row_num
ORDER BY row_num;
/*Binary Tree Nodes*/
SELECT
CASE 
    WHEN P IS NULL THEN CONCAT (N, " Root")
    WHEN N IN (select P from BST) THEN CONCAT (N, " Inner")
    ELSE CONCAT (N, " Leaf") END AS Binary
FROM BST
ORDER BY N
/* New Companies */
SELECT c.company_code, c.founder, COUNT( distinct l.lead_manager_code), COUNT (distinct s.senior_manager_code), COUNT(distinct m.manager_code), COUNT(distinct e.employee_code) FROM Company c
JOIN Lead_Manager l ON c.company_code= l.company_code
JOIN Senior_Manager s ON l.lead_manager_code =  s.lead_manager_code
JOIN Manager m ON s.senior_manager_code = m.senior_manager_code
JOIN Employee e ON m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code
