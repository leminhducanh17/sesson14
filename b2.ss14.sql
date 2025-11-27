SELECT 
    payment_id,
    customer_id,
    amount,
    payment_date,

    -- Doanh thu trung bình theo từng khách hàng
    AVG(amount) OVER (PARTITION BY customer_id) AS avg_amount,

    -- Phân loại giao dịch
    CASE 
        WHEN amount > AVG(amount) OVER (PARTITION BY customer_id) 
            THEN 'Trên trung bình'
        ELSE 'Dưới trung bình'
    END AS classification

FROM payment
ORDER BY customer_id, payment_date;
