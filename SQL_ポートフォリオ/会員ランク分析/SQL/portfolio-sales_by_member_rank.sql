USE portfolio_shop;

SELECT
    customer_rank_view.membership_rank 
        AS membership_rank,                   -- 会員ランク
    products.product_name 
        AS product_name,                      -- 商品名
    SUM(order_items.quantity) 
        AS total_quantity,                    -- 商品ごとの合計販売数量
    SUM(order_items.quantity * products.price) 
        AS total_sales                        -- 商品ごとの総売上
FROM customer_rank_view
JOIN orders
    ON customer_rank_view.customer_id = orders.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY 
    customer_rank_view.membership_rank, 
    products.product_name
ORDER BY 
    customer_rank_view.membership_rank, 
    total_sales DESC;
