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

SELECT DISTINCT first_name
FROM actor; -- to get only the name, 1 duplicated

SELECT CONCAT(first_name, " ", last_name)
FROM actor; -- to get the full name

/*EJERCICIO 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido*/
















