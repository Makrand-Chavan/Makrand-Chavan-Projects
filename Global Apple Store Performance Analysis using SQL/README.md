# Global Apple Store Performance Analysis – Analyzing Millions of Sales Rows
![Apple Store](https://github.com/Makrand-Chavan/Makrand-Chavan-Projects/blob/main/Global%20Apple%20Store%20Performance%20Analysis%20using%20SQL/Apple-Store.jpg)

## Project Overview

This project showcases advanced SQL querying techniques through the analysis of over 1 million rows of Apple retail sales data. The dataset includes information about products, stores, sales transactions, and warranty claims across various Apple retail locations globally.

By solving a variety of business problems—from basic to complex—you can demonstrate your ability to write sophisticated SQL queries that extract meaningful insights from large datasets.

This project is ideal for data analysts looking to strengthen their SQL skills using large-scale, real-world structured data.

## Entity Relationship Diagram (ERD)
!Global Apple Store Performance Analysis using SQL/ERD For DataBase.png

---
![EDR](https://github.com/Makrand-Chavan/Makrand-Chavan-Projects/blob/main/Global%20Apple%20Store%20Performance%20Analysis%20using%20SQL/ERD%20For%20DataBase.png)
## What’s Included

- 100 SQL practice problems covering major SQL topics  
- 20 advanced SQL query solutions  
- 5 structured tables simulating a real retail analytics environment  
- Query performance tuning concepts  
- A portfolio-ready case study demonstrating large-scale data analysis  

---

## Database Schema

The project uses five main tables:

### 1. stores
Contains information about retail stores.

| Column Name | Description |
|--------|--------|
| store_id | Unique identifier for each store |
| store_name | Name of the store |
| city | City where the store is located |
| country | Country of the store |

---

### 2. category
Holds product category information.

| Column Name | Description |
|--------|--------|
| category_id | Unique identifier for each category |
| category_name | Name of the category |

---

### 3. products
Details about products.

| Column Name | Description |
|--------|--------|
| product_id | Unique identifier for each product |
| product_name | Name of the product |
| category_id | References the category table |
| launch_date | Product launch date |
| price | Product price |

---

### 4. sales
Stores sales transactions.

| Column Name | Description |
|--------|--------|
| sale_id | Unique identifier for each sale |
| sale_date | Date of the sale |
| store_id | References the store table |
| product_id | References the product table |
| quantity | Units sold |

---

### 5. warranty
Contains warranty claim data.

| Column Name | Description |
|--------|--------|
| claim_id | Unique identifier for each claim |
| claim_date | Date the claim was filed |
| sale_id | References the sales table |
| repair_status | Status of claim (Paid Repaired, Warranty Void, etc.) |

---

## Objectives

The project is divided into three difficulty levels.

### Easy to Medium

1. Find the number of stores in each country.  
2. Calculate total units sold by each store.  
3. Count sales in December 2023.  
4. Identify stores with no warranty claims.  
5. Calculate the percentage of claims marked "Warranty Void".  
6. Find the store with the highest units sold in the last year.  
7. Count unique products sold in the last year.  
8. Find the average price in each category.  
9. Count warranty claims filed in 2020.  
10. Determine the best-selling day for each store.

---

### Medium to Hard

11. Least-selling product in each country per year.  
12. Warranty claims filed within 180 days of purchase.  
13. Claims for products launched in the last two years.  
14. Months where sales exceeded 5,000 units in the USA.  
15. Category with the most warranty claims in the last two years.

---

### Complex

16. Percentage probability of warranty claims per country.  
17. Year-over-year growth ratio for each store.  
18. Correlation between product price and warranty claims.  
19. Store with highest percentage of "Paid Repaired" claims.  
20. Monthly running total of sales per store over the past four years.

---



## Skills Demonstrated

- Complex joins and aggregations  
- Window functions  
- Time-series analysis  
- Data segmentation  
- Correlation analysis  
- Real-world business problem solving  

---

## Dataset Details

- Over 1 million rows of sales data  
- Multi-year time span  
- Multi-country retail coverage  

---

## Conclusion

This project demonstrates the ability to work with large-scale datasets, business-driven SQL problems, and analytical reporting. 
It serves as a strong portfolio project for Data Analyst and Business Analyst roles.

---

## Author

### Makrand Chavan
Aspiring Data Analyst
