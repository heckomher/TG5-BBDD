-- PARTE 1
-- Creación de Base de datos
CREATE DATABASE telovendo2;
-- Creación de usuario con todos los privilegios
use telovendo2;
CREATE USER 'administraidor'@'%' IDENTIFIED BY 'Clave_Pulent4';
GRANT ALL PRIVILEGES ON telovendo2.* TO 'administraidor'@'%';
-- PARTE 2
-- Creación de tabla usuarios
create table usuarios (
	id_usuario integer primary key auto_increment ,
	nombre varchar(60) not null,
	apellido varchar(100) not null,
	contrasena varchar(100) ,
	creacion timestamp DEFAULT ( CONVERT_TZ(CURRENT_TIMESTAMP(),'-04:00','-03:00')),
	genero varchar(20),
	telefono int
);
-- Creación tabla ingreso 
CREATE TABLE ingresos (
	id_ingreso integer primary key auto_increment,
    foreign key (id_usuario) references usuarios(id_usuario),
    fecha_hora_ingreso timestamp default now()
);
-- PARTE 3
-- Cambiar Zona horaria
ALTER TABLE usuarios MODIFY COLUMN creacion timestamp DEFAULT 
(CONVERT_TZ(CURRENT_TIMESTAMP(), '-03:00', '-02:00'));
-- PARTE 4
-- Ingresar usuarios
INSERT INTO  usuarios (nombre, apellido, contrasena, genero, telefono) VALUES
( 'Juan' , 'Pérez' , '12345678' , 'no binario' , 895478889),
( 'Paula' , 'Cáceres' , '98754621' , 'Femenino' , 98745565),
( 'Emilio' , 'Scheffaer' , 'emi123456' , 'Trans' , 85697456),
( 'Marianela' , 'Neira' , 'nela574' , 'Femenino' , 78544598) ,
( 'Gabriel' , 'Jackson' , 'gabo987' , 'Masculino' , 66772222);	
-- Creación de registros
insert into ingreso_usuarios (id_usuario) values 
(1),(7),(7),(3),(2),(10),(6),(8);
-- PARTE 5

-- Tanto el nombre como el apellido y la contraseña, son conjuntos de caracteres, por lo que el uso de "varchar" se justifica, la longitud es apropiada y permite poner una cadena larga en la contraseña
-- los ID son números enteros con autoincremento para que se generen de forma automática
-- en el campo teléfono, se deja como número entero, el cual es apropiado para el tipo de dato.

-- PARTE 6
-- Creación de tabla contactos
CREATE TABLE contactos (
  id_contacto INT PRIMARY KEY auto_increment,
  id_usuario INT,
  numero_telefono INT,
  correo_electronico VARCHAR(50),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
  );
-- Se cargan datos a tabla contactod
insert into Contactos (id_usuario , numero_telefono, correo_electronico) values
( 3 , 458755556 , 'david.johson@gmail.com' ),
( 6 , 785545555 , 'emybrowny@gmail.com'),
( 8 , 985455855 , 'olitomp.son@gmail.com'),
( 1 , 985455669 , 'juanito.pe@gmail.com'),
( 4 , 358855445 , 'sarita.davi@gmail.com') ,
( 7 , 965588884 , 'danymar.q@gmail.com'),
( 10 , 455588995 , 'emi.shae@gmail.com' ),
( 11 , 585544556 , 'neira.marian@gmail.com');
-- Se elimina teléfono desde tabla usuarios
ALTER TABLE usuarios drop column telefono;
