-- Data Project: Lógica Consultas SQL (64 consultas)


--========================================================================================
-- 1. Crea el esquema de la BBDD.
--========================================================================================

-- Resultado Consulta 1: Esquema creado y guardado como "SQL_Project_Diagram.png"


--========================================================================================
-- 2. Muestra los nombres de todas las películas con una clasificación por edades de ‘Rʼ.
--========================================================================================
SELECT title AS "nombre_película", rating AS "clasificación_edad"
FROM film
WHERE rating = 'R';

--Resultado Consulta 2: 195 películas clasificadas por edad como R.


--========================================================================================
-- 3. Encuentra los nombres de los actores que tengan un “actor_idˮ entre 30 y 40.
--========================================================================================
SELECT 
	actor_id,
	CONCAT (first_name, ' ', last_name) AS "nombre_completo_actor"
FROM actor
WHERE actor_id BETWEEN 30 AND 40
ORDER BY actor_id, first_name;

--Resultado Consulta 3: 11 actores/actrices tienen un actor_id entre 30 y 40. Omitido
-- ASC en ORDER BY para simplificar código.


--========================================================================================
-- 4. Obtén las películas cuyo idioma coincide con el idioma original.
--========================================================================================
SELECT 
    f.title AS "título_película",
    l.name AS "idioma"
FROM film f
INNER JOIN language l ON f.language_id = l.language_id
WHERE f.language_id = f.original_language_id
  AND f.original_language_id IS NOT NULL;

-- Resultado Consulta 4: Vacío. En ninguna película el idioma coincide con el idioma 
-- original porque el campo idioma_original es NUll para todos los valores.


--========================================================================================
-- 5. Ordena las películas por duración de forma ascendente.
--========================================================================================
SELECT 
    title AS "título_película",
    length AS "minutos_película"
FROM film
ORDER BY length ASC;

-- Resultado Consulta 5: Películas ordenadas por duración (asumimos minutos, unidad 
-- no indicada), donde las película de duración más corta son 5 con 46 minutos de duración
-- y las más largas son 10 en total de 185 minutos cada una.


--========================================================================================
-- 6. Encuentra el nombre y apellido de los actores que tengan ‘Allenʼ en su apellido.
--========================================================================================
SELECT 
	CONCAT(first_name, ' ', last_name) AS "nombre_y_apellido_actor"
FROM actor
WHERE last_name ILIKE '%ALLEN%';

-- Resultado Consulta 6: Hay 3 actores con ‘Allenʼ en su apellido. Usamos ILIKE para
-- no distinguir entre mayúsculas y minúsculas.


--========================================================================================
-- 7. Encuentra la cantidad total de películas en cada clasificación de la tabla 
-- “filmˮ y muestra la clasificación junto con el recuento.
--========================================================================================
SELECT 
    rating AS "clasificación",
    COUNT(title) AS "número_películas"
FROM film
GROUP BY rating 
ORDER BY "número_películas" DESC;

-- Resultado Consulta 7: Hay 5 tipos de clasificación donde PG-13 tiene más películas.


--========================================================================================
-- 8. Encuentra el título de todas las películas que son ‘PG-13ʼ o tienen una 
-- duración mayor a 3 horas en la tabla film.
--========================================================================================
SELECT 
	title AS "título_película",
	rating AS "clasificación",
   	length AS "minutos_película"
FROM film
WHERE rating = 'PG-13' OR
length > 180
ORDER BY title;

-- Resultado Consulta 8: 253 películas cumplen una de las dos condiciones y su título
-- se muestra en order ascendente.


--========================================================================================
-- 9. Encuentra la variabilidad de lo que costaría reemplazar las películas.
--========================================================================================
SELECT ROUND(variance(replacement_cost),2) AS "variabilidad_coste_reemplazo"
FROM film;

-- Resultado Consulta 9: 36.61 es el variabilidad del coste usando la función variance
-- y redondeamos dos decimales el resultado. 


--========================================================================================
-- 10. Encuentra la mayor y menor duración de una película de nuestra BBDD.
--========================================================================================
SELECT 
	MAX(length) AS "mayor_duración",
	MIN(length) AS "menor_duración"
FROM film;

-- Resultado Consulta 10: Seleccionadas la duración máxima y mínima del total de películas. 


--========================================================================================
-- 11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.
--========================================================================================
SELECT 
	r.rental_id,
	r.rental_date AS "día_alquiler",
	p.amount AS "precio_alquiler"
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
ORDER BY r.rental_date DESC, r.rental_id DESC 
LIMIT 1 OFFSET 2;

-- Resultado Consulta 11: Muestra el precio del tercer alquiler más reciente. 
-- Como puede haber varias filas con la misma fecha, se ordena adicionalmente por 
-- rental_id de manera descendente para garantizar que se seleccione
-- correctamente el tercer registro más reciente cuando empates.


--========================================================================================
-- 12. Encuentra el título de las películas en la tabla “filmˮ que no sean ni ‘NC-17ʼ 
-- ni ‘Gʼ en cuanto a su clasificación.
--========================================================================================
SELECT 
	title AS "título_película",
	rating AS "clasificación"
FROM film
WHERE rating NOT IN ('NC-17', 'G');

-- Resultado Consulta 12: Se muestran 612 películas cuyo rating *no* es 'NC-17' ni 'G'.


