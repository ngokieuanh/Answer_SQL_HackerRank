/*Revising Aggregations - The Count Function*/
select COUNT(*) from CITY
where Population > 100000
/*Revising Aggregations - The Sum Function*/
select SUM(Population) from CITY
WHERE district ="California"
/*Revising Aggregations - Averages*/
select AVG(population) from city 
where district ="California"
/*Average Population*/
select round(avg(population),0) from city
/*Japan Population*/
select SUM(Population) from city
where COUNTRYCODE ="JPN"
/*Population Density Difference*/
select max(population)-min(population) from city
/*The Blunder*/
select CEILING(AVG(CAST(salary as decimal)) - AVG(CAST(replace(salary,"0","") AS DECIMAL))) from employees
/* Top Earners */
SELECT TOP (1) salary*months AS earnings, COUNT(*)
FROM Employee
GROUP BY salary*months
ORDER BY salary*months DESC
/*Weather Observation Station 2*/
select CAST(sum(LAT_N) AS DECIMAL(18,2)) , CAST(SUM(LONG_W) AS DECIMAL(18,2)) from station
/*Weather Observation Station 13*/
select CAST(SUM(LAT_N) AS DECIMAL(18,4)) from station
where LAT_N > 38.7880 AND LAT_N<137.2345
/*Weather Observation Station 14*/
Select CAST(MAX(LAT_N) AS DECIMAL(18,4)) from station
where LAT_N <137.2345
/*Weather Observation Station 15*/
select CAST(long_w as decimal (18,4))  from Station
where lat_n=(select max(LAT_N) from station where LAT_N < 137.2345)
/*Weather Observation Station 16*/
select CAST(MIN(LAT_N) AS DECIMAL (18,4)) from STATION
WHERE LAT_N >38.7780
/*Weather Observation Station 17*/
SELECT CAST(LONG_W AS DECIMAL (18,4)) FROM STATION 
WHERE LAT_N = (select MIN (LAT_N) from station where lat_n > 38.7780)
/*Weather Observation Station 18*/
SELECT CAST(ABS(MAX(LAT_N)-MIN(LAT_N)) + ABS(MAX(LONG_W)-MIN(LONG_W)) AS DECIMAL (18,4))  FROM STATION
/*Weather Observation Station 19*/
select CAST(SQRT(POWER(MAX(LAT_N)-MIN(LAT_N),2) + POWER(MAX(LONG_W)-MIN(LONG_W),2)) AS DECIMAL (18,4)) 
from station
/*Weather Observation Station 20*/
SELECT CAST (LAT_N AS DECIMAL(18,4)) FROM STATION S 
WHERE (SELECT COUNT(LAT_N) FROM STATION
                WHERE LAT_N>S.LAT_N) = (SELECT COUNT(LAT_N) FROM STATION
                WHERE LAT_N<S.LAT_N)
