-- CREATE DATABASE MYSEQUELPRACTICE;

-- USE MYSEQUELPRACTICE;

CREATE TABLE PRODUCT_MASTER (
    PRODUCTNO Varchar(6) PRIMARY KEY CHECK (PRODUCTNO LIKE "p%"),
    DESCRIPTION Varchar(15) NOT NULL,
    PROFITPERCENT Varchar(4,2) NOT NULL,
    UNITMEASURE Varchar(10) NOT NULL,
    QTYONHOLD Int(8) NOT NULL,
    REORDERLVL Int(8) NOT NULL,
    SELLPRICE Float(8,2) NOT NULL CHECK (SELLPRICE != 0),
    COSTPRICE Float(8,2) NOT NULL CHECK (SELLPRICE != 0)
);

CREATE TABLE CLIENT_MASTER (
    CLIENTNO Varchar(6) PRIMARY KEY CHECK (CLIENTNO LIKE "C%"),
    NAME Varchar(20) NOT NULL,
    ADDRESS1 Varchar(30),
    ADDRESS2 Varchar(30),
    CITY Varchar(15),
    PINCODE Int(8),
    STATE Varchar(15),
    BALDUE Float(10,2)
);

CREATE TABLE SALESMAN_MASTER (
    SALESMANNO Varchar(6) PRIMARY KEY CHECK (SALESMANNO LIKE "S%"),
    SALESMANNAME Varchar(20) NOT NULL,
    ADDRESS1 Varchar(30),
    ADDRESS2 Varchar(30),
    CITY Varchar(15),
    PINCODE Int(8),
    STATE Varchar(15)
);

INSERT INTO PRODUCT_MASTER (PRODUCTNO, DESCRIPTION, PROFITPERCENT, UNITMEASURE, QTYONHOLD, REORDERLVL, SELLPRICE, COSTPRICE)
VALUES
('p001', 'Pencil', '10', 'Dozen', 100, 50, 100.00, 5.00),
('p002', 'Pen', '10', 'Dozen', 100, 50, 20.00, 5.00),
('p003', 'Eraser', '10', 'Dozen', 100, 50, 3000.00, 5.00),
('p004', 'Sharpner', '10', 'Dozen', 100, 50, 4890.00, 5.00),
('p005', 'Scale', '10', 'Dozen', 100, 50, 6000.00, 5.00),
('p006', 'Stapler', '10', 'Dozen', 100, 50, 800.00, 5.00),
('p007', 'Staples', '10', 'Dozen', 100, 50, 567.00, 5.00),
('p008', 'Paper', '10', 'Dozen', 100, 50, 234.00, 5.00),
('p009', 'Notebook', '10', 'Dozen', 100, 50, 789.00, 5.00),
('p010', 'Pencil Box', '10', 'Dozen', 100, 50, 890.00, 5.00);

INSERT INTO CLIENT_MASTER (CLIENTNO, NAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, BALDUE)
VALUES
('C00001', 'John', 'Bangalore', 'Karnataka', 'Mangalore', 560100, 'Jharkhand', 25.6),
('C00002', 'Smith', 'Bangalore', 'Karnataka', 'Dehli', 560100, 'Jharkhand', 52.6),
('C00003', 'David', 'Bangalore', 'Karnataka', 'Chennai', 560100, 'Jharkhand', 2500.6),
('C00004', 'Marnus', 'Bangalore', 'Karnataka', 'Kolkata', 560100, 'Jharkhand', 250.6),
('C00005', 'Harris', 'Bangalore', 'Karnataka', 'Mumbai', 560100, 'Jharkhand', 1600.6),
('C00006', 'Mitchel', 'Bangalore', 'Karnataka', 'Pune', 560100, 'Jharkhand', 200000.6),
('C00007', 'Isha', 'Bangalore', 'Karnataka', 'Bangalore', 560100, 'Jharkhand', 678934);

-- INSERT INTO SALESMAN_MASTER (SALESMANNO, SALESMANNAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE)
-- VALUES
-- ();

-- ----------------------------------------------------------------------------------------------
-- EXPERIMENT - 05
-- ----------------------------------------------------------------------------------------------

-- a.list the names of all clients having ‘a’ as the second letter in their names.
SELECT NAME FROM CLIENT_MASTER WHERE NAME LIKE "_a%";

-- b.listing of clients who stay in a city whose first letter is ‘M’
SELECT * FROM CLIENT_MASTER WHERE CITY LIKE "M%";

-- c.list all clients who stay in ‘Bangaluru’ or ‘Mangalore’
SELECT * FROM CLIENT_MASTER WHERE CITY IN ('Bangalore', 'Mangalore');

-- d.list all clients whose BalDue is greater than 10000
SELECT * FROM CLIENT_MASTER WHERE BALDUE > 10000;

-- e.display the order information of clientno ‘C00001’ and’C00002’

     
-- f.list products whose selling price is greater than 500 and less than or equal to 750
SELECT * FROM PRODUCT_MASTER WHERE SELLPRICE > 500 AND SELLPRICE <= 750;

-- g.listing of names,city and state of clients who are not in the state of ‘maharashtra’.
SELECT NAME, CITY, STATE FROM CLIENT_MASTER WHERE CITY NOT IN ('maharashtra');

-- h.count the total number of orders
SELECT COUNT(*) FROM SALESMAN_MASTER;

-- i.calculating the average price of all products.
SELECT AVG(SELLPRICE) FROM PRODUCT_MASTER;

-- j.determining the maximum and minimum price for the product prices.
SELECT MAX(SELLPRICE), MIN(SELLPRICE) FROM PRODUCT_MASTER;

-- k.count the number of products having the price greater than or equal to 500
SELECT COUNT(*) FROM PRODUCT_MASTER WHERE SELLPRICE >= 500;



-- a. printing the description and total quantity sold for each product.
SELECT DESCRIPTION, COUNT(QTYONHOLD) FROM PRODUCT_MASTER;

-- b. Finding the value of each product sold
SELECT SELLPRICE FROM PRODUCT_MASTER;

-- c. find out the total of all the billed orders for the month of june.
SELECT SUM(SELLPRICE) FROM PRODUCT_MASTER;


-- ----------------------------------------------------------------------------------------------
-- EXPERIMENT - 06
-- ----------------------------------------------------------------------------------------------

--  