--========================================================================================
-- 13. Encuentra el promedio de duración de las películas para cada 
-- clasificación de la tabla film y muestra la clasificación junto con el 
-- promedio de duración.
--========================================================================================
SELECT 
	rating AS "clasificación",
	ROUND(AVG(length),2) AS "promedio_duración"
FROM film
GROUP BY rating
ORDER BY "promedio_duración" DESC;

-- Resultado Consulta 13: Se muestra la duración promedio de las películas para 
-- cada una de las cinco clasificaciones existentes, con el valor redondeado 
-- a dos decimales.


--========================================================================================
-- 14. Encuentra el título de todas las películas que tengan una duración mayor 
-- a 180 minutos.
--========================================================================================
SELECT 
	title AS "título_película",
   	length AS "minutos_película"
FROM film
WHERE length > 180
ORDER BY title;

-- Resultado Consulta 14: Se muestran 39 películas cuya duración es mayor a 3 horas.


--========================================================================================
-- 15. ¿Cuánto dinero ha generado en total la empresa?
--========================================================================================
SELECT SUM(amount) AS "Total_ingresos"
FROM payment;

-- Resultado Consulta 15: Se muestran la suma de todos los pagos de clientes a la empresa.


--========================================================================================
-- 16. Muestra los 10 clientes con mayor valor de id.
--========================================================================================
SELECT 
	customer_id,
	CONCAT(first_name, ' ', last_name)
FROM customer
ORDER BY customer_id DESC
LIMIT 10;

-- Resultado Consulta 16: Se muestran los customer_id, nombre y apellido de los 
-- 10 clientes con los valores más altos de customer_id.


--========================================================================================
-- 17. Encuentra el nombre y apellido de los actores que aparecen en la 
-- película con título ‘Egg Igbyʼ.
--========================================================================================
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo_actor",
    f.title AS "titulo_pelicula"
FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.title ILIKE 'Egg Igby'
ORDER BY nombre_completo_actor;

-- Resultado Consulta 17: Se extraen datos de tres tablas: 
-- 1) film: para obtener el título de la película, 
-- 2) film_actor: como tabla intermedia que relaciona películas y actores, 
-- 3) actor: para obtener el nombre y apellido de los actores. 
-- La consulta devuelve el nombre completo de cada actor (concatenando first_name 
-- y last_name) que participa en la película cuyo título coincide con 'Egg Igby'. 
-- Se usa `ILIKE` para ignorar mayúsculas/minúsculas en la búsqueda. 
-- Como resultado, se listan todos los actores de esa película ordenados 
-- alfabéticamente junto con su título.


--========================================================================================
-- 18. Selecciona todos los nombres de las películas únicos.
--========================================================================================
SELECT DISTINCT title AS "título_película"
FROM film; 

-- Resultado Consulta 18: Se extraen los títulos únicos. 

--========================================================================================
-- 19. Encuentra el título de las películas que son comedias y tienen una 
-- duración mayor a 180 minutos en la tabla “filmˮ.
--========================================================================================
SELECT 
     f.title AS "titulo_película",
     f.length AS "duración_minutos",
     c.name AS "categoria"
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE f.length >180 AND c.name ILIKE 'comedy';

-- Resultado Consulta 19: Se obtienen los títulos de las películas, 
-- cuya duración es mayor a 180 minutos y su categoría que son del género "comedy".
-- La consulta combina tres tablas: 
-- 1) film: para obtener el título y la duración de la película, 
-- 2) film_category: como tabla intermedia que relaciona películas con categorías, 
-- 3) category: para obtener el nombre de la categoría. 
-- Se usa `ILIKE` para que la búsqueda de la categoría "comedy" no distinga entre 
-- mayúsculas y minúsculas.


--========================================================================================
-- 20. Encuentra las categorías de películas que tienen un promedio de 
-- duración superior a 110 minutos y muestra el nombre de la categoría 
-- junto con el promedio de duración.
--========================================================================================
SELECT 
     c.name AS "categoria",
     ROUND(AVG(f.length),2) AS "media_duración_minutos"
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
HAVING AVG(f.length) > 110
ORDER BY "media_duración_minutos" DESC;

-- Resultado Consulta 20: Se muestran las categorías de películas 
-- cuyo promedio de duración supera 110 minutos, 
-- indicando el nombre de la categoría y la duración promedio 
-- en minutos (redondeada a dos decimales). Se combinan 3 tablas como anteriormente.


--========================================================================================
-- 21. ¿Cuál es la media de duración del alquiler de las películas?
--========================================================================================
SELECT ROUND(AVG(rental_duration),2) AS "media_duración_alquiler"
FROM film;

-- Resultado Consulta 21: Media duración 4.99 (asumimos que son días).


--========================================================================================
-- 22. Crea una columna con el nombre y apellidos de todos los actores y 
-- actrices.
--========================================================================================
SELECT CONCAT(first_name, ' ', last_name) AS "nombre_completo_actor"
FROM actor
ORDER BY "nombre_completo_actor";

-- Resultado Consulta 22: 200 actores/actrices ordenados alfabéticamente.


--========================================================================================
-- 23. Números de alquiler por día, ordenados por cantidad de alquiler de 
-- forma descendente.
--========================================================================================
SELECT 
    DATE(rental_date) AS "fecha_alquiler",
    COUNT(*) AS "numero_alquileres"
