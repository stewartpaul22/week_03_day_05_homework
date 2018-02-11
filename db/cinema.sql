DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE customers;
DROP TABLE movies;

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  funds INT
);

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  price INT
);

CREATE TABLE screenings (
  id SERIAL PRIMARY KEY,
  movie_id INT REFERENCES movies(id) ON DELETE CASCADE,
  screening_time TIME NOT NULL
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  movie_id INT REFERENCES movies(id) ON DELETE CASCADE,
  screening_id INT REFERENCES screenings(id) ON DELETE CASCADE
);
