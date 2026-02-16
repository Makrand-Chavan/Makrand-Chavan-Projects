-- BUSINESS PROBLEMS

-- 1. Find number of stores in each country
-- Purpose: Understand geographic distribution of stores.

SELECT 
    country,
    COUNT(store_id) AS total_stores
FROM stores
GROUP BY country
ORDER BY total_stores DESC;

-- 2. Calculate total number of units sold by each store
-- Purpose: Identify store performance.

SELECT
    s.store_id,
    st.store_name,
    SUM(s.quantity) AS total_units_sold
FROM sales s
JOIN stores st 
ON st.store_id = s.store_id
GROUP BY s.store_id, st.store_name
ORDER BY total_units_sold DESC;

-- 3. Identify how many sales occurred in December 2023
-- Purpose: Monthly sales tracking.

SELECT 
    COUNT(*) AS total_sales
FROM sales
WHERE sale_date >= '2023-12-01'
AND sale_date < '2024-01-01';

-- 4. Determine how many stores never had a warranty claim
-- Purpose: Identify low-risk stores.

SELECT COUNT(*) AS stores_without_claims
FROM stores
WHERE store_id NOT IN (
    SELECT DISTINCT s.store_id
    FROM sales s
    JOIN warranty w 
    ON s.sale_id = w.sale_id
);

-- 5. Calculate percentage of warranty claims marked as "Rejected"
-- Purpose: Measure repair rejection rate.

SELECT 
ROUND(
    COUNT(*) * 100.0 /
    (SELECT COUNT(*) FROM warranty), 2) AS rejected_percentage
FROM warranty
WHERE repair_status = 'Rejected';


-- 6. Identify store with highest units sold in year 2023
-- Purpose: Determine best performing store recently.

SELECT
    s.store_id,
    st.store_name,
    SUM(s.quantity) AS total_units
FROM sales s
JOIN stores st 
ON s.store_id = st.store_id
WHERE sale_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY s.store_id, st.store_name
ORDER BY total_units DESC
LIMIT 1;

-- 7. Count unique products sold in year 2024
-- Purpose: Measure product diversity.

SELECT 
COUNT(DISTINCT product_id) AS unique_products
FROM sales
WHERE sale_date BETWEEN '2024-01-01' AND '2024-12-31';

-- 8. Find average price of products in each category
-- Purpose: Pricing insights.

SELECT
    c.category_name,
    ROUND(AVG(p.price), 2) AS avg_price
FROM products p
JOIN category c
ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY avg_price DESC;

-- 9. Count warranty claims filed in 2024

SELECT 
COUNT(*) AS total_claims_2024
FROM warranty
WHERE EXTRACT(YEAR FROM claim_date) = 2024;

-- 10. Best-selling day for each store

WITH ranked_sales AS (
    SELECT
        store_id,
        DATE_FORMAT(sale_date, '%W') AS day_name,
        SUM(quantity) AS total_quantity,
        RANK() OVER (
            PARTITION BY store_id
            ORDER BY SUM(quantity) DESC
        ) AS sales_rank
    FROM sales
    GROUP BY store_id, day_name
)
SELECT *
FROM ranked_sales
WHERE sales_rank = 1;

-- 11. Least selling product in each country

WITH product_rank AS (
SELECT
    st.country,
    p.product_name,
    SUM(s.quantity) AS total_units,
    RANK() OVER(
        PARTITION BY st.country
        ORDER BY SUM(s.quantity)
    ) AS least_sold_rank
FROM sales s
JOIN stores st ON s.store_id = st.store_id
JOIN products p ON s.product_id = p.product_id
GROUP BY st.country, p.product_name
)
SELECT *
FROM product_rank
WHERE least_sold_rank = 1;

-- 12. Warranty claims filed within 180 days of purchase

SELECT COUNT(*) AS claims_within_180_days
FROM warranty w
JOIN sales s 
ON w.sale_id = s.sale_id
WHERE w.claim_date > s.sale_date
AND w.claim_date <= s.sale_date + INTERVAL 180 DAY;

-- 13. Warranty claims for products launched in last 2 years

SELECT
    p.product_name,
    COUNT(w.claim_id) AS total_claims
