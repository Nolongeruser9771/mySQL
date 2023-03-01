CREATE TABLE ACCOUNT(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(50) NOT null,
	PASSWORD VARCHAR(50) NOT null,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gender ENUM('null','male','female'),
	email VARCHAR(50) NOT null,
	birth_day DATETIME,
	avartar VARCHAR(50),
	phone VARCHAR(50),
	address VARCHAR(100),
	city VARCHAR(100),
	country VARCHAR(100),
	code_active VARCHAR(200) NOT null,
	STATUS ENUM('null','enable','disable') NOT null,
	created_date DATETIME NOT null,
	updated_date DATETIME NOT null
);

CREATE TABLE role(
	id INT PRIMARY KEY AUTO_INCREMENT,
	role_name VARCHAR(50) NOT null,
	created_date DATETIME NOT NULL,
	updated_date DATETIME NOT NULL
);

CREATE TABLE account_role(
	id INT PRIMARY KEY AUTO_INCREMENT,
	account_id INT,
	role_id INT,
	FOREIGN KEY (account_id) REFERENCES ACCOUNT(id),
	FOREIGN KEY (role_id) REFERENCES role(id)
);
