CREATE DATABASE biblioteca;

CREATE TABLE lectores(
    id_lector SERIAL,
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    nombre VARCHAR(50),
    PRIMARY KEY (id_lector)
);

INSERT INTO lectores(apellido_paterno, apellido_materno, nombre) VALUES ('Perez', 'Gomez', 'Juan');
INSERT INTO lectores(apellido_paterno, apellido_materno, nombre) VALUES ('Ortega', 'Pereira', 'Margarita');
INSERT INTO lectores(apellido_paterno, apellido_materno, nombre) VALUES ('García', 'Contreras', 'Rosa');
INSERT INTO lectores(apellido_paterno, apellido_materno, nombre) VALUES ('López', 'Molina', 'Ana');

CREATE TABLE editoriales(
    id_editorial SERIAL,
    nombre_editorial VARCHAR(50),
    PRIMARY KEY (id_editorial)
);

INSERT INTO editoriales(nombre_editorial) VALUES ('UTHEA');
INSERT INTO editoriales(nombre_editorial) VALUES ('Reverté');
INSERT INTO editoriales(nombre_editorial) VALUES ('McGrawHill');
INSERT INTO editoriales(nombre_editorial) VALUES ('MIR');

CREATE TABLE titulos(
    codigo_libro VARCHAR(3),
    titulo_libro VARCHAR(100),
    PRIMARY KEY (codigo_libro)
);

INSERT INTO titulos(codigo_libro, titulo_libro) VALUES ('515', 'Ecuaciones diferenciasles para ingenieros y ciéntificos');
INSERT INTO titulos(codigo_libro, titulo_libro) VALUES ('540', 'Química');
INSERT INTO titulos(codigo_libro, titulo_libro) VALUES ('530', 'Física');
INSERT INTO titulos(codigo_libro, titulo_libro) VALUES ('519', 'Estadística');
INSERT INTO titulos(codigo_libro, titulo_libro) VALUES ('512', 'Algebra Lineal');

CREATE TABLE autores(
    codigo_autor SERIAL,
    nombre_autor VARCHAR(100),
    PRIMARY KEY (codigo_autor)
);

INSERT INTO autores(nombre_autor) VALUES ('Lambe,C');
INSERT INTO autores(nombre_autor) VALUES ('Christen, Hans Rudolf');
INSERT INTO autores(nombre_autor) VALUES ('Serway, Raymond A.');
INSERT INTO autores(nombre_autor) VALUES ('G Tanner, C. J.');
INSERT INTO autores(nombre_autor) VALUES ('Murray Spiegel');
INSERT INTO autores(nombre_autor) VALUES ('Voevodin, Valentin V');

CREATE TABLE devoluciones(
    codigo_libro VARCHAR(3),
    id_lector INT,
    fecha_devolucion DATE NOT NULL,
    FOREIGN KEY (codigo_libro) REFERENCES titulos(codigo_libro),
    FOREIGN KEY (id_lector) REFERENCES lectores(id_lector)
);

INSERT INTO devoluciones(codigo_libro, id_lector, fecha_devolucion) VALUES ('515', 1, '15/09/19');
INSERT INTO devoluciones(codigo_libro, id_lector, fecha_devolucion) VALUES ('540', 2, '23/08/19');
INSERT INTO devoluciones(codigo_libro, id_lector, fecha_devolucion) VALUES ('530', 3, '24/09/19');
INSERT INTO devoluciones(codigo_libro, id_lector, fecha_devolucion) VALUES ('519', 4, '18/09/19');
INSERT INTO devoluciones(codigo_libro, id_lector, fecha_devolucion) VALUES ('512', 1, '17/09/19');

CREATE TABLE libro_editorial(
    codigo_libro VARCHAR(3),
    id_editorial INT,
    FOREIGN KEY (codigo_libro) REFERENCES titulos(codigo_libro),
    FOREIGN KEY (id_editorial) REFERENCES editoriales(id_editorial)
);

INSERT INTO libro_editorial(codigo_libro, id_editorial) VALUES ('515', 1);
INSERT INTO libro_editorial(codigo_libro, id_editorial) VALUES ('540', 2);
INSERT INTO libro_editorial(codigo_libro, id_editorial) VALUES ('530', 3);
INSERT INTO libro_editorial(codigo_libro, id_editorial) VALUES ('519', 3);
INSERT INTO libro_editorial(codigo_libro, id_editorial) VALUES ('512', 4);

CREATE TABLE libro_autor(
    codigo_libro VARCHAR(3),
    codigo_autor INT,
    FOREIGN KEY (codigo_libro) REFERENCES titulos(codigo_libro),
    FOREIGN KEY (codigo_autor) REFERENCES autores(codigo_autor)
);

INSERT INTO libro_autor(codigo_libro, codigo_autor) VALUES ('515', 1);
INSERT INTO libro_autor(codigo_libro, codigo_autor) VALUES ('540', 2);
INSERT INTO libro_autor(codigo_libro, codigo_autor) VALUES ('530', 3);
INSERT INTO libro_autor(codigo_libro, codigo_autor) VALUES ('515', 4);
INSERT INTO libro_autor(codigo_libro, codigo_autor) VALUES ('519', 5);
INSERT INTO libro_autor(codigo_libro, codigo_autor) VALUES ('512', 6);



