# 📖 ThePower_Lógica_Consultas_SQL
En este proyecto he aplicado los conocimientos aprendidos en el módulo de SQL del Máster en Data Analytics de The Power, trabajando sobre una base de datos relacional de películas, actores y clientes.


## 📌 Requisitos del proyecto
Las consultas pueden hacerse de distintas maneras para obtener el mismo resultado. A lo largo del proyecto se han puesto en práctica los siguientes conocimientos:
- Manejo de la herramienta DBeaver
- Consultas sobre una sola tabla
- Relaciones entre tablas mediante JOINs
- Uso de subconsultas
- Creación de vistas
- Uso de tablas temporales
- Aplicación de buenas prácticas en SQL


## 🛠 Herramientas para realizar el proyecto
- PostgreSQL
- DBeaver
- Git & GitHub


## 🗂 Estructura del proyecto
```
📦 Proyecto SQL

│── 📄 README.md
│    └── Descripción general del proyecto
│
│── 📊 SQL_Project_Diagram_&_Views.png
│   └── Esquema ER y vistas de la base de datos
│
│── 📋 DataProject_SQL_Lógica.pdf
│   └── Enunciado de las 64 consultas
│ 
│── 📋 SQL_project.sql
│   └── Consultas resueltas
│ 
│── 📁 data/BBDD_Proyecto_shakila_sinuser.sql
    └── Datos crudos y archivos de entrada
```

## 📊 Resultados y Conclusiones
Durante el desarrollo de este proyecto, realicé diversas consultas SQL sobre la base de datos de películas, actores y clientes. Esto me permitió aprender y reforzar habilidades clave en análisis de datos, desde la manipulación de tablas y relaciones hasta la agregación y filtrado de información.

Cada consulta se documenta con tres partes:

- Enunciado: plantea el objetivo a resolver.
- Código SQL: ontiene la solución implementada.
- Resultado: incluye la interpretación de los resultados, explicaciones del código y justificaciones de las decisiones tomadas. Al ser mi primer proyecto de SQL, los comentarios en esta sección son intencionadamente detallados, funcionando como una guía de aprendizaje y referencia futura.

## 🎯 Principales aprendizajes:
### 🔗 Manejo de joins y relaciones entre tablas:
Aprendí a usar INNER JOIN, LEFT JOIN, FULL JOIN y CROSS JOIN para relacionar tablas y entender cuándo incluir o excluir registros según el contexto. Por ejemplo, con LEFT JOIN pude listar todos los clientes aunque no tengan alquileres.

### 📊 Agregaciones y métricas:
Con funciones como COUNT(), SUM() y GROUP BY aprendí a calcular totales, identificar los actores más activos, los clientes más fieles y la popularidad de películas por categoría.

### 🔍 Filtros y subconsultas:
Usando WHERE, HAVING y subconsultas, pude seleccionar datos específicos, como películas alquiladas más de 8 días o actores que nunca participaron en películas de una categoría determinada.

### 🧩 Creación de vistas y tablas temporales:
Descubrí cómo organizar los resultados para consultas repetitivas usando CREATE VIEW y CREATE TEMP TABLE, lo que facilita el análisis y mejora la eficiencia.

### 📈 Ordenamiento y visualización:
Aprendí a ordenar datos (ORDER BY) y a presentar información de manera clara, combinando campos con CONCAT() para mostrar nombres completos, y a interpretar resultados de manera útil para la toma de decisiones.

💡 Cómo estos resultados son útiles:
- Permiten identificar clientes VIP o películas más populares, apoyando decisiones de marketing y promoción.
- Ayudan a analizar la oferta de películas y actores, lo que puede guiar adquisiciones o reposición de inventario.
- Facilitan la generación de reportes claros y gráficos que resumen la actividad de la base de datos.

En conjunto, el proyecto demuestra cómo transformar datos en información útil para la toma de decisiones.


## 🚀 Próximos pasos
Para seguir evolucionando en SQL y análisis de datos:
- Profundizar en CTEs y subconsultas avanzadas
- Mejorar la optimización de consultas
- Practicar con casos reales de negocio
- Explorar otros sistemas gestores (MySQL, SQL Server, etc.)
- Integrar SQL con herramientas de análisis como Python o Power BI
- Resolver más ejercicios tipo casos de negocio reales

## Autora

✒ Teresa Hidalgo (https://github.com/hidalbaila)
