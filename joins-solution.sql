--//TASKS\\--

--Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;

--Get all orders and their line items (orders, quantity and product).
SELECT "orders".id, "line_items".quantity, "products".description FROM "orders"
JOIN "line_items" ON "orders".id = "line_items".order_id
JOIN "products" ON "products".id = "line_items".product_id;

--Which warehouses have cheetos?
SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'cheetos';

--Which warehouses have diet pepsi?
SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi';

--Get the number of orders for each customer.
--NOTE:It is OK if those without orders are not included in results.
SELECT "customers".first_name, count("orders")  FROM "customers"
JOIN "addresses" ON "addresses".customer_id = "customers".id
JOIN "orders" ON "orders".address_id = "addresses".id
GROUP BY "customers".first_name;

--How many customers do we have?
SELECT count(*) FROM "customers";

--How many products do we carry?
SELECT count(*) FROM "products";

--What is the total available on-hand quantity of diet pepsi?
SELECT "products".description, sum(on_hand) FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi'
GROUP BY "products".description;

--//STRETCH||--

--How much was the total cost for each order?

--How much has each customer spent in total?

--How much has each customer spent in total? Customers who have spent $0 should still show up in the table. 
--It should say 0, not NULL (research coalesce).