FROM rental
GROUP BY DATE(rental_date)
ORDER BY "numero_alquileres" DESC;

-- Resultado Consulta 23: Se cuentan los alquileres por día usando DATE(rental_date) 
-- para ignorar la hora, agrupando por fecha y ordenando de mayor a menor 
-- número de alquileres.


--========================================================================================
-- 24. Encuentra las películas con una duración superior al promedio.
--========================================================================================
SELECT 
    title AS "título_película",
    length AS "duración_película"
FROM film
WHERE length > (
    SELECT AVG(length) FROM film
)
ORDER BY length DESC;

-- Resultado Consulta 24: Se muestran las películas cuya duración es mayor que la 
-- media, comparando cada una con el promedio calculado mediante una subconsulta.


--========================================================================================
-- 25. Averigua el número de alquileres registrados por mes.
--========================================================================================
SELECT 
    EXTRACT(YEAR FROM rental_date) AS "año",
    EXTRACT(MONTH FROM rental_date) AS "mes",
    COUNT(*) AS "cantidad_alquileres"
FROM rental
GROUP BY 
    EXTRACT(YEAR FROM rental_date),
    EXTRACT(MONTH FROM rental_date)
ORDER BY "año", "mes";

-- Resultado Consulta 25: Se cuenta cuántos alquileres hubo en cada mes de cada año.
-- 	EXTRACT: obtiene el año y el mes de `rental_date`, 
-- 	GROUP BY: agrupa por esos valores, 
-- 	ORDER BY: muestra los resultados en orden cronológico.
-- Julio 2005 muestra record de alquileres, mientras que febrero 2006 muestra mínimo.


--========================================================================================
-- 26. Encuentra el promedio, la desviación estándar y varianza del total 
-- pagado.
--========================================================================================
SELECT 
    ROUND(AVG(amount), 2) AS "promedio",
    ROUND(STDDEV(amount), 2) AS "desviacion_estandar",
    ROUND(VARIANCE(amount), 2) AS "varianza"
FROM payment;

-- Resultado Consulta 26: Se calcula el promedio, la desviación estándar y la varianza
-- del total pagado (amount) en la tabla payment. 
-- AVG(amount) da el valor medio, 
-- STDDEV(amount) mide cuánto se dispersan los pagos respecto al promedio, 
-- y VARIANCE(amount) es el cuadrado de esa dispersión.


--========================================================================================
-- 27. ¿Qué películas se alquilan por encima del precio medio?
--========================================================================================
SELECT 
    title AS "título_película",
    rental_rate AS "precio_alquiler"
FROM film
WHERE rental_rate > (
    SELECT AVG(rental_rate)
    FROM film
)
ORDER BY rental_rate DESC;

-- Resultado Consulta 27: Se muestran las películas cuyo precio de alquiler es 
-- superior al promedio de todos los alquileres. 
-- Primero se calcula el promedio con AVG(rental_rate), 
-- luego se filtran las películas que superan ese valor y se ordenan de mayor 
-- a menor precio.


--========================================================================================
-- 28. Muestra el id de los actores que hayan participado en más de 40 
-- películas.
--========================================================================================
SELECT
	actor_id,
	COUNT(film_id) AS "número_películas"
FROM film_actor
GROUP BY actor_id 
HAVING COUNT(film_id)>40;

-- Resultado Consulta 28: Solo hay dos actores (actor_id 107 y 102) que han actuado 
-- en más de 40 películas. 
-- Primero se agrupa por actor_id con GROUP BY, luego COUNT(film_id)
-- calcula cuántas películas tiene cada actor, y HAVING filtra solo aquellos 
-- con más de 40 participaciones. 


--========================================================================================
-- 29. Obtener todas las películas y, si están disponibles en el inventario, 
-- mostrar la cantidad disponible.
--========================================================================================
SELECT 
    f.title AS "título_película",
    COUNT(i.film_id) AS "cantidad_inventario"
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.film_id, f.title
ORDER BY "cantidad_inventario", "título_película";

-- Resultado Consulta 29: Mostradas las 1000 películas disponibles y la cantidad
-- disponible en el inventario. Donde:
-- LEFT JOIN asegura que aparezcan incluso las películas sin copias. 
-- COUNT(i.film_id) cuenta las copias; si no hay copias, devuelve 0 automáticamente. 
-- GROUP BY f.film_id y f.title agrupa los resultados por película, 
-- y ORDER BY muestra primero las películas con menos copias y, en caso de empate, 
-- por el nombre de la película alfabéticamente. Se omite "ASC" en ambas. 


--========================================================================================
-- 30. Obtener los actores y el número de películas en las que ha actuado.
--========================================================================================
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo_actor",
    COUNT(fa.film_id) AS "número_películas"
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY "número_películas" DESC;

-- Resultado Consulta 30: Se muestran todos los actores junto con el número de 
-- películas en las que han participado.
-- LEFT JOIN asegura que aparezcan también los actores que no tienen ninguna película.
-- COUNT(fa.film_id) cuenta cuántas películas tiene cada actor; devuelve 0 si no ha actuado en ninguna.
-- GROUP BY a.actor_id, a.first_name, a.last_name agrupa correctamente por actor y 
-- evita problemas si hay nombres repetidos.
-- ORDER BY "número_películas" DESC muestra primero los actores con más películas.


