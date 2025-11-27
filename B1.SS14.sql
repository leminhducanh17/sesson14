SELECT 
    customer_id,
    SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id;
