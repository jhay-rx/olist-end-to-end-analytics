# Olist E-Commerce Shipping Performance Analysis

## 1. Project Overview
   #### Objective
   The objective of this project is to develop an end-to-end data pipeline and business intelligence solution using the Brazilian E-Commerce Public Dataset by Olist. Python and Pandas are used for data cleaning, transformation, and preparation, while MySQL is used to implement a structured dimensional data warehouse. SQL transformations and analytical views are then used to prepare the data for Power BI, where interactive dashboards are developed to evaluate sales, delivery performance, seller performance, and other key business metrics.
## 2. Business Questions
   #### Shipping Efficiency
   + Which seller has the fastest and the slowest average delivery time?
   + How long does the delivery take by state or region?
   + How often are orders delivered before or after the estimated delivery date?
   #### Payment Method Performance
   + Which payment methods generate the highest sales?
   + Do customers using certain payment methods spend more?
   + How are payment installments distributed across orders?
   #### Product Review Quality Gap
   + Which product categories generate high sales but receive poor reviews?
   + Are there categories with excellent ratings but relatively low sales?
   + What products should be prioritized for quality improvements?
   #### Customer Retention
   + How many customers are repeat buyers versus one-time buyers?
   + Which regions have the highest customer retention?
   + How long does it take customers to place another order?
## 3. Dataset
   The dataset was extracted from kaggle. It is Brazilian E-Commerse Public dataset of orders at Olist Store. It is comprised of over 100,000 orders from late 2016 to early 2018 from various Brazilian Marketplace. The dataset contains information about orders, customers, sellers, products, payments, reviews, and geographic locations.

   The dataset consists of multiple related CSV files, which were used as the raw source data for the project's data pipeline. These datasets were cleaned and transformed using Python before being loaded into a MySQL database for structured storage and analysis.

   The main datasets used in this project include:
   + Orders
   + Order Items
   + Customers
   + Sellers
   + Products
   + Payments
   + Reviews
   + Geolocation

   Source: [Brazilian E-Commerce Public Dataset by Olist — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)


## 4. Data Preparation
   ### 4.1 Data Cleaning
   ### 4.2 Geolocation Aggregation
   ### 4.3 Delivery Calculations

## 5. Data Modeling
   ### 5.1 Fact Tables
   ### 5.2 Dimension Tables
   ### 5.3 Relationships

## 6. SQL Transformation
   ### 6.1 vw_sales_analysis
   ### 6.2 Data Quality Issues

## 7. Power BI Dashboard
   ### 7.1 KPI Metrics
   ### 7.2 Seller Performance
   ### 7.3 Delivery Status
   ### 7.4 Monthly Trends

## 8. Key Insights

## 9. Challenges and Solutions

## 10. Conclusion

## 11. Tools Used