--========================================================================================
-- 31. Obtener todas las películas y mostrar los actores que han actuado en 
-- ellas, incluso si algunas películas no tienen actores asociados.
--========================================================================================
SELECT 
    f.title AS "título_película",
    CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo_actor"
FROM film f
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
LEFT JOIN actor a ON fa.actor_id = a.actor_id
ORDER BY f.title, a.first_name;

-- Resultado Consulta 31: Se muestran todas las películas junto con los actores 
-- que han actuado en ellas. 
-- LEFT JOIN asegura que aparezcan todas las películas, incluso si no tienen actores.
-- CONCAT(a.first_name, ' ', a.last_name) genera el nombre completo del actor; 
-- si no hay actor, aparecerá NULL.
-- ORDER BY f.title, a.first_name ordena los resultados por título 
-- de película y, dentro de cada película, por el nombre del actor. Omitido ASC para 
-- simplificar código.


--========================================================================================
-- 32. Obtener todos los actores y mostrar las películas en las que han 
-- actuado, incluso si algunos actores no han actuado en ninguna película.
--========================================================================================
SELECT 
	CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo_actor",
	f.title AS "título_película"
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
ORDER BY a.first_name, f.title;

-- Resultado Consulta 32: Se muestran todos los actores junto con las películas 
-- en las que han actuado. 
-- LEFT JOIN garantiza que aparezcan también los actores que no han participado 
-- en ninguna película.
-- CONCAT(a.first_name, ' ', a.last_name) crea el nombre completo del actor.
-- Si un actor no tiene películas, el campo "título_película" aparece como NULL.
-- ORDER BY a.first_name, f.title ordena primero por nombre de actor y 
-- luego por título de película.Omitido ASC para simplificar código.


--========================================================================================
-- 33. Obtener todas las películas que tenemos y todos los registros de 
-- alquiler.
--========================================================================================
SELECT 	f.title AS "título_película",
		r.rental_id ,
		r.rental_date AS "fecha_alquiler",
		r.return_date AS "fecha_devolución",
		r.customer_id
FROM film f 
FULL JOIN inventory i ON f.film_id = i.film_id
FULL JOIN rental r ON i.inventory_id = r.inventory_id
ORDER BY f.title, r.rental_date;

-- Resultado Consulta 33: Se muestran todas las películas y todos los registros de alquiler.
-- FULL JOIN permite incluir películas sin alquileres y alquileres sin película asociada.
-- inventory actúa como tabla intermedia entre film y rental.
-- Si no hay coincidencia, los campos correspondientes aparecen como NULL.
-- ORDER BY organiza los resultados primero por título de película y después por
-- fecha de alquiler.


--========================================================================================
-- 34. Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.
--========================================================================================
SELECT 
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS "nombre_completo_cliente",
	SUM(p.amount) AS "Total_pagado"
FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY "Total_pagado" DESC 
LIMIT 5;

-- Resultado Consulta 34: Se muestran los 5 clientes que más dinero han gastado.
-- INNER JOIN combina clientes con sus pagos.
-- SUM(p.amount) calcula el total pagado por cada cliente.
-- GROUP BY agrupa correctamente por cliente usando su ID y nombre.
-- ORDER BY DESC muestra primero los que más han gastado.
-- LIMIT 5 devuelve solo los cinco primeros.


--========================================================================================
-- 35. Selecciona todos los actores cuyo primer nombre es 'Johnny'.
--========================================================================================
SELECT
	CONCAT(first_name, ' ', last_name) AS "nombre_completo_actor"
FROM actor
WHERE first_name ILIKE 'Johnny'
ORDER BY last_name;

-- Resultado Consulta 35: Se muestran los 2 actores con nombre 'Johnny', se utiliza 
-- ILIKE para que no discrimine por mayúsculas o minúsculas. Resultado ordenado 
-- alfabéticamente por apellido.


--========================================================================================
-- 36. Renombra la columna “first_nameˮ como Nombre y “last_nameˮ como 
-- Apellido.
--========================================================================================
SELECT
	first_name AS "Nombre",
	last_name AS "Apellido"
FROM actor;

-- Resultado Consulta 36: Se utiliza la cláusula AS para renombrar las columnas.
-- Este cambio solo afecta a la visualización del resultado, no modifica la tabla original.
-- La misma lógica se puede aplicar a otras tablas que contengan estos campos, 
-- como customer (sustituyendo "FROM actor;" por "FROM customer;") 
-- o staff (sustituyendo "FROM actor;" por "FROM staff;").


--========================================================================================
-- 37. Encuentra el ID del actor más bajo y más alto en la tabla actor.
--========================================================================================
SELECT 
    actor_id,
    CONCAT(first_name, ' ', last_name) AS "nombre_completo_actor"
FROM actor
WHERE actor_id = (
        SELECT MIN(actor_id) FROM actor
    )
   OR actor_id = (
        SELECT MAX(actor_id) FROM actor
    );

-- Resultado Consulta 37: Se muestran los actores con el ID más bajo y más alto de la 
-- tabla. Se utilizan subconsultas con MIN(actor_id) y MAX(actor_id) para obtener esos
--  valores.
-- La cláusula WHERE filtra los registros que coinciden con dichos IDs.


