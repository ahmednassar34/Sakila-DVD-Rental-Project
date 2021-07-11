/*
Question 2

We would like to know who were our top 10 paying customers, how many payments they made on a monthly basis during 2007, and what was the amount of the monthly payments. Can you write a query to capture the customer name, month and year of payment, and total payment amount for each month by these top 10 paying customers?
*/


SELECT f.title, c.name, f.rental_duration, NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
	From film AS f
	JOIN film_category AS fc
	ON f.film_id = fc.film_id
	JOIN category AS c
	ON c.category_id = fc.category_id
WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
ORDER BY 3
