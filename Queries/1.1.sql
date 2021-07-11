/*
Question 1

We want to understand more about the movies that families are watching. The following categories are considered family movies: Animation, Children, Classics, Comedy, Family and Music.

Create a query that lists each movie, the film category it is classified in, and the number of times it has been rented out.
*/


WITH A1 AS (SELECT *
			FROM film AS f
      			JOIN film_category AS fc
			ON f.film_id = fc.film_id
			JOIN category AS c
      			ON fc.category_id = c.category_id
      			JOIN Inventory AS i
      			ON i.film_id = f.film_id
      			JOIN rental AS r
      			ON i.inventory_id = r.inventory_id
      			WHERE name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
      			)


SELECT title AS film_title, name AS category_name, COUNT(*) AS rental_count
	FROM A1
	GROUP BY 1,2
	ORDER BY category_name, film_title, rental_count
