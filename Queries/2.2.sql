/*
Question 2

We would like to know who were our top 10 paying customers, how many payments they made on a monthly basis during 2007, and what was the amount of the monthly payments. Can you write a query to capture the customer name, month and year of payment, and total payment amount for each month by these top 10 paying customers?
*/


WITH top_customers AS (
 		    SELECT C.customer_id,
 				   SUM(p.amount) AS total_payment
 			  FROM customer As c
 			  JOIN payment AS p
 			 ON c.customer_id = p.customer_id
 		  GROUP BY 1
 		  ORDER BY 2 DESC
 		     LIMIT 10
 )

 	SELECT c.first_name || ' ' || c.last_name AS Fullname,
 		   DATE_TRUNC('month', p.payment_date) AS pay_mon,
 		   COUNT(p.payment_id) AS pay_countPerMon,
 		   SUM(p.amount) AS pay_amount
 	  FROM customer c
 	  JOIN payment p
 	 ON c.customer_id=p.customer_id
 	  JOIN top_customers As tc
 	 ON c.customer_id=tc.customer_id
   GROUP BY 1, 2
   ORDER BY 1, 2
