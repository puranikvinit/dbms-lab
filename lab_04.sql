DROP TABLE IF EXISTS CUSTOMERS;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS users;

CREATE TABLE cities (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30)
);

CREATE TABLE addresses (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(30) NOT NULL,
    house_number INT(10) NOT NULL,
    city_id INT(11) REFERENCES cities(id)
);

CREATE TABLE users (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    email VARCHAR(30) NOT NULL,
    address_id INT(11) REFERENCES addresses(id)
);

INSERT INTO cities (name)
    VALUES
    ('Berlin'),
    ('London'),
    ('New York');

INSERT INTO addresses (street, house_number, city_id)
    VALUES
    ('Teststreet', 8, 3),
    ('Some Street', 10, 1),
    ('Teststreet', 1, 3),
    ('My street', 101, 2);

INSERT INTO users (first_name, last_name, email, address_id)
    VALUES
    ('Max', 'Schwarz', 'max@test.com', 2),
    ('Manuel', 'Lorenz', 'manu@test.com', 4),
    ('Julie', 'Barnes', 'julie@barnes.com', 3);

UPDATE addresses
SET city_id = 1, house_number = 100
WHERE id = 4;

-- ---------- INNER JOINS -----------
SELECT u.*, a.house_number, c.name AS city_name
FROM users AS u
INNER JOIN addresses as a ON a.id = u.address_id
INNER JOIN cities as c ON c.id = a.city_id
WHERE c.name LIKE 'B%';