FROM products p
JOIN sales s ON p.product_id = s.product_id
JOIN warranty w ON s.sale_id = w.sale_id
WHERE p.launch_date >= CURRENT_DATE - INTERVAL 2 YEAR
GROUP BY p.product_name
ORDER BY total_claims DESC;

-- 14. Months where sales exceeded threshold in USA

SELECT
    DATE_FORMAT(s.sale_date, '%Y-%m') AS month,
    SUM(s.quantity) AS units_sold
FROM sales s
JOIN stores st ON s.store_id = st.store_id
WHERE st.country = 'United States'
AND s.sale_date BETWEEN '2022-01-01' AND '2024-12-31'
GROUP BY month
ORDER BY month;


-- 15. Product category with most warranty claims

SELECT
    c.category_name,
    COUNT(w.claim_id) AS total_claims
FROM warranty w
JOIN sales s ON w.sale_id = s.sale_id
JOIN products p ON s.product_id = p.product_id
JOIN category c ON p.category_id = c.category_id
WHERE w.claim_date >= CURRENT_DATE - INTERVAL 2 YEAR
GROUP BY c.category_name
ORDER BY total_claims DESC;

-- 16. Percentage chance of warranty claim per country

SELECT
    st.country,
    COUNT(s.sale_id) AS total_sales,
    COUNT(w.claim_id) AS total_claims,
    ROUND(
        COUNT(w.claim_id) * 100.0 / COUNT(s.sale_id),
    2) AS claim_percentage
FROM sales s
JOIN stores st ON s.store_id = st.store_id
LEFT JOIN warranty w ON s.sale_id = w.sale_id
GROUP BY st.country
ORDER BY claim_percentage DESC;

-- 17. Year-over-year growth ratio for each store

WITH yearly_sales AS (
SELECT
    st.store_name,
    EXTRACT(YEAR FROM s.sale_date) AS year,
    SUM(p.price * s.quantity) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN stores st ON s.store_id = st.store_id
GROUP BY st.store_name, year
),

growth AS (
SELECT
    store_name,
    year,
    total_sales,
    LAG(total_sales) OVER(
        PARTITION BY store_name ORDER BY year
    ) AS last_year_sales
FROM yearly_sales
)

SELECT
    store_name,
    year,
    last_year_sales,
    total_sales,
    ROUND(
        (total_sales - last_year_sales) * 100.0 / last_year_sales,
    2) AS yoy_growth_percentage
FROM growth
WHERE last_year_sales IS NOT NULL;

-- 18. Warranty claims by price segment

SELECT
CASE
    WHEN p.price < 500 THEN 'Low Cost'
    WHEN p.price BETWEEN 500 AND 1000 THEN 'Moderate Cost'
    ELSE 'High Cost'
END AS price_segment,
COUNT(w.claim_id) AS total_claims
FROM warranty w
JOIN sales s ON w.sale_id = s.sale_id
JOIN products p ON s.product_id = p.product_id
WHERE w.claim_date >= CURRENT_DATE - INTERVAL 5 year
GROUP BY price_segment
ORDER BY total_claims DESC;

-- 19. Store with highest completed claims percentage

SELECT
    st.store_name,
    COUNT(CASE WHEN w.repair_status = 'Completed' THEN 1 END) * 100.0 
    / COUNT(w.claim_id) AS completion_percentage
FROM warranty w
JOIN sales s ON w.sale_id = s.sale_id
JOIN stores st ON s.store_id = st.store_id
GROUP BY st.store_name
ORDER BY completion_percentage DESC;

-- 20. Monthly running total of sales

WITH monthly_sales AS (
    SELECT
        s.store_id,
        DATE_FORMAT(s.sale_date, '%Y-%m-01') AS month,
        SUM(p.price * s.quantity) AS total_sales
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    WHERE s.sale_date >= CURRENT_DATE - INTERVAL 4 YEAR
    GROUP BY s.store_id, month
)

SELECT
    store_id,
    month,
    total_sales,
    SUM(total_sales) OVER (
        PARTITION BY store_id
        ORDER BY month
    ) AS running_total
FROM monthly_sales;



