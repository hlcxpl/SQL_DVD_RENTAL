-- 1. Consultas para insertar, modificar y eliminar un Customer, Staff y Actor

-- Insertar un nuevo cliente
INSERT INTO customer (store_id, first_name, last_name, email, address_id, active, create_date)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', 5, TRUE, CURRENT_TIMESTAMP);

-- Modificar información de un cliente
UPDATE customer
SET email = 'john.updated@example.com', active = FALSE
WHERE customer_id = 1;

-- Eliminar un cliente
DELETE FROM customer
WHERE customer_id = 1;

-- Insertar un nuevo miembro del personal
INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username, password)
VALUES ('Jane', 'Doe', 2, 'jane.doe@example.com', 1, TRUE, 'jdoe', 'securepass');

-- Modificar información de un miembro del personal
UPDATE staff
SET username = 'updateduser', email = 'updated.email@example.com'
WHERE staff_id = 1;

-- Eliminar un miembro del personal
DELETE FROM staff
WHERE staff_id = 1;

-- Insertar un nuevo actor
INSERT INTO actor (first_name, last_name, last_update)
VALUES ('Tom', 'Hanks', CURRENT_TIMESTAMP);

-- Modificar información de un actor
UPDATE actor
SET last_name = 'Cruise'
WHERE actor_id = 1;

-- Eliminar un actor
DELETE FROM actor
WHERE actor_id = 1;

-- 2. Listar todas las “rental” con los datos del “customer” dado un año y mes
SELECT
    rental.rental_id,
    rental.rental_date,
    customer.first_name,
    customer.last_name
FROM
    rental
JOIN
    customer ON rental.customer_id = customer.customer_id
WHERE
    EXTRACT(YEAR FROM rental.rental_date) = 2023  -- Reemplazar por el año deseado
    AND EXTRACT(MONTH FROM rental.rental_date) = 12;  -- Reemplazar por el mes deseado

-- 3. Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”
SELECT
    payment.payment_id AS numero,
    payment.payment_date AS fecha,
    payment.amount AS total
FROM
    payment;

-- 4. Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0
SELECT
    film.film_id,
    film.title,
    film.rental_rate,
    film.release_year
FROM
    film
WHERE
    film.release_year = 2006
    AND film.rental_rate > 4.0;

-- 5. Diccionario de datos que contiene el nombre de las tablas y columnas, si pueden ser nulas, y su tipo de dato correspondiente
SELECT
    table_schema AS esquema,
    table_name AS tabla,
    column_name AS columna,
    is_nullable AS puede_ser_nulo,
    data_type AS tipo_de_dato
FROM
    information_schema.columns
WHERE
    table_schema NOT IN ('pg_catalog', 'information_schema')
ORDER BY
    table_schema, table_name, ordinal_position;
