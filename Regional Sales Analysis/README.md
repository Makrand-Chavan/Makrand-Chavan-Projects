# Regional Sales Analysis

## Project Overview

Regional Sales Analysis is a data analytics project focused on understanding sales performance across different regions, products, channels, and customer segments. 

The project uses Python for Exploratory Data Analysis (EDA) and Power BI dashboards to identify trends in revenue, profitability, and regional performance, enabling better strategic and operational decisions.

The primary objectives of this project are to:

• Identify regional revenue and profit patterns

• Analyze product and channel performance

• Understand pricing, margins, and customer behavior

• Support decision-making using interactive dashboards

## Python EDA
## Data Understanding and Preparation

The dataset consists of multiple tables including sales transactions, customers, products, regions, and budgets. These datasets were merged to form a consolidated analytical dataset containing revenue, cost, profit, region, and product information.

During preprocessing:

• Missing values were checked and handled

• Data types were corrected

• Columns were standardized and renamed

• Additional calculated fields such as profit and profit margin were created

This preparation ensured the dataset was suitable for time-series and regional analysis.

## Revenue and Seasonal Trends

Monthly sales analysis revealed that revenue follows a consistent seasonal pattern. Sales typically cycle within a stable range and show recurring peaks and dips across months.

Key observations:

• Revenue peaks often occur during late spring and early summer

• January shows strong performance followed by a temporary dip

• Mid-year recovery indicates seasonal demand patterns

• A noticeable revenue drop in early 2017 suggests a potential external or operational factor affecting sales

These patterns help businesses plan inventory, marketing campaigns, and forecasting models.

## Product Performance Insights

Top-performing products contribute a significant share of total revenue, indicating revenue concentration among a few high-demand products.

Insights observed:
• A few products dominate revenue generation
• Mid-tier products show similar performance levels
• Lower-performing products indicate opportunities for pricing, bundling, or marketing improvements

Focusing on mid-tier products could significantly improve total revenue.

## Profitability and Margin Analysis

Profit and profit margin calculations revealed that margins are generally consistent across products and pricing levels.

Key insights:

• Profit margins commonly fall between 18% and 60%

• No strong correlation between unit price and margin percentage

• Horizontal clustering suggests standardized pricing strategies

• Some low-margin outliers may indicate inefficiencies or discounting

Monitoring such anomalies helps improve pricing strategies.

## Channel Performance Analysis

Sales distribution across channels showed a strong dependence on wholesale transactions.

Findings:
• Wholesale contributes the largest share of total revenue
• Distributor channel contributes a moderate share
• Export contributes the smallest share but provides diversification potential

This indicates a reliance on bulk domestic sales, highlighting an opportunity to grow export channels.

## Order Value and Customer Behavior

Order value distribution showed that most transactions fall within a moderate spending range, while a few high-value orders contribute significantly to revenue.

Insights:

• Majority of orders fall within a typical spending band

• Distribution is right-skewed due to high-value orders

• Large transactions represent a small portion of total orders

This helps in identifying premium customer segments.

## Pricing and Product Variability

Unit price analysis across products revealed variability and presence of outliers.

Observations:

• Some products show significant price spikes due to bulk orders or premium versions

• Very low price outliers may represent promotions or test items

• Removing outliers improves accuracy in margin analysis

Understanding pricing behavior helps maintain stable profitability.

# Dashboard Explanation
## Home Dashboard (Executive Overview & Trends)

The Home Dashboard provides a high-level overview of overall business performance. It displays key metrics such as total revenue, total profit, profit margin, total orders, and revenue per order, allowing stakeholders to quickly assess overall performance.

Time-series charts show monthly revenue and profit trends, helping identify seasonal peaks and dips. Additional visualizations such as order value distribution and unit price versus margin help understand customer spending patterns and pricing efficiency.

## Product & Channel Performance Dashboard

This dashboard focuses on identifying top-performing products and evaluating channel efficiency. It highlights best-selling products, high-margin products, and the relationship between revenue and profitability.

Channel distribution visuals show where revenue and profit originate, helping decision-makers understand which channels drive the most value and which require optimization.

## Geographic & Customer Insights Dashboard

The Geographic Dashboard analyzes performance across states and regions. It identifies top customers, top-performing states, and regional profit margins.

Regional charts provide insights into where revenue is concentrated and which regions generate higher margins. The geographic map visualization helps stakeholders quickly identify strong and weak markets for expansion or strategic focus.
