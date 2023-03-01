/* 1 */
SELECT COUNT(*) FROM orders
GROUP BY product_id
HAVING product_id = (SELECT id FROM product WHERE from_country = 'Singapore');

/* 2 */
SELECT COUNT(*) FROM orders
WHERE customer_id IS NULL;

/* 3 */
SELECT DISTINCT product_name FROM product WHERE created_date BETWEEN '2006-01-01' AND '2006-12-31';

/* 4 */
SELECT MAX(total_price) AS Max_Bill FROM orders;
SELECT MIN(total_price) AS Min_Bill from orders;

/* 5 */
SELECT AVG(total_price) AS AVG_Bill from orders WHERE paid_date BETWEEN '2006-01-01' AND '2006-12-31';

/* 6 */
SELECT SUM(total_price) AS Total_Bill from orders WHERE paid_date BETWEEN '2006-01-01' AND '2006-12-31';

/* 7 */-----------------
SELECT id, order_code FROM orders GROUP BY id having total_price = MAX(total_price);