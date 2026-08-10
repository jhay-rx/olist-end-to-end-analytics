CREATE TABLE dim_customer (
    customer_id VARCHAR(32) NOT NULL PRIMARY KEY , 
    customer_unique_id VARCHAR(32),
    zip_code_prefix VARCHAR(5),
    city VARCHAR(32),
    state VARCHAR(2),
    
	CONSTRAINT fk_customer_geo
		FOREIGN KEY (zip_code_prefix)
		REFERENCES dim_geo(zip_code_prefix)
);

CREATE TABLE dim_product (
    product_id VARCHAR(32) NOT NULL PRIMARY KEY,
    category_name_english VARCHAR(39),
    category_name VARCHAR(50),
    name_length INT,
    description_length INT,
    photos_qty INT,
    weight_g DECIMAL(8,2),
	length_cm DECIMAL(6,2),
	height_cm DECIMAL(6,2),
	width_cm DECIMAL(6,2)
);

CREATE TABLE dim_seller (
    seller_id VARCHAR(32) NOT NULL PRIMARY KEY,
    zip_code_prefix VARCHAR(5),
    city VARCHAR(40),
    state VARCHAR(2),
    
	CONSTRAINT fk_seller_geo
		FOREIGN KEY (zip_code_prefix)
		REFERENCES dim_geo(zip_code_prefix)
);

CREATE TABLE dim_date (
    date_key INT NOT NULL PRIMARY KEY,
    date DATE, -- ONLY NEEDS DATE NOT TIME
    year SMALLINT, -- YEARS LIKE 2016-2025 CAN EASILY FIT HERE
    month TINYINT, -- VALUES ARE ONLY 1-12
    month_name VARCHAR(9), -- LONGEST ENGLISH CHARACTER MONTH IS SEPTEMBER 
    quarter TINYINT, -- VALUES ARE ONLY 1-4
    day TINYINT, -- VALUES ARE ONLY 1-31
    day_name VARCHAR(9) -- LONGEST ENGLISH CHARACTER MONTH IS WEDNESDAY
);

CREATE TABLE dim_geo (
    zip_code_prefix VARCHAR(5) NOT NULL PRIMARY KEY,
    lat FLOAT,
    lang FLOAT,
    city VARCHAR(40),
    state VARCHAR(2)	
);

CREATE TABLE fact_orders (
    order_id VARCHAR(32) NOT NULL PRIMARY KEY,
    customer_id VARCHAR(32) NOT NULL ,
    status VARCHAR(11),
    purchase_timestamp DATETIME,
    purchase_date_key INT NOT NULL,
    approved_at DATETIME,
    approved_at_key INT, 
    delivered_carrier_date DATETIME,
    delivered_carrier_date_key INT ,
    delivered_customer_date DATETIME,
    delivered_customer_date_key INT ,
    estimated_delivery_date DATETIME,
    estimated_delivery_date_key INT NOT NULL,
    delivery_days DECIMAL(6,2),  -- default:
    estimated_days DECIMAL(6,2),   -- default:
    delivery_delay_days DECIMAL(6,2),
    
    CONSTRAINT fk_orders_customer
		FOREIGN KEY (customer_id)
        REFERENCES dim_customer(customer_id),
	
    CONSTRAINT fk_orders_purchase_date
		FOREIGN KEY (purchase_date_key)
        REFERENCES dim_date(date_key),
        
    CONSTRAINT fk_orders_approved_date
		FOREIGN KEY (approved_at_key)
        REFERENCES dim_date(date_key),
        
    CONSTRAINT fk_orders_delivered_carrier_date
		FOREIGN KEY (delivered_carrier_date_key)
        REFERENCES dim_date(date_key),
        
    CONSTRAINT fk_orders_delivered_customer_date
		FOREIGN KEY (delivered_customer_date_key)
        REFERENCES dim_date(date_key),
        
    CONSTRAINT fk_orders_estimated_delivery_date
		FOREIGN KEY (estimated_delivery_date_key)
        REFERENCES dim_date(date_key)

);

CREATE TABLE fact_sales (
    order_item_id TINYINT NOT NULL ,
    order_id VARCHAR(32) NOT NULL ,
    product_id VARCHAR(32) NOT NULL ,
    seller_id VARCHAR(32) NOT NULL ,
    shipping_limit_date DATETIME,
    shipping_limit_date_key INT NOT NULL,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),
    PRIMARY KEY(order_item_id, order_id),
    
    CONSTRAINT fk_sales_product
		FOREIGN KEY (product_id)
        REFERENCES dim_product(product_id),
	
    CONSTRAINT fk_sales_orders
		FOREIGN KEY (order_id)
        REFERENCES fact_orders(order_id),
        
	CONSTRAINT fk_sales_seller
		FOREIGN KEY (seller_id)
        REFERENCES dim_seller(seller_id),
        
	CONSTRAINT fk_sales_date
		FOREIGN KEY (shipping_limit_date_key)
        REFERENCES dim_date(date_key)
);

CREATE TABLE fact_payments (
    sequential TINYINT NOT NULL ,
    order_id VARCHAR(32) NOT NULL ,
    payment_type VARCHAR(11),
    installments TINYINT,
    payment_value DECIMAL(10,2),
	PRIMARY KEY (sequential, order_id),
    
    CONSTRAINT fk_payments_orders
		FOREIGN KEY (order_id)
        REFERENCES fact_orders(order_id)
);

CREATE TABLE fact_reviews (
    review_id VARCHAR(32),
    order_id VARCHAR(32),
    score TINYINT,
    comment_title VARCHAR(26),
    comment_message TEXT,
    creation_date DATETIME,
    creation_date_key INT, 
    answer_timestamp DATETIME,
    answer_timestamp_key INT, 
    PRIMARY KEY(review_id, order_id),
	CONSTRAINT fk_review_orders
		FOREIGN KEY (order_id)
        REFERENCES fact_orders(order_id),
        
	CONSTRAINT fk_review_creation_date_orders
		FOREIGN KEY (creation_date_key)
        REFERENCES dim_date(date_key),
        
	CONSTRAINT fk_review_answer_timestamp_orders
		FOREIGN KEY (answer_timestamp_key)
        REFERENCES dim_date(date_key)
);