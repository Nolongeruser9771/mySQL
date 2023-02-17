--1
CREATE DATABASE quan_ly_kho;

--2
CREATE TABLE Product (
    id int PRIMARY KEY AUTO_INCREMENT,
    product_name varchar(255),
    price INT Unsigned,
    branch varchar(255),
    created_date datetime 
);

--3
INSERT INTO Product (product_name, price, branch)
VALUES 
('Toyota Vios', 520000000, 'Trần Duy Hưng'),
('Toyota Cross', 800000000, 'Gia Lâm'),
('Hyundai Accent', 510000000, 'Trần Duy Hưng'),
('Honda City', 550000000, 'Hai Bà Trưng'),
('Vinfast Fadil', 360000000, null),
('Mitsubishi Xpander', 620000000, 'Trần Duy Hưng'),
('Mazda CX-5', 900000000, 'Lý Thường Kiệt'),
('Kia Seltos', 700000000, 'Gia Lâm'),
('Hyundai i10', 360000000 , 'Gia Lâm'),
('Hyundai Santafe', 1000000000 , 'Gia Lâm'),
('Kia Carnival', 1800000000, 'Hai Bà Trưng');

UPDATE product
SET created_date = NOW();

--4
SELECT * FROM Product
WHERE price>115000000;

--5
SELECT * FROM Product
WHERE LOWER(product_name) LIKE '%k%';

--6
SELECT * FROM Product
WHERE LOWER(product_name) LIKE '%kia%' OR price < 200000000;

--7
SELECT * FROM Product 
WHERE price IN (100000000, 130000000, 140000000, 150000000, 160000000, 170000000);

--8
SELECT DISTINCT price FROM Product;

--9
SELECT * FROM Product
WHERE LOWER(branch) IN ('lý thường kiệt', 'hai bà trưng');

--10
SELECT * FROM Product
WHERE LOWER(branch) IN ('lý thường kiệt', 'hai bà trưng') AND price <1000000000;

