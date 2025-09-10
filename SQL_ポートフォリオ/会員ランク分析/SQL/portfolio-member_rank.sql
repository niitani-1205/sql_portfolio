USE portfolio_shop;

-- 会員ランク分け
CREATE VIEW customer_rank_view AS
SELECT 
    customers.customer_id,                            -- 顧客ID
    customers.name,                                   -- 顧客名
    SUM(order_items.quantity * products.price) 
    AS total_amount,                                  -- 総売上金額
    CASE
        WHEN SUM(order_items.quantity * products.price) 
        >= 100000 THEN 'ゴールド'
        WHEN SUM(order_items.quantity * products.price) 
        >= 50000  THEN 'シルバー'
        ELSE 'ブロンズ'
    END AS membership_rank                            -- 会員ランク
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY customers.customer_id, customers.name
ORDER BY total_amount DESC;
