DROP DATABASE IF EXISTS sprint_2;

--- Tạo cơ sở dữ liệu furama ---
CREATE DATABASE sprint_2;

USE sprint_2;

CREATE TABLE customer(
id_customer INT AUTO_INCREMENT,
email NVARCHAR(50) NOT NULL,
address NVARCHAR(50),
username NVARCHAR(50) NOT NULL,
password NVARCHAR(50) NOT NULL,
PRIMARY KEY(id_customer)
);

CREATE TABLE catogery(
id_catogery INT AUTO_INCREMENT,
name NVARCHAR(50),
PRIMARY KEY(id_catogery)
);

CREATE TABLE product(
id_product INT AUTO_INCREMENT,
name NVARCHAR(50),
description NVARCHAR(500),
price DOUBLE NOT NULL,
id_catogery INT NOT NULL,
producer NVARCHAR(50),
PRIMARY KEY(id_product),
FOREIGN KEY (id_catogery) REFERENCES catogery (id_catogery)
);

CREATE TABLE status_order(
id_status_order INT AUTO_INCREMENT,
name NVARCHAR(50) NOT NULL,
PRIMARY KEY(id_status_order)
);

CREATE TABLE payment_method(
id_payment_method INT AUTO_INCREMENT,
name NVARCHAR(50) NOT NULL,
PRIMARY KEY(id_payment_method)
);

CREATE TABLE order_game(
id_order_game INT AUTO_INCREMENT,
date_order DATE NOT NULL,
id_status_order INT NOT NULL,
id_customer INT NOT NULL,
price_order DOUBLE NOT NULL,
id_payment_method INT NOT NULL,
PRIMARY KEY(id_order_game),
FOREIGN KEY (id_status_order) REFERENCES status_order (id_status_order),
FOREIGN KEY (id_payment_method) REFERENCES payment_method (id_payment_method),
FOREIGN KEY (id_customer) REFERENCES customer (id_customer)
);

CREATE TABLE order_detail(
id_order_detail INT AUTO_INCREMENT,
id_order_game INT NOT NULL,
id_product INT NOT NULL,
amount INT NOT NULL,
discount double,
PRIMARY KEY(id_order_detail),
FOREIGN KEY (id_order_game) REFERENCES order_game (id_order_game),
FOREIGN KEY (id_product) REFERENCES product (id_product)
)