-- testing if the Loading phase of the SSIS worked perfectly

SELECT COUNT(*) AS TotalRows 
FROM stg.Customers
UNION ALL 
SELECT COUNT(*) 
FROM stg.Orders
UNION ALL
SELECT COUNT(*) 
FROM stg.Order_Items
UNION ALL
SELECT COUNT(*) 
FROM stg.Order_Payments
UNION ALL
SELECT COUNT(*) 
FROM stg.Order_Reviews
UNION ALL
SELECT COUNT(*) 
FROM stg.Geo_Location
UNION ALL
SELECT COUNT(*)
FROM stg.Products
UNION ALL
SELECT COUNT(*)
FROM stg.Product_Category_Translation
UNION ALL
SELECT COUNT(*)
FROM stg.Product_Category_Translation


SELECT TOP 10 *
FROM stg.Orders

SELECT COUNT(*) AS Nº_vendas, seller_id
FROM stg.Sellers
GROUP BY seller_id
HAVING COUNT(*) > 1

SELECT COUNT(*)
FROM stg.Sellers
WHERE seller_id = ''

SELECT TOP 10 *
FROM stg.Order_Reviews


-- Verify the relationships between tables
-- ORDERS AND CUSTOMERS
SELECT TOP 10 o.order_id, o.customer_id, c.customer_city
FROM stg.Orders o INNER JOIN stg.Customers c
ON o.customer_id = c.customer_id

SELECT o.order_id, o.customer_id, c.customer_city
FROM stg.Orders o LEFT JOIN stg.Customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL

-- ORDERS AND PAYMENTS

SELECT TOP 10 o.order_id, op.payment_sequential
FROM stg.Orders o INNER JOIN stg.Order_Payments op
ON o.order_id = op.order_id

SELECT TOP 10 o.order_id, op.payment_sequential, o.order_status
FROM stg.Orders o LEFT JOIN stg.Order_Payments op
ON o.order_id = op.order_id
WHERE op.order_id IS NULL

SELECT
    order_id,
    order_status,
    order_purchase_timestamp,
    order_delivered_customer_date
FROM stg.Orders
WHERE order_id = 'bfbd0f9bdef84302105ad712db648a6c';

SELECT *
FROM stg.Order_Items
WHERE order_id = 'bfbd0f9bdef84302105ad712db648a6c';

-- We have verified that the payment table has a composite PK (order_id, payment_sequential) and that there is an order which doesn´t have a payment associaded with it. 


-- ORDERS AND REVIEWS

SELECT TOP 10 o.order_id, r.review_id, r.review_creation_date
FROM stg.Orders o INNER JOIN stg.Order_Reviews r
ON o.order_id = r.order_id


SELECT TOP 10 o.order_id, r.review_id, r.review_creation_date
FROM stg.Orders o LEFT JOIN stg.Order_Reviews r
ON o.order_id = r.order_id
WHERE r.order_id IS NULL


-- ORDERS AND ITEMS 
SELECT *
FROM stg.Order_Items

SELECT TOP 10 o.order_id, i.order_item_id, o.order_status
FROM stg.Orders o LEFT JOIN stg.Order_Items i 
ON  o.order_id = i.order_id
WHERE i.order_id IS NULL


-- ITEMS AND PRODUCTS

SELECT *
FROM stg.Products

SELECT TOP 10 p.product_id, i.order_item_id, o.order_status
FROM stg.Orders o INNER JOIN stg.Order_Items i ON o.order_id = i.order_id
LEFT JOIN stg.Products p ON p.product_id = i.product_id
WHERE p.product_id IS NULL

-- ITEMS AND SELLERS
SELECT *
FROM stg.Sellers

SELECT TOP 10 s.seller_id, i.order_item_id, o.order_status
FROM stg.Orders o INNER JOIN stg.Order_Items i ON o.order_id = i.order_id
LEFT JOIN stg.Sellers s ON s.seller_id = i.seller_id
WHERE s.seller_id IS NULL