--========================================================================================
-- 38. Cuenta cuántos actores hay en la tabla “actorˮ.
--========================================================================================
SELECT COUNT(actor_id) AS "Total:actores"
FROM actor;

-- Resultado Consulta 38: Uso de Count. En total hay 200 actores. 


--========================================================================================
-- 39. Selecciona todos los actores y ordénalos por apellido en orden 
-- ascendente.
--========================================================================================
SELECT CONCAT(last_name, ', ', first_name) AS "apellido_y_nombre_actor"
FROM actor
ORDER BY last_name;

-- Resultado Consulta 39: Se listan todos los actores mostrando "apellido, nombre" en
--  una sola columna usando CONCAT. 
-- ORDER BY last_name organiza los resultados alfabéticamente por apellido de 
-- forma ascendente. ASC se omite porque es el orden predeterminado en SQL.


--========================================================================================
-- 40. Selecciona las primeras 5 películas de la tabla “filmˮ.
--========================================================================================
SELECT title AS "título_película"
FROM film
LIMIT 5;

-- Resultado Consulta 40: Se muestran los primeros 5 registros de la tabla `film`. 
-- La cláusula LIMIT 5 restringe el resultado a solo cinco filas.
-- No se especifica orden, por lo que SQL devuelve las primeras filas 
--- según el orden interno de la tabla.


--========================================================================================
-- 41. Agrupa los actores por su nombre y cuenta cuántos actores tienen el 
-- mismo nombre. ¿Cuál es el nombre más repetido?
--========================================================================================
-- Parte Primera -Agrupación-
SELECT 
    first_name AS "nombre_actor",
    COUNT(first_name) AS "nombre_veces_repetido"
FROM actor
GROUP BY first_name
ORDER BY COUNT(first_name) DESC;

-- Resultado Consulta 41 Parte Primera:
-- 1) Se agrupa la tabla `actor` por el campo `first_name` usando GROUP BY.
-- Esto permite contar cuántos actores comparten cada nombre.
-- 2) COUNT(first_name) devuelve el número de veces que aparece cada nombre.
-- 3) ORDER BY COUNT(first_name) DESC ordena los resultados de mayor a menor, 
-- mostrando primero el nombre más repetido.
-- 4) La columna "nombre_veces_repetido" indica cuántos actores tienen ese mismo nombre.
-- Con esta consulta se puede identificar rápidamente cuál es el nombre de actor
-- más común en la base de datos.

-- Parte Segunda -Nombre más repetido-
WITH nombre_frecuencia AS (
    SELECT 
        first_name AS "nombre_actor",
        COUNT(*) AS "nombre_veces_repetido"
    FROM actor
    GROUP BY first_name
)
SELECT *
FROM nombre_frecuencia
WHERE nombre_veces_repetido = (
    SELECT MAX(nombre_veces_repetido) FROM nombre_frecuencia
);

-- Resultado Consulta 41 Parte Segunda: Muestra todos los nombres más repetidos y
--  cuántas veces aparecen, incluyendo empates.
-- Se crea un CTE que cuenta cuántas veces aparece cada first_name.
-- Se obtiene el valor máximo de repeticiones (MAX(nombre_veces_repetido)).
-- Se filtran todos los nombres cuya frecuencia sea igual a ese máximo.


--========================================================================================
-- 42. Encuentra todos los alquileres y los nombres de los clientes que los 
-- realizaron.
--========================================================================================
SELECT 	rental_id ,
		CONCAT (first_name, ' ', last_name ) AS "cliente_nombre_completo",
		rental_date AS "Fecha_Alquiler"
FROM rental r
INNER JOIN customer c ON r.customer_id = c.customer_id
ORDER BY rental_date;

-- Resultado Consulta 42: Muestra todos los alquileres con el ID, el nombre completo 
-- del cliente y la fecha de alquiler, ordenados cronológicamente ascendente.


--========================================================================================
-- 43. Muestra todos los clientes y sus alquileres si existen, incluyendo 
-- aquellos que no tienen alquileres.
--========================================================================================
SELECT
	CONCAT(c.first_name, ' ', c.last_name) AS "nombre_completo_cliente",
	r.rental_id
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
ORDER BY c.first_name;

-- Resultado Consulta 43: Se listan todos los clientes por orden alfabético 
-- junto con sus alquileres (si los tienen).
-- LEFT JOIN garantiza que se incluyan todos los clientes, aunque no tengan registros 
-- de alquiler (aparecería rental_id como Null).


--========================================================================================
-- 44. Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor 
-- esta consulta? ¿Por qué? Deja después de la consulta la contestación.
--========================================================================================
SELECT 
	f.film_id,
    f.title,
    c.category_id,
    c.name AS category_name
FROM film f
CROSS JOIN category c;

-- Resultado Consulta 44: No aporta valor práctico, principales motivos:
-- 1. Crea un producto cartesiano: Todas las películas * todas las categorías.
-- 2. Las tablas NO están relacionadas directamente (falta tabla intermedia).
-- 3. Asigna TODAS las categorías a TODAS las películas (incorrecto). 
-- EXCEPCIÓN:
-- Sí aporta valor si necesitas obtener TODAS las combinaciones posibles
-- entre películas y categorías.
-- Propuesta de código para que tenga valor práctico (cada película con su categoría):
SELECT 
	f.title, 
	c.name
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id;


