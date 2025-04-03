/*
You work for an e-commerce company that needs to update its product inventory database. The database has a table called products with the following structure:

products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    last_updated DATE
)
Tasks
Stock Update: The company just received a shipment of 25 units for product ID 105. Update the stock quantity and set the last_updated date to today.

Discontinued Products: Delete all products from the "Legacy Electronics" category as they're being discontinued.

Price Adjustment: Increase the price by 10% for all products in the "Premium" category that currently have a price below $100.

New Arrivals: Insert three new products that just arrived:

Product ID 501: "Wireless Charging Pad", "Electronics", $29.99, 50 units

Product ID 502: "Organic Cotton T-Shirt", "Apparel", $24.95, 100 units

Product ID 503: "Stainless Steel Water Bottle", "Accessories", $19.99, 75 units

Clearance Sale: For all products with stock_quantity over 100 that haven't been updated in the last 6 months, reduce the price by 20% and set last_updated to today.

Write SQL statements to accomplish each of these tasks. Perform them in the order listed to ensure proper data manipulation.
*/

UPDATE products
SET stock_quantity = stock_quantity + 25, last_updated = '2025/04/03'
WHERE product_id = 105;


DELETE
FROM products
WHERE category = 'Legacy Electronics';

UPDATE products
SET price = price * 1.1
WHERE category = 'Premium' AND price < 100;

START TRANSACTION;
LOCK TABLE products WRITE;
INSERT INTO products
VALUES
(501, 'Wireless Charging Pad', 'Electronics', 29.99, 50, NOW()),
(502, 'Organic Cotton T-Shirt', 'Apparel', 24.95, 100, NOW()),
(503, 'Stainless Steel Water Bottle', 'Accessories', 19.99, 75, NOW());
UNLOCK TABLES;
COMMIT;

UPDATE products
SET price=price*0.8, last_updated = NOW()
WHERE stock_quantity > 100 AND last_updated < '2024/10/03';
