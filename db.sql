-- Crea la base de datos
CREATE DATABASE delilah

-- Usa la base de datos
use delilah

-- Crea las tablas correspondientes
CREATE table meals (
	id_meal int not null primary key auto_increment,
	nombre_meal varchar(255),
	precio int,
	img varchar(255),
	date_creation timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE table users (
	id_user int not null primary key auto_increment,
	nombre_user varchar(255),
	email varchar(255) not null unique,
	phone varchar(255),
	address varchar(255),
	contrasena varchar(255),
	id_role int
);

CREATE table orders (
	id_order int not null primary key auto_increment,
	id_user int,
	id_meal int,
	hora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_forma_pago int,
	id_status int
);

CREATE table status (
	id_status int not null primary key auto_increment,
	nombre_status varchar(255)
);

create table users_roles(
	id_role int not null primary key auto_increment,
	nombre_role varchar(255)
);

CREATE table forma_pago (
	id_forma_pago int not null primary key auto_increment,
	nombre_forma_pago varchar(255)
);

-- Crear FOREIGN KEY
ALTER table users add CONSTRAINT users_fk_1 FOREIGN KEY (id_role) REFERENCES users_roles (id_role);

ALTER table orders add CONSTRAINT orders_fk_1 FOREIGN KEY (id_user) REFERENCES users (id_user);

ALTER table orders add CONSTRAINT orders_fk_2 FOREIGN KEY (id_meal) REFERENCES meals (id_meal);

ALTER table orders add CONSTRAINT orders_fk_3 FOREIGN KEY (id_status) REFERENCES status (id_status);

ALTER table orders add CONSTRAINT orders_fk_4 FOREIGN KEY (id_forma_pago) REFERENCES forma_pago (id_forma_pago);

-- Ingresar contenido a la tabla status
INSERT into status(nombre_status) values ('Nuevo');

INSERT into status(nombre_status) values ('Confirmado');

INSERT into status(nombre_status) values ('Preparando');

INSERT into status(nombre_status) values ('Enviando');

INSERT into status(nombre_status) values ('Entregado');

-- Ingresar contenido a la tabla users_role
INSERT into users_roles (nombre_role) values ('admin');

INSERT into users_roles (nombre_role) values ('user');

-- Ingresar contenido a la tabla forma_pago
INSERT INTO forma_pago (nombre_forma_pago) values ('Efectivo');

INSERT INTO forma_pago (nombre_forma_pago) values ('Tarjeta de débito');

INSERT INTO forma_pago (nombre_forma_pago) values ('Tarjeta de crédito');

--Listo la base de datos ya estaría configurada