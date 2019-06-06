-- CREACION DE BASE DE DATOS  (DATA y LOG)
USE master
go

SET  DATEFORMAT DMY
GO
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name='DBESTUDIO2010')
	DROP DATABASE DBESTUDIO2010
GO

CREATE DATABASE DBESTUDIO2010
COLLATE Modern_Spanish_CI_AI
GO

USE DBESTUDIO2010
GO

SET LANGUAGE SPANISH
GO


-- Creación de las Tablas y Claves Primarias
-- -----------------------------------------

CREATE TABLE ALUMNOS (
       codalu				 char(5) NOT NULL primary key,
       nomalu				 varchar(40) NOT NULL,
       email				 varchar(30) NOT NULL,
       telefono              varchar(10) NOT NULL,
       codcar                char(3) NOT NULL,
	   fecha_ins             datetime,
	   estado                char(1) NOT NULL
)
go



CREATE TABLE CARRERAS (
       codcar          char(3) NOT NULL primary key,
       nomcar          varchar(40) NOT NULL
       )
go



CREATE TABLE CURSOS (
       codcur              char(4) NOT NULL primary key,
       nomcur              varchar(35) NOT NULL,
       precio              int,
	   n_cuota			   int
)
go


CREATE TABLE NOTAS (
       semestre             char(5) NOT NULL,
       codalu               char(5) NOT NULL,
       codcur               char(4) NOT NULL,
       pp                   real NULL,
	   pt                   real NULL,
	   ex                   real NULL,
	   estado               varchar(15) NULL,
	   fec_mat              datetime NULL,
	   fech_nota            datetime NULL
       primary key(semestre,codalu,codcur)
)
go

SET DATEFORMAT DMY
GO

Insert Into CARRERAS Values('C01','Educacion Informatica')
Insert Into CARRERAS Values('C02','Administracion')
Insert Into CARRERAS Values('C03','Contabilidad')
Insert Into CARRERAS Values('C04','Idiomas')
Insert Into CARRERAS Values('C05','Ing. de Sistemas')


Insert Into ALUMNOS Values('A0001','Valencia salcedo Christian','valencia@gmail.com','12365479', 'C01', '10/10/05', '1')
Insert Into ALUMNOS Values('A0002','Ortiz Rodriguez Freddy','ortiz@gmail.com','54793245','C01', '10/10/05', '1')
Insert Into ALUMNOS Values('A0003','Silva Mejia Ruth Ketty','silva@gmail.com','12346578','C01', '10/10/05', '1')
Insert Into ALUMNOS Values('A0004','Melendez Noriega Liliana','melendez@gmail.com','34567689','C01', '10/10/05', '1')
Insert Into ALUMNOS Values('A0005','Huerta Leon Silvia','huerta@gmail.com','12345678','C01', '10/05/06', '1')
Insert Into ALUMNOS Values('A0006','Carranza Fuentes Maria Elena','carranza@gmail.com','35467899','C01', '10/05/06', '1')
Insert Into ALUMNOS Values('A0007','Prado Castro Gabriela','prado@gmail.com','34456577','C01', '10/05/06', '1')
Insert Into ALUMNOS Values('A0008','Atuncar Mesias Juan','atuncar@gmail.com','45327789','C01', '10/05/06', '1')

Insert Into ALUMNOS Values('A0009','Aguilar Zavala Patricia Elena','aguilar@gmail.com','34456678','C02', '01/04/05', '1')
Insert Into ALUMNOS Values('A0010','Rodruigez Trujillo Rubén Eduardo','rodruigez@gmail.com','56787899','C02', '01/04/05', '1')
Insert Into ALUMNOS Values('A0011','Canales Ruiz Gino Leonel','canales@gmail.com','34264556','C02', '01/04/05', '1')
Insert Into ALUMNOS Values('A0012','Ruiz Quispe Edgar','ruiz@gmail.com','24356778','C02', '10/04/05', '1')
Insert Into ALUMNOS Values('A0013','Panduro Terrazas Omar','panduro@gmail.com','23456677','C02', '10/08/06', '1')
Insert Into ALUMNOS Values('A0014','Zita Padilla Peter Wilmer','zita@gmail.com','33452333','C02', '10/08/06', '1')
Insert Into ALUMNOS Values('A0015','Ternero Ubillús Luis','ternero@gmail.com','45666789','C02', '10/08/06', '1')
Insert Into ALUMNOS Values('A0016','Rivera García Raúl Joel','rivera@gmail.com','23433332','C02', '10/08/06', '1')
Insert Into ALUMNOS Values('A0017','Pomar García Ana','pomar@gmail.com','11222345','C02', '10/08/06', '1')

