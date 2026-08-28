# SQL Retail Analytics

## DESCRIPCIÓN

Este proyecto consiste en construir un entorno de análisis a partir de un conjunto de archivos CSV que representan la operación de una empresa retail.

Los datos son cargados y organizados en una base de datos DuckDB, donde se realiza el modelado, limpieza y normalización necesarios para estructurar la información. A partir de esta base de datos se desarrollan consultas SQL orientadas a responder preguntas de negocio, simulando el trabajo de un analista de datos.

## OBJETIVO

Transformar datos operativos en información útil mediante consultas SQL, generando análisis que apoyen la toma de decisiones de una empresa retail.

## ¿POR QUÉ DUCKDB?

DuckDB fue elegido porque permite trabajar directamente con archivos CSV y bases de datos analíticas sin necesidad de instalar ni administrar un servidor, permitiendo centrar el proyecto en SQL.

Además, la base de datos `retail.duckdb` forma parte del proyecto y contiene el modelo relacional construido a partir de los datos disponibles.

## TECNOLOGÍAS

* SQL
* DuckDB
* Git
* GitHub

## ESTRUCTURA DEL PROYECTO

```text
sql-retail-analytics/
├── data/
│   ├── raw/          # Archivos CSV originales
│   └── exports/      # Espacio destinado a resultados exportados
├── db/
│   └── retail.duckdb # Base de datos DuckDB del proyecto
├── docs/             # Documentación y modelo de datos
├── sql/              # Consultas SQL
├── .gitignore
└── README.md
```

> La carpeta `data/exports/` se mantiene como parte de la estructura del proyecto, pero no fue utilizada en esta versión. Los análisis se realizaron directamente mediante consultas SQL sobre la base de datos DuckDB.
