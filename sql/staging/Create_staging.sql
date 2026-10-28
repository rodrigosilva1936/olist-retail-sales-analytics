CREATE DATABASE OlistRetailDW;
GO


USE OlistRetailDW;
GO

CREATE SCHEMA stg;
GO

CREATE SCHEMA dw;
GO


-- Creating Tables (We´re not using Primary keys because we will add them in the SSIS and we´re using NVARCHAR to preserve the original values)

CREATE TABLE stg.Customers(
	customer_id NVARCHAR(50),
	costumer_unique_id  NVARCHAR(50),  
	customer_zip_code_prefix  NVARCHAR(10),
	customer_city NVARCHAR(100),
	customer_state NVARCHAR(10))
;

CREATE TABLE stg.Geo_Location (
	geolocation_zip_code_prefix NVARCHAR(50),
	geolocation_lat NVARCHAR(50),
	geolocation_lng NVARCHAR(50),
	geolocation_city NVARCHAR(50),
	geolocation_state NVARCHAR(3))
;

CREATE TABLE stg.Order_Items (
	order_id NVARCHAR(50),
	order_item_id NVARCHAR(10),
	product_id NVARCHAR(50),
	seller_id NVARCHAR(50),
	shipping_limit_date NVARCHAR(30),
	price NVARCHAR(10),
	freight_value NVARCHAR(10))
;


CREATE TABLE stg.Order_Payments(
	order_id NVARCHAR(50),
	payment_sequential NVARCHAR(3),
	payment_type NVARCHAR(50),
	payment_installments NVARCHAR(10),
	payment_value NVARCHAR(10))
;


CREATE TABLE stg.Order_Reviews(
	review_id NVARCHAR(50),
	order_id NVARCHAR(50),
	review_score NVARCHAR(5),
	review_coment_title NVARCHAR(30),
	review_coment_message NVARCHAR(150),
	review_creation_date NVARCHAR(30),
	review_answer_timestamp NVARCHAR(30))
;

CREATE TABLE stg.Orders(
	order_id NVARCHAR(50),
	customer_id NVARCHAR(50),
	order_status NVARCHAR(20),
	order_purchase_timestamp NVARCHAR(30),
	order_approved_at NVARCHAR(30),
	order_delivered_carrier_date NVARCHAR(30),
	order_delivered_customer_date NVARCHAR(30),
	order_estimated_delivery_date NVARCHAR(30))
;


CREATE TABLE stg.Products(
	product_id NVARCHAR(50),
	product_category_name NVARCHAR(50),
	product_name_lenght NVARCHAR(50),
	product_description_lenght NVARCHAR(10),
	product_photos_qty NVARCHAR(10),
	product_weight_g NVARCHAR(20),
	product_lenght_cm NVARCHAR(10),
	product_height_cm NVARCHAR(10),
	product_width_cm NVARCHAR(10))
;

CREATE TABLE stg.Sellers(
	seller_id NVARCHAR(50),
	seller_zip_code_prefix NVARCHAR(50),
	seller_city NVARCHAR(50),
	seller_state NVARCHAR(3))
;


CREATE TABLE stg.Product_Category_Translation(
	product_catgory_name NVARCHAR(100),
	product_category_name_english NVARCHAR(150))
;

-- testing if the tables are all set
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'stg'
ORDER BY TABLE_NAME DESC

-- testing if the Loading phase of the SSIS worked perfectly
SELECT COUNT(*) as TotalCustomers
FROM stg.Customers

SELECT TOP 10 *
FROM stg.Customers

SELECT COUNT(*) as TotalRows
FROM stg.Geo_Location

SELECT TOP 10 *
FROM stg.Geo_Location
;

ALTER TABLE stg.Order_Reviews
ALTER COLUMN review_coment_message NVARCHAR(MAX) NULL;
GO