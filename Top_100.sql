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