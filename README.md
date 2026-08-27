# Olist E-Commerce end-to-end Analytics

## 1. Project Overview
   #### Objective
   The objective of this project is to develop an end-to-end data pipeline and business intelligence solution using the Brazilian E-Commerce Public Dataset by Olist. Python and Pandas are used for data cleaning, transformation, and preparation, while MySQL is used to implement a structured dimensional data warehouse. SQL transformations and analytical views are then used to prepare the data for Power BI, where interactive dashboards are developed to evaluate sales, delivery performance, seller performance, and other key business metrics.

#### Tech Stack:
**Data Processing:** Python, Pandas  
**Database:** MySQL, SQL  
**Business Intelligence:** Power BI, DAX
## 2. Business Questions
   #### Shipping Efficiency
   + Which seller has the fastest and the slowest average delivery time?
   + How long does the delivery take by state or region?
   + How often are orders delivered before or after the estimated delivery date?
   #### Payment Method Performance
   + Which payment methods generate the highest sales?
   + Do customers using certain payment methods spend more?
   + How are payment installments distributed across orders?

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


## 4. Project Architecture
<p align="center">
  <img src="docs\OlistProjectArchitecture.png" width="500" alt="Olist project architecture">
</p>

<!-- ![Project Architecture](docs\OlistProjectArchitecture.png) -->

## 5. Data Modeling

[Data Model Diagram]

Short explanation of the fact/dimension structure.

## 6. Business Analysis

### Shipping Efficiency
Short explanation + dashboard screenshot

### Payment Method Performance
Short explanation + dashboard screenshot

## 7. Key Insights

Bullet points of findings.

## 8. Challenges & Data Limitations

Short explanations of important issues encountered.