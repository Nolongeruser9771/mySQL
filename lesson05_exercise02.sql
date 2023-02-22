/*1a. Tạo bảng, tạo khóa ngoại 1-1*/

CREATE TABLE account(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(200),
	full_name VARCHAR(200),
	phone VARCHAR(200),
	email VARCHAR(200),
	created_date datetime
);

CREATE TABLE address(
	id INT PRIMARY KEY auto_increment,
	address VARCHAR(200),
	created_date DATETIME,
	account_id INT UNIQUE,
	FOREIGN KEY(account_id) REFERENCES account(id)
);

/*1b. Thêm mỗi bảng 10 bản ghi*/

INSERT INTO ACCOUNT(username, full_name,phone,email,created_date)
VALUES
('Hà','Ôn Bích Hà','070.467.4478','habichon_5676@gmail.com','2023-02-22'),
('Lập','Trương Quốc Lập','083.447.2348','laptt@gmail.com','2023-02-22'),
('Thiện','Lục Văn Thiện','071.762.1122','thienluc@gmail.com','2023-02-22'),
('Long','Võ Thành Long','083.235.2476','longthanhvo@gmail.com','2023-02-22'),
('Kiệt','Lý Liên Kiệt','071.437.4453','kietmina@gmail.com','2023-02-22'),
('Phi','Lưu Diệc Phi','072.237.8463','philovely@gmail.com','2023-02-22'),
('Vi','Triệu Vy','090.444.9003','vytrieu@gmail.com','2023-02-22'),
('Như','Lâm Tâm Như','092.466.4477','nhutam_23@gmail.com','2023-02-22'),
('Dĩnh','Lâm Chí Dĩnh','072.462.3375','dinh_bao_1225@gmail.com','2023-02-22'),
('Á','Đồng Lệ Á','071.477.4574','afanclub@gmail.com','2023-02-22');

INSERT INTO address
VALUES
(1,'Giang Tây, TQ', '2023-02-22',2),
(2,'Giang Đông, TQ', '2023-02-22',3),
(3,'Bắc Kinh, TQ', '2023-02-22',5),
(4,'Thượng Hải, TQ', '2023-02-22',4),
(5,'Vân Nam, TQ', '2023-02-22',1),
(6,'Trùng Khánh, TQ', '2023-02-22',6),
(7,'Quảng Đông, TQ', '2023-02-22',8),
(8,'Hồng Kông', '2023-02-22',7),
(9,'Đài Loan', '2023-02-22',10),
(10,'Tây Tạng', '2023-02-22',9);

/*1c.Truy vấn cột*/

SELECT account.id, account.username, account.full_name, account.phone, account.email, account.created_date, address.address
FROM account JOIN address
ON account.id = address.account_id;

/*2a. Xóa bảng. Tạo lại 2 bảng quan hệ 1-N*/
DROP TABLE account, address;

CREATE TABLE account(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(200),
	full_name VARCHAR(200),
	phone VARCHAR(200),
	email VARCHAR(200),
	created_date datetime
);

CREATE TABLE address(
	id INT PRIMARY KEY auto_increment,
	address VARCHAR(200),
	created_date DATETIME,
	account_id INT,
	FOREIGN KEY(account_id) REFERENCES account(id)
);

/*2b. Thêm mỗi bảng 10 bản ghi*/

INSERT INTO ACCOUNT(username, full_name,phone,email,created_date)
VALUES
('Hà','Ôn Bích Hà','070.467.4478','habichon_5676@gmail.com','2023-02-22'),
('Lập','Trương Quốc Lập','083.447.2348','laptt@gmail.com','2023-02-22'),
('Thiện','Lục Văn Thiện','071.762.1122','thienluc@gmail.com','2023-02-22'),
('Long','Võ Thành Long','083.235.2476','longthanhvo@gmail.com','2023-02-22'),
('Kiệt','Lý Liên Kiệt','071.437.4453','kietmina@gmail.com','2023-02-22'),
('Phi','Lưu Diệc Phi','072.237.8463','philovely@gmail.com','2023-02-22'),
('Vi','Triệu Vy','090.444.9003','vytrieu@gmail.com','2023-02-22'),
('Như','Lâm Tâm Như','092.466.4477','nhutam_23@gmail.com','2023-02-22'),
('Dĩnh','Lâm Chí Dĩnh','072.462.3375','dinh_bao_1225@gmail.com','2023-02-22'),
('Á','Đồng Lệ Á','071.477.4574','afanclub@gmail.com','2023-02-22');

INSERT INTO address
VALUES
(1,'Giang Tây, TQ', '2023-02-22',2),
(2,'Giang Đông, TQ', '2023-02-22',3),
(3,'Bắc Kinh, TQ', '2023-02-22',2),
(4,'Thượng Hải, TQ', '2023-02-22',1),
(5,'Vân Nam, TQ', '2023-02-22',1),
(6,'Trùng Khánh, TQ', '2023-02-22',4),
(7,'Quảng Đông, TQ', '2023-02-22',5),
(8,'Hồng Kông', '2023-02-22',6),
(9,'Đài Loan', '2023-02-22',4),
(10,'Tây Tạng', '2023-02-22',2);

/*2c. Truy vấn cột*/

SELECT account.id, account.username, account.full_name, account.phone, account.email, account.created_date, address.address
FROM account JOIN address
ON account.id = address.account_id;

