-- pregunta 1 

DROP TABLE IF EXISTS reparto;
DROP TABLE IF EXISTS peliculas; 

CREATE TABLE peliculas (
    id SERIAL,
    pelicula VARCHAR(60),
    año_estreno INT,
    director  VARCHAR(30),
    primary key (id)
);

\copy peliculas FROM 'peliculas.csv' csv header;  

CREATE TABLE reparto (
    id_pelicula INT,
    actor VARCHAR(30),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)
);

\copy reparto FROM 'reparto.csv' csv; 

-- Pregunta 2

SELECT * FROM peliculas;
SELECT * FROM reparto;

-- pregunta3

SELECT id FROM peliculas WHERE pelicula= 'Titanic';

-- pregunta 4


SELECT actor, peliculas FROM reparto, peliculas WHERE pelicula= 'Titanic' and id_pelicula=2; 

-- pregunta 5
SELECT COUNT(pelicula) FROM peliculas, reparto WHERE actor= 'Harrison Ford' and id=id_pelicula;
SELECT actor FROM reparto WHERE actor= 'Harrison Ford';

--pregunta 6
SELECT pelicula, año_estreno FROM peliculas WHERE año_estreno <= '1999' and año_estreno >= 1990 ORDER BY año_estreno DESC;

-- pregunta 7 (considerar que el espacio cuenta)
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas;

-- pregunta 8
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas ORDER BY longitud_titulo ASC LIMIT(1); 
