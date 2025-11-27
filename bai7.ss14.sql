SELECT 
    customer_id,
    SUM(amount) AS total_amount,
    DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS customer_rank
FROM payment
GROUP BY customer_id
ORDER BY customer_rank;
