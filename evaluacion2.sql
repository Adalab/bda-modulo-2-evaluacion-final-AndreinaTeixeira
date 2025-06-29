/*Base de Datos Sakila:
Para este ejerccio utilizaremos la BBDD Sakila que hemos estado utilizando durante el repaso de SQL. Es una
base de datos de ejemplo que simula una tienda de alquiler de películas. Contiene tablas como film
(películas), actor (actores), customer (clientes), rental (alquileres), category (categorías), entre otras. Estas
tablas contienen información sobre películas, actores, clientes, alquileres y más, y se utilizan para realizar
consultas y análisis de datos en el contexto de una tienda de alquiler de películas.*/

USE sakila

/*EJERCICIO 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados*/

SELECT DISTINCT(title)
FROM FILM; -- comapred with SELECT title FROM FILM; there were no duplicates

/*EJERCICIO 2.








