CREATE DATABASE OlistRetailDW;
GO


USE OlistRetailDW;
GO

CREATE SCHEMA stg;
GO

CREATE SCHEMA dw;
GO


-- Creating Tables (We´re not using Primary keys because we will add them in the SSIS, and NVARCHAR to preserve the original values)

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