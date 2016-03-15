CREATE TABLE Users(
login char(30),
name varchar(40),
userType boolean, 
password varchar(100),
address varchar(50),
phone_num varchar(20),
PRIMARY KEY (login));

INSERT INTO Users
(login, name, userType, password, address, phone_num)
VALUES
('hello', 'helloworld', 'programmer', '222 south main', 'helloworld8', '(801)555-8460');



CREATE TABLE POI(
pid int primary key, 
name varchar[50], 
category varchar[20]);