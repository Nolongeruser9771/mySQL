CREATE TABLE if NOT EXISTS USER(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	gender ENUM('MALE', 'FEMALE'),
	email VARCHAR(100) NOT NULL,
	birth_day DATE,
	avartar VARCHAR(100),
	phone VARCHAR(15),
	address VARCHAR(100),
	city VARCHAR(100),
	country VARCHAR(100),
	code_active VARCHAR(10) NOT NULL,
	status ENUM('ENABLE', 'DISABLE') NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

CREATE TABLE if NOT EXISTS role (
	id INT PRIMARY KEY AUTO_INCREMENT,
	role_name VARCHAR(100) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

CREATE TABLE if NOT EXISTS user_role (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	user_id BIGINT NOT NULL,
	role_id INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES user(id),
	FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE if NOT EXISTS permission (
	id INT PRIMARY KEY AUTO_INCREMENT,
	permission_name VARCHAR(100) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

CREATE TABLE if NOT EXISTS role_permission (
	id INT PRIMARY KEY AUTO_INCREMENT,
	role_id INT NOT NULL,
	permission_id INT NOT NULL,
	FOREIGN KEY (role_id) REFERENCES role(id),
	FOREIGN KEY (permission_id) REFERENCES permission(id)
);

CREATE TABLE if NOT EXISTS category (
	id INT PRIMARY KEY AUTO_INCREMENT,
	category_code VARCHAR(255) NOT NULL,
	category_name VARCHAR(255) NOT NULL,
	created_date DATETIME NOT NULL,
	updated_date DATETIME NOT NULL
);

CREATE TABLE if NOT EXISTS supplier (
	id INT PRIMARY KEY AUTO_INCREMENT,
	supplier_code VARCHAR(255) NOT NULL,
	image VARCHAR(255),
	supplier_name VARCHAR(255) NOT NULL,
	created_date DATETIME NOT NULL,
	updated_date DATETIME NOT NULL
);

CREATE TABLE if NOT EXISTS product (
	id INT PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(255) NOT NULL,
	product_code VARCHAR(255) NOT NULL,
	description VARCHAR(255),
	from_country VARCHAR(255) NOT NULL,
	is_new ENUM('NEW', 'NOT_NEW'),
	category_id INT,
	supplier_id INT,
	created_date DATETIME NOT NULL,
	updated_date DATETIME NOT NULL,
	FOREIGN KEY (category_id) REFERENCES category(id),
	FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE if NOT EXISTS product_detail (
	id INT PRIMARY KEY AUTO_INCREMENT,
	size VARCHAR(20) NOT NULL,
	image VARCHAR(255) NOT NULL,
	color VARCHAR(255) NOT NULL,
	quantity INT,
	product_id INT,
	created_date DATETIME NOT NULL,
	updated_date DATETIME NOT NULL,
	FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE if NOT EXISTS customer (
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	gender ENUM('MALE','FEMALE'),
	email VARCHAR(255),
	birthday DATETIME ,
	avartar VARCHAR(255),
	address VARCHAR(255),
	customer_status ENUM('ACTIVE', 'DEACTIVE') DEFAULT 'ACTIVE',
	created_date DATETIME NOT NULL,
	updated_date DATETIME NOT NULL
);

CREATE TABLE if NOT EXISTS orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_code VARCHAR(255) ,
	total_money FLOAT NOT NULL,
	orders_status ENUM('PENDING', 'APPROVED', 'SHIPPING', 'RECEIVED'),
	customer_id INT,
	created_date DATETIME NOT NULL,
	updated_date DATETIME ,
	FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE if NOT EXISTS order_detail (
	id INT PRIMARY KEY AUTO_INCREMENT,
	quantity INT UNSIGNED not NULL,
	total_money FLOAT NOT NULL,
	product_detail_id INT,
	order_id INT,
	created_date DATETIME NOT NULL,
	updated_date DATETIME ,
	FOREIGN KEY (product_detail_id) REFERENCES product_detail(id),
	FOREIGN KEY (order_id) REFERENCES orders(id)
);

INSERT INTO user
VALUES
	(1,'Nguyen', '123','Nguyen','Nguyen','FEMALE','nt.thaonguyen@gmail.com','1997-02-10','image1.jpg','070467870','HCM','HCM','VN','123456','DISABLE','2022-12-02','2023-02-01'),
	(2,'Hung', '1234','Hung','Nguyen','MALE','hungdung@gmail.com','1997-02-10','image2.jpg','070467870','HCM','HCM','VN','123456','DISABLE','2022-12-02','2023-02-01'),
	(3,'Bao_Bao', 'abc123','Ha','Trinh','FEMALE','trinhhan@gmail.com','1997-02-10','image3.jpg','070467870','HCM','HCM','VN','123456','DISABLE','2022-12-02','2023-02-01'),
	(4,'hung@hi', '123xyz','Nguyen','La','MALE','lantt@gmail.com','1997-02-10','image4.jpg','070467870','HCM','HCM','VN','123456','DISABLE','2022-12-02','2023-02-01'),
	(5,'NguyetNguyet', 'mooncake','Nguyet','Trinh','FEMALE','nguyentmoon@gmail.com','1997-02-10','image5.jpg','070467870','HCM','HCM','VN','123456','DISABLE','2022-12-02','2023-02-01'),
	(6,'TamTam123', '123tam','Tam','Le','MALE','shinkokoro@gmail.com','1997-02-10','image6.jpg','070467870','HCM','HCM','VN','123456','DISABLE','2022-12-02','2023-02-01'),
	(7,'Nhan', '123abcv','Nhan','Truong','FEMALE','nhan@gmail.com','1997-02-10','image7.jpg','070467870','HCM','HCM','VN','123456','DISABLE','2022-12-02','2023-02-01');
	
INSERT INTO role
VALUES
	(1,'customer','2023-01-02','2023-02-04'),
	(2,'supplier','2023-01-01','2023-02-04'),
	(3,'supplier','2023-01-03','2023-02-04'),
	(4,'supplier','2023-01-02','2023-02-05'),
	(5,'customer','2023-01-02','2023-02-07'),
	(6,'customer','2023-01-02','2023-02-08'),
	(7,'customer','2023-01-02','2023-02-04');
	
INSERT INTO user_role
VALUES
	(1, 2, 5),
	(2, 3, 3),
	(3, 3, 4),
	(4, 1, 5),
	(5, 5, 3),
	(6, 7, 7),
	(7, 2, 1);

INSERT INTO permission
VALUES
	(1, 'customer permission','2023-01-03','2023-03-01'),
	(2, 'supplier permission','2023-01-03','2023-03-01'),
	(3, 'customer permission','2023-01-03','2023-03-01'),
	(4, 'supplier permission','2023-01-03','2023-03-01'),
	(5, 'customer permission','2023-01-03','2023-03-01'),
	(6, 'customer permission','2023-01-03','2023-03-01'),
	(7, 'customer permission','2023-01-03','2023-03-01');

INSERT INTO role_permission
VALUES
	(1, 2, 4),
	(2, 1, 5),
	(3, 5, 2),
	(4, 4, 3),
	(5, 3, 1),
	(6, 7, 2),
	(7, 2, 2);	
	
INSERT INTO category
VALUES
	(1, '49884-235', 'Amblyrhynchus cristatus', NOW(), NOW()),
	(2, '65649-432', 'Antidorcas marsupialis', NOW(), NOW()),
	(3, '68647-206', 'Ara ararauna', NOW(), NOW()),
	(4, '68647-206', 'Domika', NOW(), NOW()),
	(5, '68647-206', 'Ara ararauna', NOW(), NOW()),
	(6, '68645-206', 'Ara ararauna', NOW(), NOW()),
	(7, '68647-306', 'Antidorcas marsupialis', NOW(), NOW());
	
INSERT INTO supplier
VALUES
	(1, '49288-0870', 'Corvus brachyhos', 'data:image/png;base64,iVBORw0KGg', NOW(), NOW()),
	(2, '64809-104', 'Gymnorhina tibicen', 'data:image/png;base64,iVBORw0KG', NOW(), NOW()),
	(3, '63323-258', 'Ursus americanus', 'data:image/png;base64,iVBORw0KGgo', NOW(), NOW()),
	(4, '63323-258', 'Ursus americanus', 'data:image/png;base64,iVBORw0KGgo', NOW(), NOW()),
	(5, '63323-258', 'Ursus americanus', 'data:image/png;base64,iVBORw0KGgo', NOW(), NOW()),
	(6, '63323-255', 'Arsus americanus', 'data:image/png;base64,iVBORw0KGgo', NOW(), NOW()),
	(7, '63323-252', 'Americanus', 'data:image/png;base64,iVBORw0KGgo', NOW(), NOW());

INSERT INTO product(id, product_code, product_name,from_country, created_date, updated_date, category_id, 
supplier_id )
VALUES
	(1, 'Stork, greater', 'kẹo','Trung Quoc', '2006-10-10', NOW(), 1, 1),
	(2, 'White-faced', 'bánh','Trung Quoc', '2006-10-10', NOW(), 2, 2),
	(3, 'Admiral, indian', 'bút','Thai Lan', '2006-10-10', NOW(), 3, 3),
	(4, 'Admiral, indian', 'bút', 'Singapore', '2006-10-10', NOW(), 3, 3),
	(5, 'Admiral, indian', 'bút','viet nam', '2006-10-10', NOW(), 3, 3),
	(6, 'Admiral, indian', 'bánh','viet nam', '2006-10-10', NOW(), 3, 3),
	(7, 'Admiral, indian', 'kẹo','Trung Quo', '2006-10-10', NOW(), 3, 3);
	
INSERT INTO product_detail
(id, size, image, color,quantity,created_date,updated_date,product_id)
VALUES
	(1, 'M', 'D:/image', 'blue', 700, NOW(), NOW(),1),
	(2, 'L', 'D:/image', 'green', 700, NOW(), NOW(),2),
	(3, 'XL', 'D:/image', 'red', 700, NOW(), NOW(),3),
	(4, 'S', 'D:/image', 'yellow', 700, NOW(), NOW(),4),
	(5, 'XLL', 'D:/image', 'white', 700, NOW(), NOW(),5),
	(6, 'S', 'D:/image', 'yellow', 700, NOW(), NOW(),4),
	(7, 'XXL', 'D:/image', 'white', 700, NOW(), NOW(),5);

INSERT INTO customer
VALUES
	(1, 'tien1', 'fdfdf39', 'OPANA', 'Ronstring', 'MALE', 'tien1@gmail.com', '1997-02-03', 'image1.jpg', 'HCM', 'ACTIVE', NOW(), NOW()),
	(2, 'tien2', 'fdf34127', 'Night ', 'Home Ing', 'FEMALE', 'tien2@gmail.com', '1997-02-03', 'image1.jpg', 'HCM', 'ACTIVE',NOW(), NOW()),
	(3, 'tien3', 'dsafsf5', 'Vida Mia ', 'Pannier', 'MALE', 'tien3@gmail.com', '1997-02-03', 'image1.jpg', 'HCM', 'ACTIVE',NOW(), NOW()),
	(4, 'tien4', 'grggr5', 'Vida Mia ', 'Pannier', 'FEMALE', 'tien4@gmail.com', '1997-02-03', 'image1.jpg', 'HCM', 'ACTIVE',NOW(), NOW()),
	(5, 'tien5', 'fvfvfv5', 'Vida Mia ', 'Pannier', 'MALE', 'tien5@gmail.com', '1997-02-03', 'image1.jpg', 'HCM', 'ACTIVE',NOW(), NOW()),
	(6, 'tien6', 'grggr5', 'Vida Mia ', 'Angstrong', 'FEMALE', 'tien6@gmail.com', '1997-02-03', 'image1.jpg', 'HCM', 'ACTIVE',NOW(), NOW()),
	(7, 'tien7', 'fvfvfv5', 'Vida Mia ', 'Ohm', 'MALE', 'tien7@gmail.com', '1997-02-03', 'image1.jpg', 'HCM', 'ACTIVE',NOW(), NOW());

INSERT INTO orders
VALUES
	(1, 'a10', 88743, 'PENDING', 1,'2006-10-10',NOW()),
	(2, 'a11', 9106, 'APPROVED', 1,'2007-10-10',NOW()),
	(3, 'a12', 2984, 'APPROVED', 2,'2007-10-10',NOW()),
	(4, 'b10', 2984, 'APPROVED', 3,'2006-10-10',NOW()),
	(5, 'c10', 2985, 'RECEIVED', 4,'2006-11-10',NOW()),
	(6, 'b11', 2933, 'APPROVED', 3,'2006-10-10',NOW()),
	(7, 'c11', 29233, 'RECEIVED', 5,'2006-11-10',NOW());

INSERT INTO order_detail
VALUES
	(1, 1, 100000, 1, 1, '2023-01-09', NOW()),
	(2, 1, 150000, 2, 2, '2023-01-09', NOW()),
	(3, 1, 180000, 4, 3, '2023-01-09', NOW()),
	(4, 2, 300000, 6, 2, '2023-01-09', NOW()),
	(5, 3, 500000, 2, 1, '2023-01-09', NOW()),
	(6, 2, 300000, 7, 2, '2023-01-09', NOW()),
	(7, 3, 500000, 2, 3, '2023-01-09', NOW());
	
/* 1 */
SELECT COUNT(*) from
	(SELECT from_country FROM 
		(SELECT order_detail.id, product_detail.product_id FROM order_detail join product_detail WHERE order_detail.product_detail_id = product_detail.id) AS matching_table
		JOIN product WHERE matching_table.product_id = product.id) AS matching2_table
	WHERE matching2_table.from_country = 'singapore';	

/* 2 */
SELECT * FROM product JOIN product_detail WHERE product_detail.product_id = product.id AND product_detail.size ='m' AND product_detail.color = 'blue';

/* 3 */
SELECT * FROM product WHERE product.supplier_id IN (SELECT id FROM supplier WHERE supplier_code = '63323-258');

/* 4 */
SELECT SUM(quantity) FROM order_detail WHERE created_date >= '2022-01-01' AND created_date <= '2022-12-31';

/* 5 */
SELECT COUNT(*) from
	(SELECT product_name FROM 
		(SELECT order_detail.id, order_detail.created_date, product_detail.product_id FROM order_detail join product_detail WHERE order_detail.product_detail_id = product_detail.id) AS matching_table
		JOIN product WHERE matching_table.product_id = product.id AND matching_table.created_date > '2023-01-01' AND matching_table.created_date < '2023-12-31') AS matching2_table
	WHERE matching2_table.product_name = 'bánh';	
	
/* 6 */
SELECT * FROM customer WHERE first_name LIKE '%n%' OR last_name LIKE '%n%';

/* 7 */
SELECT COUNT(*) FROM customer where customer_status = 'deactive';

/* 8 */
UPDATE product
SET product_name = 'pen' WHERE product_name = 'bút';

/* 9 */
SELECT * FROM product WHERE is_new = 'NOT_NEW';

/*10*/
SELECT * FROM product WHERE category_id IS NULL;

/*11*/
SELECT * FROM customer WHERE birthday > '1990-12-31';

/*12*/
SELECT * FROM orders WHERE total_money >= 50000;

/*13*/
SELECT * FROM user WHERE birth_day > '1990-12-31' AND country ='vn';

/*14*/
SELECT AVG(total_money) as AVG_Bill FROM orders;	

	






