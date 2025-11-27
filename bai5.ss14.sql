SELECT 
    payment_id,
    customer_id,
    amount,
    payment_date,

    -- Lấy phần DATE
    DATE(payment_date) AS payment_day,

    -- Xếp hạng theo số tiền trong từng ngày
    DENSE_RANK() OVER (
        PARTITION BY DATE(payment_date)
        ORDER BY amount DESC
    ) AS payment_rank

FROM payment
ORDER BY payment_day, payment_rank;
