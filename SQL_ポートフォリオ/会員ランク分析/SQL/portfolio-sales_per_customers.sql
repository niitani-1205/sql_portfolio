USE portfolio_shop;

-- 顧客ごとの売り上げを集計
SELECT 
    customers.customer_id,                            -- 顧客ID
    customers.name,                                   -- 顧客名
    SUM(order_items.quantity * products.price)
    AS total_amount                                   -- 顧客の総売上金額
FROM customers                                        -- 顧客テーブル
JOIN orders 
    ON customers.customer_id = orders.customer_id     -- 顧客と注文を結合
JOIN order_items 
    ON orders.order_id = order_items.order_id         -- 注文と注文明細を結合
JOIN products 
    ON order_items.product_id = products.product_id   -- 注文明細と商品を結合
GROUP BY customers.customer_id, customers.name        -- 顧客ごとに集計
ORDER BY total_amount DESC;                           -- 総売上順に降順で表示

