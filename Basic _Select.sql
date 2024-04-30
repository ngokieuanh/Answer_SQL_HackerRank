/* Revising the Select Query I */
select * from city 
where countrycode = 'USA' and population > 100000  
/* Revising the Select Query II */
select name
from city 
where countrycode ='USA' and population > 120000
/* Select All */
select * from city
/* Select By ID */
select * from city 
where ID = 1661
/*Japanese Cities' Attributes */
select * from city where countrycode='JPN'
/*Japanese Cities' Names*/
select name from city 
where countrycode='JPN'
/*Weather Observation Station 1*/
select city, state from station
/*Weather Observation Station 3*/
select distinct city from station where (id % 2) = 0
/*Weather Observation Station 4*/
select (count(CITY)- count(distinct CITY)) from STATION;
/*Weather Observation Station 5*/
select top 1 city, len(city) from station order by len(city) ASC, city ASC; 
select top 1 city, len(city) from station order by len(city) DESC, city ASC;
/*Weather Observation Station 6*/
select distinct city from station where city like '[aeiou]%'
/*Weather Observation Station 7*/
select distinct city from station where city like '%[a,e,i,o,u]'
/*Weather Observation Station 8*/
select distinct city from station where city like '[a,e,i,o,u]%[a,e,i,o,u]'
/*Weather Observation Station 9*/
select distinct city from station where city not like '[a,e,i,u,o]%'
/*Weather Observation Station 10*/
select distinct city from station where city not like '%[a,e,i,u,o]'
/*Weather Observation Station 11*/
select distinct city from station where city not like '[a,e,i,u,o]%[a,e,i,u,o]';
/*Weather Observation Station 12*/
select distinct city from station where city not like '[a,e,i,u,o]%' and city not like '%[a,e,i,u,o]'
/* Higher Than 75 Marks */
select name from students where marks > 75 order by right (name,3), ID;
/*Employee Names */
select name from employee
order by name
/*Employee Salaries*/
Select name from Employee
Where salary >= 2000 and months <10
order by employee_id
