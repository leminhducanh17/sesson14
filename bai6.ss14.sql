SELECT 
    payment_id,
    customer_id,
    amount,
    payment_date,

    -- Tổng tiền tích lũy theo thời gian
    SUM(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total

FROM payment
ORDER BY customer_id, payment_date;
