SELECT 
    rental_id,
    customer_id,
    rental_date,

    -- Ngày thuê trước đó
    LAG(rental_date) OVER (
        PARTITION BY customer_id
        ORDER BY rental_date
    ) AS previous_rental_date,

    -- Số ngày chênh lệch
    DATEDIFF(
        rental_date,
        LAG(rental_date) OVER (
            PARTITION BY customer_id
            ORDER BY rental_date
        )
    ) AS days_diff

FROM rental
ORDER BY customer_id, rental_date;
