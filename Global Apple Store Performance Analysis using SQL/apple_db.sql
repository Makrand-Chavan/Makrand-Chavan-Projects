CREATE DATABASE apple_db;
USE apple_db;

-- PARENT TABLE
CREATE TABLE stores (
    store_id VARCHAR(5) PRIMARY KEY,
    store_name VARCHAR(30),
    city VARCHAR(25),
    country VARCHAR(25)
);

-- PARENT TABLE
CREATE TABLE category (
    category_id VARCHAR(10) PRIMARY KEY,
    category_name VARCHAR(20)
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(35),
    category_id VARCHAR(10),
    launch_date DATE,
    price FLOAT,
    CONSTRAINT fk_category 
        FOREIGN KEY (category_id) 
        REFERENCES category(category_id) 
);

CREATE TABLE sales (
    sale_id VARCHAR(15) PRIMARY KEY,
    sale_date DATE,
    store_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT,
    CONSTRAINT fk_store 
        FOREIGN KEY (store_id) 
        REFERENCES stores(store_id),
    CONSTRAINT fk_product 
        FOREIGN KEY (product_id) 
        REFERENCES products(product_id)
);

CREATE TABLE warranty (
    claim_id VARCHAR(10) PRIMARY KEY,
    claim_date DATE,
    sale_id VARCHAR(15),
    repair_status VARCHAR(15),
    CONSTRAINT fk_orders 
        FOREIGN KEY (sale_id) 
        REFERENCES sales(sale_id)
);

SELECT * FROM stores;
SELECT * FROM category;
SELECT * FROM products;
SELECT * FROM sales;
SELECT * FROM warranty;

-- EDA

SELECT DISTINCT repair_status FROM warranty;
SELECT DISTINCT store_name FROM stores;
SELECT DISTINCT category_name FROM category;
SELECT DISTINCT product_name FROM products;

SELECT COUNT(*) FROM sales;

-- IMPROVING QUERY PERFORMANCE
-- "Planning Time: 0.015 ms"
-- "Execution Time: 136.423 ms"
-- EXPLAIN ANALYZE

SELECT * FROM sales
WHERE product_id = 'P-44';

-- IMPROVE QUERY PERFORMANCE

CREATE INDEX sales_product_id ON sales(product_id);
SELECT * FROM sales
WHERE product_id = 'P-44';
-- After creation of indexes query performances are increased to
-- "Planning Time: 0.118 ms"
-- "Execution Time: 6.324 ms"

CREATE INDEX sales_store_id ON sales(store_id);

CREATE INDEx sales_quantity ON sales(quantity);

CREATE INDEX sale_date ON sales(sale_date);

CREATE INDEX sales_product_id_store_id ON sales(product_id, store_id);