Insert Into ALUMNOS Values('A0018','Palomares Venegas Mercedes','palomares@gmail.com','34445556','C03', '11/04/05', '1')
Insert Into ALUMNOS Values('A0019','Ruiz Venegaz Luis Alberto','ruiz@gmail.com','78990077','C03', '11/04/05', '1')
Insert Into ALUMNOS Values('A0020','Tejada Bernal Janet','tejada@gmail.com','3456666','C03', '11/04/05', '1')
Insert Into ALUMNOS Values('A0021','Sotelo Canales Juan Carlos','sotelo@gmail.com','23445555','C03', '11/04/05', '1')
Insert Into ALUMNOS Values('A0022','LLosa Montalvan Karla','llosa@gmail.com','67778905','C03', '11/04/05', '1')
Insert Into ALUMNOS Values('A0023','Galarza Torres Hugo','galarza@gmail.com','34525456','C03', '11/04/05', '1')

Insert Into ALUMNOS Values('A0024','Valverde Jaramillo Saul','valverde@gmail.com','23456789','C04', '04/07/06', '1')
Insert Into ALUMNOS Values('A0025','Cipriano Avila Roxana','cipriano@gmail.com','12345667','C04', '04/07/06', '1')
Insert Into ALUMNOS Values('A0026','Rodriguez Quispe Luis Alberto','rodriguez@gmail.com','34456667','C04', '10/07/06', '1')
Insert Into ALUMNOS Values('A0027','Huerta Leon Marco Antonio','huerta@gmail.com','23451122','C04', '04/07/06', '1')

Insert Into ALUMNOS Values('A0028','Ortiz Fuentes Ana María','ortiz@gmail.com','34456789','C05', '10/04/06', '1')
Insert Into ALUMNOS Values('A0029','Rivera Jaramillo Martha','rivera@gmail.com','11234566','C05', '10/04/06', '1')
Insert Into ALUMNOS Values('A0030','Bustamante Campos Guino','bustamante@gmail.com','67889923','C05', '10/04/06', '1')

-- Agregar Datos a la Tabla NOTAS
-- ===============================

Insert Into NOTAS Values('SE001','A0001','C001',11,17,19,'1',null,null)
Insert Into NOTAS Values('SE001','A0001','C003',09,15,14,'1',null,null)
Insert Into NOTAS Values('SE001','A0001','C004',18,3,10,'1',null,null)
Insert Into NOTAS Values('SE001','A0002','C001',15,9,11,'1',null,null)
Insert Into NOTAS Values('SE001','A0002','C002',11,03,18,'1',null,null)
Insert Into NOTAS Values('SE001','A0002','C003',14,13,15,'1',null,null)

Insert Into NOTAS Values('SE002','A0003','C008',12,13,10,'1',null,null)
Insert Into NOTAS Values('SE002','A0003','C005',16,14,18,'1',null,null)
Insert Into NOTAS Values('SE002','A0003','C003',8,13,15,'1',null,null)
Insert Into NOTAS Values('SE002','A0003','C004',7,14,13,'1',null,null)
Insert Into NOTAS Values('SE002','A0004','C006',11,12,12,'1',null,null)
Insert Into NOTAS Values('SE002','A0004','C007',9,11,11,'1',null,null)
Insert Into NOTAS Values('SE002','A0004','C005',7,12,10,'1',null,null)
Insert Into NOTAS Values('SE002','A0005','C004',17,16,12,'1',null,null)
Insert Into NOTAS Values('SE002','A0005','C005',12,17,20,'1',null,null)
Insert Into NOTAS Values('SE002','A0005','C003',6,13,18,'1',null,null)

Insert Into NOTAS Values('SE003','A0006','C004',16,15,19,'1',null,null)
Insert Into NOTAS Values('SE003','A0006','C006',5,12,11,'1',null,null)
Insert Into NOTAS Values('SE003','A0006','C007',8,13,7,'1',null,null)
Insert Into NOTAS Values('SE003','A0007','C002',7,9,8,'1',null,null)
Insert Into NOTAS Values('SE003','A0007','C004',12,7,10,'1',null,null)
Insert Into NOTAS Values('SE003','A0007','C005',11,6,5,'1',null,null)
Insert Into NOTAS Values('SE003','A0008','C008',5,8,15,'1',null,null)
Insert Into NOTAS Values('SE003','A0008','C009',7,4,17,'1',null,null)
Insert Into NOTAS Values('SE003','A0008','C004',5,13,13,'1',null,null)
Insert Into NOTAS Values('SE003','A0009','C005',6,13,15,'1',null,null)
Insert Into NOTAS Values('SE003','A0009','C009',18,13,17,'1',null,null)
Insert Into NOTAS Values('SE003','A0009','C010',12,15,20,'1',null,null)
Insert Into NOTAS Values('SE003','A0010','C010',16,14,20,'1',null,null)
Insert Into NOTAS Values('SE003','A0010','C001',5,12,20,'1',null,null)
Insert Into NOTAS Values('SE003','A0010','C003',12,11,11,'1',null,null)
Insert Into NOTAS Values('SE003','A0011','C001',5,13,12,'1',null,null)
Insert Into NOTAS Values('SE003','A0011','C002',11,13,15,'1',null,null)
Insert Into NOTAS Values('SE003','A0011','C004',7,03,13,'1',null,null)
Insert Into NOTAS Values('SE003','A0012','C004',10,08,14,'1',null,null)
Insert Into NOTAS Values('SE003','A0012','C005',7,10,17,'1',null,null)
Insert Into NOTAS Values('SE003','A0012','C006',17,10,13,'1',null,null)

