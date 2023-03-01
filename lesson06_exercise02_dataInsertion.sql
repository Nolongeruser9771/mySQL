INSERT INTO category (category_code, category_name, created_date, updated_date)
VALUES
    ('49884-235', 'Amblyrhynchus cristatus', now(), now()),
    ('65649-432', 'Antidorcas marsupialis', now(), now()),
    ('68647-206', 'Ara ararauna', now(), now()),
    ('68647-206', 'Ara ararauna', now(), now()),
    ('68647-206', 'Ara ararauna', now(), now());

INSERT INTO supplier (supplier_code, supplier_name, image, created_date, updated_date)
VALUES
   ('49288-0870', 'Corvus brachyrhynchos', 'data:image/png;base64,iVBORw0KGgoAAAANSUhE',now(), now()),
   ('64809-104', 'Gymnorhina tibicen', 'data:image/png;base64,iVBORw0KG', now(), now()),
	('63323-258', 'Ursus americanus', 'data:image/png;base64,iVBORw0KGgo', now(), now()),
	('63323-258', 'Ursus americanus', 'data:image/png;base64,iVBORw0KGgo', now(), now()),
	('63323-258', 'Ursus americanus', 'data:image/png;base64,iVBORw0KGgo', now(), now());

INSERT INTO product (product_code, product_name,standard_price,from_country, created_date, updated_date, category_id, supplier_id, discount_id)
VALUES
('Stork, greater', 'kẹo',700,'Trung Quoc', '2006-10-10', now(), 1, 1, 1),
('White-faced', 'bánh',800,'Trung Quoc', '2006-10-10', now(), 2, 2, 2),
('Admiral, indian', 'bút', 1000,'Thai Lan', '2006-10-10', now(), 3, 3, 3),
('Admiral, indian', 'bút', 600, 'Singapore', '2006-10-10', now(), 3, 3, 3),
('Admiral, indian', 'bút', 800,'viet nam', '2006-10-10', now(), 3, 3, 3);

INSERT INTO customers (username, password, first_name, last_name, created_date, updated_date)
VALUES
('tien1', 'fdfdf39', 'OPANA', 'Ronstring', now(), now()),
('tien2', 'fdf34127', 'Night ', 'Home Ing', now(), now()),
('tien3', 'dsafsf5', 'Vida Mia ', 'Pannier', now(), now()),
('tien4', 'grggr5', 'Vida Mia ', 'Pannier', now(), now()),
('tien5', 'fvfvfv5', 'Vida Mia ', 'Pannier', now(), now());

INSERT INTO orders (total_price, paid_date, customer_id)
VALUES
('88743', '2006-10-10', 1),
('9106', '2007-10-10', 1),
('2984', '2007-10-10', 2),
('2984', '2006-10-10', 3),
('2984', '2006-11-10', 3);

INSERT INTO order_detail (order_id, product_id, quantity, price_when_buying)
VALUES
(1, 1, 10, 700),
(1, 2, 10, 700),
(1, 3, 10, 700),
(2, 3, 10, 700),
(3, 3, 10, 700);