--========================================================================================
-- 45. Encuentra los actores que han participado en películas de la categoría 
-- 'Action'.
--========================================================================================
SELECT 
	CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo_actor",
	f.title AS "título_película",
	c.name AS "categoría"
FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON fa.actor_id = a.actor_id
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE c.name ILIKE 'Action'
ORDER BY a.first_name ;

-- Resultado Consulta 45: Se muestran los actores que participaron en 
-- películas de la categoría "Action", junto con el título de cada película y la 
-- categoría. La consulta une varias tablas para relacionar actores, películas 
-- y categorías, filtrando solo las películas de acción.
-- Se usa INNER JOIN porque queremos incluir solo los registros que tienen 
-- coincidencias en todas las tablas relacionadas.


--========================================================================================
-- 46. Encuentra todos los actores que no han participado en películas.
--========================================================================================
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo_actor"
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id IS NULL
ORDER BY a.first_name, a.last_name;

-- Resultado Consulta 46: Actores sin películas: ninguno. Para ello, el código usado:
-- LEFT JOIN mantiene todos los actores, aunque no tengan películas.
-- fa.film_id IS NULL selecciona solo los actores sin participacion en películas.
-- CONCAT une nombre y apellido en una sola columna.
-- ORDER BY ordena alfabéticamente por nombre y apellido.


--========================================================================================
-- 47. Selecciona el nombre de los actores y la cantidad de películas en las 
-- que han participado.
--========================================================================================
SELECT 
    a.actor_id,
	CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo_actor",
    COUNT(fa.film_id) AS "número_películas"
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY COUNT(fa.film_id) DESC;

-- Resultado Consulta 47: La consulta muestra todos los actores y cuántas películas 
-- han hecho.
-- LEFT JOIN asegura que los actores sin películas también aparezcan (con 0).
-- COUNT(fa.film_id) cuenta las películas por actor.
-- GROUP BY a.actor_id,a.first_name, a.last_name agrupa por actor para hacer el conteo.
-- ORDER BY COUNT(fa.film_id) DESC lista primero los actores con más películas.
-- Record de Susan Davis con 54 películas.


--========================================================================================
-- 48. Crea una vista llamada “actor_num_peliculasˮ que muestre los nombres 
-- de los actores y el número de películas en las que han participado.
--========================================================================================
CREATE VIEW actor_num_peliculas AS
SELECT 
    a.actor_id,
	CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo_actor",
    COUNT(fa.film_id) AS "número_películas"
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY COUNT(fa.film_id) DESC;

SELECT * 
FROM actor_num_peliculas
ORDER BY "número_películas" DESC;

-- Resultado Consulta 48: Creada vista sobre el código del ejercicio anterior (47).
-- Luego para consultar: se usa el select sobre esa vista creada y se ordena por 
-- número de películas descente.


--========================================================================================
-- 49. Calcula el número total de alquileres realizados por cada cliente.
--========================================================================================
SELECT 
	c.customer_id,		
	CONCAT(c.first_name, ' ', c.last_name) AS "nombre_completo_cliente",
	COUNT(r.rental_id) AS "total_alquileres"
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id,	c.first_name, c.last_name
ORDER BY COUNT(r.rental_id) DESC;

-- Resultado Consulta 49: La consulta calcula el número total de alquileres 
-- realizados por cada cliente por orden descendente del total.
-- CONCAT se usa para mostrar el nombre completo del cliente (nombre + apellido).
-- LEFT JOIN entre customer y rental para incluir todos los clientes, incluso los 
-- que no han realizado alquileres (su total será 0).
-- Se agrupa por customer_id (PK) y, luego, por nombre y apellido del cliente para 
-- contar correctamente los alquileres.


--========================================================================================
-- 50. Calcula la duración total de las películas en la categoría 'Action'.
--========================================================================================
SELECT 
	SUM(f.length) AS "duración_total"
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action';

-- Resultado Consulta 50: 7,143 (asumimos unidad minutos)


--========================================================================================
-- 51. Crea una tabla temporal llamada “cliente_rentas_temporalˮ para 
-- almacenar el total de alquileres por cliente.
--========================================================================================
CREATE TEMPORARY TABLE cliente_rentas_temporal AS

SELECT 
	c.customer_id,	
	CONCAT(c.first_name, ' ', c.last_name) AS "nombre_completo_cliente",
	COUNT(r.rental_id) AS "total_alquileres"
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY COUNT(r.rental_id) DESC;

SELECT *
FROM cliente_rentas_temporal;

 -- Resultado Consulta 51: Creada tabla temporal que solo existe durante la 
 -- sesión actual y luego se añade el código de un ejercicio anterior (49).


--========================================================================================
-- 52. Crea una tabla temporal llamada “peliculas_alquiladasˮ que almacene las 
-- películas que han sido alquiladas al menos 10 veces.
--========================================================================================
WITH peliculas_alquiladas AS (
	SELECT f.film_id,
	       f.title AS "Titulo_Pelicula",
	       COUNT(r.rental_id) AS "Total_Alquileres"
	FROM film f
	INNER JOIN inventory i ON f.film_id = i.film_id
	INNER JOIN rental r ON i.inventory_id = r.inventory_id
	GROUP BY f.film_id, f.title
	HAVING COUNT(r.rental_id) >= 10
)
SELECT * FROM peliculas_alquiladas;

