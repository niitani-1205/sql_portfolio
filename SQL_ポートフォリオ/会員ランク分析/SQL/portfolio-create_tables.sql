-- データベース作成
CREATE DATABASE portfolio_shop
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE portfolio_shop;

-- テーブル作成1　（顧客情報）
CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,                    -- 顧客ID
    name          VARCHAR(50) NOT NULL,               -- 名前
    gender        ENUM('male','female') NOT NULL,     -- 性別
    age           INT,                                -- 年齢
    register_date DATE                                -- 登録日
);

-- テーブル作成2　（商品カテゴリー）
CREATE TABLE categories (
    category_id   INT PRIMARY KEY,                    -- カテゴリID
    category_name VARCHAR(50) NOT NULL                -- カテゴリ名
);

-- テーブル作成3　（商品情報）
CREATE TABLE products (
    product_id    INT PRIMARY KEY,                    -- 商品ID
    product_name  VARCHAR(100) NOT NULL,              -- 商品名
    category_id   INT NOT NULL,                       -- カテゴリID
    price         INT NOT NULL,                       -- 価格
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- テーブル作成4　（注文）
CREATE TABLE orders (
    order_id    INT PRIMARY KEY,                      -- 注文ID
    customer_id INT NOT NULL,                         -- 顧客ID
    order_date  DATE NOT NULL,                        -- 注文日
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- テーブル作成5　（注文明細）
-- 注文明細テーブル
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,                    -- 注文明細ID
    order_id      INT NOT NULL,                       -- 注文ID
    product_id    INT NOT NULL,                       -- 商品ID
    quantity      INT NOT NULL,                       -- 数量
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

