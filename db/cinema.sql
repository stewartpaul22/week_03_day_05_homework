DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE movies;

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    funds INT
);

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  price INT
);

CREATE TABLE tickets (
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  movie_id INT REFERENCES movies(id) ON DELETE CASCADE,
);
