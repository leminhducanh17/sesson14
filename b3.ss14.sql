SELECT 
    rating,
    AVG(length) AS avg_length
FROM film
GROUP BY rating;
