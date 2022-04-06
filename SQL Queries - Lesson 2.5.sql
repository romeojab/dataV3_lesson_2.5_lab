-- Lab | SQL Queries - Lesson 2.5

-- 1.Select all the actors with the first name ‘Scarlett’

SELECT *
FROM sakila.actor
WHERE first_name = 'Scarlett'
;

-- 2. How many films (movies) are available for rent and how many films have been rented?

-- How many copies of films (movies) are available
SELECT COUNT(DISTINCT inventory_id) AS rentable_films
FROM sakila.rental
;

-- how many copies of films have been rented
SELECT count(*)
FROM sakila.rental
WHERE rental_date IS NOT NULL
;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.

-- shortest duration
SELECT MIN(length) min_duration
FROM sakila.film
;

-- longest duration
SELECT MAX(length) min_duration
FROM sakila.film
;

-- 4. What's the average movie duration expressed in format (hours, minutes)?

SELECT DATE_FORMAT(SEC_TO_TIME(AVG(length)*60),  '%H:%i') AS 'hh:mm'
FROM sakila.film
;

-- 5. How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT last_name) AS distinct_last_name
FROM sakila.actor
;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DATEDIFF(MAX(last_update),MIN(rental_date)) -- using last update for the max date as it's not clear if the company still exist.Otherwise the max date would be current_date
FROM sakila.rental
;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.

SELECT	*
		, DATE_FORMAT(rental_date,'%M') AS Rental_Month
        , DATE_FORMAT(rental_date, '%W') AS Rental_Weekday
FROM sakila.rental
ORDER BY rental_date
LIMIT 20
;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT	*
		, DATE_FORMAT(rental_date,'%M') AS Month
        , DATE_FORMAT(rental_date, '%W') AS Weekday
        , CASE
			WHEN DATE_FORMAT(rental_date, '%w') > 5 THEN 'weekend'
            ELSE 'workday'
		END	AS day_type
FROM sakila.rental
ORDER BY rental_date
LIMIT 20
;

-- 9. Get release years.

SELECT release_year
FROM sakila.film
;

-- 10. Get all films with ARMAGEDDON in the title.

SELECT *
FROM sakila.film
 WHERE title LIKE '%ARMAGEDDON%'
;

-- 11. Get all films which title ends with APOLLO.

SELECT *
FROM sakila.film
WHERE title LIKE '%APOLLO'
;

-- 12. How many films include Behind the Scenes content?

SELECT COUNT(*) AS count_of_films_with_special_features
FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%'
;