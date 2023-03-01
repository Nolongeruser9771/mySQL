CREATE TABLE category(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	category_code VARCHAR(200) NOT null,
	category_name VARCHAR(200) NOT null,
	created_date DATETIME NOT null,
	updated_date DATETIME NOT null
);

CREATE TABLE supplier(
	id INT PRIMARY KEY AUTO_INCREMENT,
	supplier_code VARCHAR(200) NOT null,
	supplier_name VARCHAR(200) NOT null,
	image VARCHAR(200),
	created_date DATETIME NOT null,
	updated_date DATETIME NOT NULL
);

CREATE TABLE product(
	id bigINT PRIMARY KEY AUTO_INCREMENT,
	product_code VARCHAR(200) NOT null,
	product_name VARCHAR(200) NOT null,
	DESCRIPTION VARCHAR(200),
	from_country VARCHAR(200),
	is_new ENUM('null','new','not_new'),
	created_date DATETIME NOT null,
	updated_date DATETIME NOT NULL,
	
	category_id bigINT,
	supplier_id INT,
	FOREIGN KEY (category_id) REFERENCES category(id),
	FOREIGN KEY(supplier_id) REFERENCES supplier(id)
);	

CREATE TABLE product_detail(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	image VARCHAR(200),
	standard_cost INT,
	quantity INT,
	color VARCHAR(200),
	created_date DATETIME NOT null,
	updated_date DATETIME NOT NULL,
	
	product_id bigINT,
	FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE customers(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(200) NOT null,
	PASSWORD VARCHAR(200) NOT null,
	first_name VARCHAR(200) NOT null,
	last_name VARCHAR(200) NOT null,
	gender ENUM('null','male','female'),
	email VARCHAR(200),
	birthday DATETIME,
	avartar VARCHAR(200),
	address VARCHAR(200),
	STATUS VARCHAR(200),
	created_date DATETIME NOT null,
	updated_date DATETIME NOT null
);

CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_code VARCHAR(200) NOT null,
	quantity INT NOT null,
	total_money INT NOT null,
	STATUS VARCHAR(200),
	created_date DATETIME NOT null,
	updated_date DATETIME NOT NULL,
	
	customer_id INT,
	product_id bigINT,
	FOREIGN KEY (customer_id) REFERENCES customers(id),
	FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE order_detail(
	id INT PRIMARY KEY AUTO_INCREMENT,
	product_id INT,
	product_detail_id INT,
	quantity INT,
	total INT,
	order_id INT,
	FOREIGN KEY (order_id) REFERENCES orders(id)
);