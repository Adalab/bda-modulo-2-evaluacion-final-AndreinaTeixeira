/*Base de Datos Sakila:
Para este ejerccio utilizaremos la BBDD Sakila que hemos estado utilizando durante el repaso de SQL. Es una
base de datos de ejemplo que simula una tienda de alquiler de películas. Contiene tablas como film
(películas), actor (actores), customer (clientes), rental (alquileres), category (categorías), entre otras. Estas
tablas contienen información sobre películas, actores, clientes, alquileres y más, y se utilizan para realizar
consultas y análisis de datos en el contexto de una tienda de alquiler de películas.*/

USE sakila

/*EJERCICIO 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados*/

SELECT DISTINCT(title)
FROM film; -- compared with SELECT title FROM FILM; there were no duplicates

/*EJERCICIO 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".*/

SELECT DISTINCT(title)
FROM film
WHERE rating = "PG-13";

/*EJERCICIO 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su
descripción*/

SELECT DISTINCT(title), "description" -- escape the word, it appears as a reserved word in sql
FROM film
WHERE title LIKE '%amazing%'; -- looking for "amazing" in any position of the title. Exported SELECT title FROM film; there are no matches.

/*EJERCICIO 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos*/

SELECT DISTINCT(title)
FROM film
WHERE length >120;

/*5. Recupera los nombres de todos los actores.*/

SELECT DISTINCT CONCAT(first_name, " ", last_name)
FROM actor; -- to get the full name

/*EJERCICIO 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido*/

SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'GIBSON';

/*EJERCICIO 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.*/

SELECT CONCAT(first_name, " ", last_name)
FROM actor
WHERE actor_id BETWEEN 10 AND 20;

/*EJERCICIO 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.*/

SELECT DISTINCT(title)
FROM film
WHERE rating NOT IN ("R", "PG-13");

/*EJERCICIO 9.  Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación
junto con el recuento.*/

SELECT COUNT(title), rating
FROM film
GROUP BY rating;

/*EJERCICIO 10.  Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su
nombre y apellido junto con la cantidad de películas alquiladas.*/

SELECT customer.customer_id, customer.first_name, customer.last_name, COUNT(film.title) AS cantidad_peliculas_alquiladas
FROM customer
INNER JOIN rental USING (customer_id)
INNER JOIN inventory USING (inventory_id)
INNER JOIN film USING (film_id)
GROUP BY customer_id;

/*EJERCICIO 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría
junto con el recuento de alquileres.*/

SELECT COUNT(film.title) AS cantidad_peliculas_alquiladas, category.name
FROM customer
INNER JOIN rental USING (customer_id)
INNER JOIN inventory USING (inventory_id)
INNER JOIN film USING (film_id)
INNER JOIN film_category USING (film_id)
INNER JOIN category USING (category_id)
GROUP BY category.name;

/*EJERCICIO 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la
clasificación junto con el promedio de duración.*/

SELECT AVG(film.length), rating
FROM film
GROUP BY rating;

/*EJERCICIO 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".*/

SELECT DISTINCT CONCAT (actor.first_name, " ", actor.last_name) AS actor_full_name
FROM actor
INNER JOIN film_actor USING (actor_id)
INNER JOIN film USING (film_id)
WHERE film.title = "Indian Love";

/*EJERCICIO 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.*/

SELECT title
FROM film
WHERE "description" REGEXP ("^$DOG&" OR "^$CAT&"); -- INCOMPLETOOOO, NO FUNCIONA!!!!!!!!!!!!!

/*EJERCICIO 15. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.*/

SELECT title
FROM film
WHERE release_year BETWEEN 2005 AND 2010;

/*EJERCICIO 16. Encuentra el título de todas las películas que son de la misma categoría que "Family".*/

SELECT film.title, category.name
FROM film
INNER JOIN film_category USING (film_id)
INNER JOIN category USING (category_id)
WHERE category.name = "Family";

/*EJERCICIO 17. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla
film.*/

