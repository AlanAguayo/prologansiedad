# Sistema experto para detectar la ansiedad y sus trastornos
Instituto tecnológico de Celaya

Un sistema experto para ayudar en la detección de niveles de ansiedad y de sus trastornos.

## |  Experto 
    Cassandra Abigail Conejo Tierrafría

## | Requisitos 
| Software | Versión |
| ----------- | ----------- |
| SWI-prolog | 8.4.3 |
| MySQL ODBC ANSI Driver | 8.0  |  
| MariaDB | 10.4.24  |  

## | Setup de la base de datos
    create database ansiedad;
    create table paciente (Id int primary key,nombre varchar (100),apellidos varchar(100), fecha_diagnostico DATE, indice varchar (50),transtorno varchar(50));

Crear un OBDC para la base de datos con el nombre de MSProlog

## | Uso
![imagen](https://user-images.githubusercontent.com/89956366/207779508-fbedd12d-41aa-46a6-a593-e50f218b9f62.png)
    En caso de que la sumatoria de puntuación malestares sea mayor a 35, se diagnostica una ansiedad severa, que da paso a la encuesta para detectar los distintos trastornos que esta puede conllevar  
![imagen](https://user-images.githubusercontent.com/89956366/207779566-75f97043-3f9b-4a8b-8d8e-748fa5bdd5d3.png)
![imagen](https://user-images.githubusercontent.com/89956366/207780947-2a8490e3-c1ec-49b5-8e2e-764a265fb798.png)
![imagen](https://user-images.githubusercontent.com/89956366/207780252-db139577-85b8-49ac-aab5-c1c0458381ce.png)
