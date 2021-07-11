/*
Question 3

Finally, provide a table with the family-friendly film category, each of the quartiles, and the corresponding count of movies within each combination of film category for each corresponding rental duration category. The resulting table should have three columns: 
*/


With A1 AS (SELECT title, name, rental_duration, NTILE(4) OVER (ORDER BY rental_duration) AS standard_quartile
	FROM film AS f
	Join film_category AS fc
	On f.film_id=fc.film_id
	Join category AS c
	On fc.category_id=c.category_id
where name IN ('Animation','Children','Classics','Comedy','Family','Music'))

Select name, standard_quartile, Count(*) 
From A1
Group by 1,2
Order by 1,2