-- Resultado Consulta 52: Se listan películas alquiladas al menos 10 veces.
-- Se usa un CTE (WITH ... AS) que existe solo durante la consulta, 
-- a diferencia de una tabla temporal que permanece durante la sesión.


--========================================================================================
-- 53. Encuentra el título de las películas que han sido alquiladas por el cliente 
-- con el nombre ‘Tammy Sandersʼ y que aún no se han devuelto. Ordena 
-- los resultados alfabéticamente por título de película.
--========================================================================================
SELECT 	f.title AS "título_película",
		c.first_name AS "nombre",
		c.last_name AS "apellido",
		r.return_date AS "día_devolución"
FROM rental r 
INNER JOIN customer c ON r.customer_id = c.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
WHERE c.first_name ILIKE 'Tammy' 
	AND c.last_name ILIKE 'Sanders' 
	AND r.return_date IS NULL 
ORDER BY f.title
;

-- Resultado Consulta 53: La consulta muestra 3 películas sin devolver aun por Tammy S.


--========================================================================================
-- 54. Encuentra los nombres de los actores que han actuado en al menos una 
-- película que pertenece a la categoría ‘Sci-Fiʼ. Ordena los resultados 
-- alfabéticamente por apellido.
--========================================================================================
SELECT 
    a.actor_id,
    CONCAT(a.last_name, ', ', a.first_name) AS "apellido_y_nombre_actor",
    COUNT(f.film_id) AS "número_películas"
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Sci-Fi' 
  AND a.actor_id >= 1
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY a.last_name;

-- Resultado Consulta 54: Se usan INNER JOIN para conectar las tablas relacionadas
-- (actor → film_actor → film → film_category → category).
-- WHERE c.name = 'Sci-Fi' filtra solo la categoría Sci-Fi.
-- COUNT(f.film_id) cuenta cuántas películas de Sci-Fi tiene cada actor.
-- GROUP BY asegura que el conteo sea por actor.
-- ORDER BY a.last_name organiza los resultados alfabéticamente por apellido.


--========================================================================================
-- 55. Encuentra el nombre y apellido de los actores que han actuado en 
-- películas que se alquilaron después de que la película ‘Spartacus 
-- Cheaperʼ se alquilara por primera vez. Ordena los resultados 
-- alfabéticamente por apellido.
--========================================================================================
SELECT DISTINCT
    a.first_name AS "nombre",
    a.last_name AS "apellido"
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN inventory i ON fa.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_date > (
    SELECT MIN(r2.rental_date)
    FROM rental r2
    INNER JOIN inventory i2 ON r2.inventory_id = i2.inventory_id
    INNER JOIN film f ON i2.film_id = f.film_id
    WHERE f.title ILIKE 'Spartacus Cheaper'
)
ORDER BY a.last_name ASC;

-- Resultado Consulta 55: Principales características consulta:
-- Subconsulta: Obtiene la PRIMERA fecha de alquiler de 'Spartacus Cheaper'
-- Consulta principal: Busca actores en películas alquiladas DESPUÉS de esa fecha
-- DISTINCT: Evita actores duplicados (un actor puede actuar en varias películas)
-- INNER JOINs: Conecta actor → film_actor → inventory → rental


--========================================================================================
-- 56. Encuentra el nombre y apellido de los actores que no han actuado en 
-- ninguna película de la categoría ‘Musicʼ.
--========================================================================================
SELECT
	a.first_name AS "nombre",
	a.last_name AS "apellido"
FROM actor a 
WHERE a.actor_id NOT IN (	
	SELECT DISTINCT fa.actor_id
	FROM film_actor fa 
	INNER JOIN film_category fc ON fa.film_id = fc.film_id 
	INNER JOIN category c ON fc.category_id = c.category_id
	WHERE c.name = 'Music' 
)
ORDER BY a.first_name, a.last_name;

-- Resultado Consulta 56: Se listan los actores que no han participado en ninguna 
-- película de la categoría ‘Music’.
-- La subconsulta obtiene los actor_id de todos los actores que sí han actuado en 
-- películas de categoría Music.
-- NOT IN filtra los actores que no aparecen en esa lista.
-- ORDER BY a.first_name, a.last_name organiza los resultados alfabéticamente por 
-- nombre y apellido.
-- DISTINCT en la subconsulta evita contar un mismo actor varias veces.


--========================================================================================
-- 57. Encuentra el título de todas las películas que fueron alquiladas por más 
-- de 8 días.
--========================================================================================
SELECT 	f.title, r.rental_date, r.return_date,
		DATE_PART('day', r.return_date - r.rental_date) AS "días_alquilado"
FROM film f 
INNER JOIN inventory i ON f.film_id =i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
WHERE 	r.rental_date IS NOT NULL 
		AND r.return_date - r.rental_date > INTERVAL '8 days'
ORDER BY "días_alquilado" DESC;