Insert Into NOTAS Values('SE004','A0015','C001',5,13,20,'1',null,null)
Insert Into NOTAS Values('SE004','A0015','C003',14,13,14,'1',null,null)
Insert Into NOTAS Values('SE004','A0015','C004',15,12,12,'1',null,null)
Insert Into NOTAS Values('SE004','A0016','C002',6,13,14,'1',null,null)
Insert Into NOTAS Values('SE004','A0016','C003',12,11,10,'1',null,null)
Insert Into NOTAS Values('SE004','A0016','C006',17,12,13,'1',null,null)
Insert Into NOTAS Values('SE004','A0021','C004',8,17,17,'1',null,null)
Insert Into NOTAS Values('SE004','A0021','C005',14,3,18,'1',null,null)
Insert Into NOTAS Values('SE004','A0021','C006',17,12,15,'1',null,null)
Insert Into NOTAS Values('SE004','A0022','C004',17,13,11,'1',null,null)
Insert Into NOTAS Values('SE004','A0022','C005',8,13,12,'1',null,null)
Insert Into NOTAS Values('SE004','A0022','C003',7,13,17,'1',null,null)
Insert Into NOTAS Values('SE004','A0023','C004',10,13,19,'1',null,null)
Insert Into NOTAS Values('SE004','A0023','C008',12,13,16,'1',null,null)
Insert Into NOTAS Values('SE004','A0023','C009',18,13,14,'1',null,null)

Insert Into NOTAS Values('SE005','A0024','C004',10,3,11,'1',null,null)
Insert Into NOTAS Values('SE005','A0024','C005',11,9,8,'1',null,null)
Insert Into NOTAS Values('SE005','A0024','C003',16,8,7,'1',null,null)
Insert Into NOTAS Values('SE005','A0024','C007',16,13,5,'1',null,null)
Insert Into NOTAS Values('SE005','A0025','C004',1,13,14,'1',null,null)
Insert Into NOTAS Values('SE005','A0025','C005',10,18,10,'1',null,null)
Insert Into NOTAS Values('SE005','A0028','C005',16,13,15,'1',null,null)
Insert Into NOTAS Values('SE005','A0028','C004',17,7,17,'1',null,null)
Insert Into NOTAS Values('SE005','A0029','C004',11,13,13,'1',null,null)

Insert Into NOTAS Values('SE006','A0013','C001',14,3,7,'1',null,null)
Insert Into NOTAS Values('SE006','A0013','C002',7,10,10,'1',null,null)
Insert Into NOTAS Values('SE006','A0013','C004',12,13,20,'1',null,null)
Insert Into NOTAS Values('SE006','A0013','C003',15,12,17,'1',null,null)
Insert Into NOTAS Values('SE006','A0014','C001',11,15,14,'1',null,null)
Insert Into NOTAS Values('SE006','A0014','C003',15,13,17,'1',null,null)
Insert Into NOTAS Values('SE006','A0014','C004',12,18,11,'1',null,null)
GO

-- Agragar Datos a la Tabla Cursos
-- ===============================

Insert Into CURSOS Values('C001','Matematica Basica',1200,'1')
Insert Into CURSOS Values('C002','Filosofia I',1100,'1')
Insert Into CURSOS Values('C003','Psicologia Industrial',1500,'1')
Insert Into CURSOS Values('C004','Algoritmica',1000,'1')
Insert Into CURSOS Values('C005','Software de Aplicacion',1700,'1')
Insert Into CURSOS Values('C006','Lenguaje de Programacion I',2000,'1')
Insert Into CURSOS Values('C007','Lenguaje Java ',2500,'1')
Insert Into CURSOS Values('C008','Matematica II',2400,'1')
Insert Into CURSOS Values('C009','Ingles Tecnico',1900,'1')
Insert Into CURSOS Values('C010','Lenguaje de Programcion III',2200,'1')
Insert Into CURSOS Values('C011','Aplicaciones Cliente/Servidor',1800,'1')
GO

SELECT * FROM ALUMNOS
SELECT * FROM CARRERAS
SELECT * FROM NOTAS
SELECT * FROM CURSOS
GO