-- Resultado Consulta 57: 
-- Se calcula la duración del alquiler con r.return_date - r.rental_date.
-- Date_Part('day', ...) convierte esa diferencia en número de días.
-- WHERE ... > INTERVAL '8 days' filtra solo los alquileres que duraron más de 8 días.
-- INNER JOIN asegura que solo se consideren películas con alquileres registrados.
-- ORDER BY "días_alquilado" DESC muestra primero los alquileres más largos.

--========================================================================================
-- 58. Encuentra el título de todas las películas que son de la misma categoría 
-- que ‘Animationʼ.
--========================================================================================
SELECT f.title AS "título_película"
FROM film f 
INNER JOIN film_category fc ON f.film_id = fc.film_id
WHERE fc.category_id = (
	SELECT c.category_id
	FROM category c 
	WHERE c."name" ILIKE 'Animation')
ORDER BY f.title;

-- Resultado Consulta 58: Se muestran los títulos de todas las películas que pertenecen
-- a la misma categoría que “Animation”.
--La subconsulta obtiene el category_id correspondiente a “Animation”.
-- Luego, la consulta principal selecciona todas las películas que tengan ese category_id.

--========================================================================================
-- 59. Encuentra los nombres de las películas que tienen la misma duración 
-- que la película con el título ‘Dancing Feverʼ. Ordena los resultados 
-- alfabéticamente por título de película.
--========================================================================================
SELECT
	title AS "título_película",
	length AS "duración"
FROM film
WHERE length = (
	SELECT length 
	FROM film 
	WHERE title ILIKE 'Dancing Fever')
ORDER BY title;

-- Resultado Consulta 59: Se muestran los títulos de todas las películas que tienen 
--la misma duración que la película “Dancing Fever”.
-- La subconsulta obtiene la duración de “Dancing Fever”.
-- La consulta principal selecciona todas las películas con esa duración.
-- ORDER BY f.title organiza los resultados alfabéticamente por título.


--========================================================================================
-- 60. Encuentra los nombres de los clientes que han alquilado al menos 7 
-- películas distintas. Ordena los resultados alfabéticamente por apellido.
--========================================================================================
SELECT
	c.first_name AS "nombre",
	c.last_name AS "apellido",
	COUNT (DISTINCT f.film_id) AS "películas_alquiladas"
FROM customer c 
INNER JOIN rental r ON c.customer_id = r.customer_id 
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT (DISTINCT f.film_id) >= 7
ORDER BY c.last_name;

-- Resultado Consulta 60: COUNT(DISTINCT f.film_id) garantiza que se cuenten
-- solo películas diferentes. HAVING filtra aquellos con 7 o más películas alquiladas.
-- El resultado se ordena alfabéticamente por apellido.


--========================================================================================
-- 61. Encuentra la cantidad total de películas alquiladas por categoría y 
-- muestra el nombre de la categoría junto con el recuento de alquileres.
--========================================================================================
SELECT 	c."name" AS "categoría",
		count (r.rental_id) AS "total_alquileres"
FROM rental r 
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY c."name"
ORDER BY "total_alquileres" DESC ;

-- Resultado Consulta 61: Muestra el total de películas alquiladas por cada categoría.
-- Se cuentan todos los registros de rental relacionados con cada category.
-- ORDER BY total_alquileres DESC coloca primero las categorías más populares.


--========================================================================================
-- 62. Encuentra el número de películas por categoría estrenadas en 2006.
--========================================================================================
SELECT
	COUNT(f.film_id) AS "número_películas",
	c."name" AS "categoría",
	f.release_year AS "año_estreno"
FROM film f 
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE f.release_year = 2006
GROUP BY c."name", f.release_year
ORDER BY "número_películas" DESC;

-- Resultado Consulta 62: Muestra el total de películas alquiladas por cada categoría.
-- Se cuentan todos los registros de rental relacionados con cada category.
-- ORDER BY total_alquileres DESC coloca primero las categorías más populares.


--========================================================================================
-- 63. Obtén todas las combinaciones posibles de trabajadores con las tiendas 
-- que tenemos.
--========================================================================================
SELECT
	s.staff_id,
	CONCAT (s.first_name, ' ', s.last_name) AS "nombre_completo_empleado",
	s2.store_id AS "ID_Tienda"
FROM staff s 
CROSS JOIN store s2 ;

-- Resultado Consulta 63: Muestra todas las combinaciones posibles de 
-- empleados y tiendas (producto cartesiano).
-- CROSS JOIN genera cada par posible entre staff y store.
-- Útil solo si se necesitan todas las combinaciones, no información real de asignación.


--========================================================================================
-- 64. Encuentra la cantidad total de películas alquiladas por cada cliente y 
-- muestra el ID del cliente, su nombre y apellido junto con la cantidad de 
-- películas alquiladas.
--========================================================================================
SELECT
	c.customer_id,
	CONCAT (first_name, ' ', last_name ) AS "nombre_completo_cliente",
	COUNT(r.rental_id) AS "número_películas_alquiladas"
FROM rental r 
LEFT JOIN customer c ON r.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY COUNT(r.rental_id) DESC;

-- Resultado Consulta 64: Muestra el total de películas alquiladas por cada cliente.
-- COUNT(r.rental_id) cuenta todos los alquileres.
-- LEFT JOIN asegura incluir clientes que hayan alquilado al menos una película.
-- ORDER BY COUNT(r.rental_id) DESC muestra primero los clientes que más han alquilado.