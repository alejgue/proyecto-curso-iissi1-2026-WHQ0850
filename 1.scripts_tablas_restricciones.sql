CREATE TABLE Usuarios (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(255) NOT NULL,
	contraseña VARCHAR(255) NOT NULL CHECK (CHAR_LENGTH(contraseña) >= 8), -- CHECK-1
	telefono VARCHAR(30) NOT NULL UNIQUE,
	apellido VARCHAR(255) NOT NULL,
	direccion VARCHAR(255) NOT NULL,
	fechaRegistro DATE NOT NULL
   );
   
CREATE TABLE Clientes (
	id INT PRIMARY KEY AUTO_INCREMENT,
	numeroSocio INT NOT NULL UNIQUE,
	fechaSancion DATE,
	fechaBaja DATE,
	usuarioId INT NOT NULL,
	FOREIGN KEY (usuarioId) REFERENCES Usuarios(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE Gestores (
	id INT PRIMARY KEY AUTO_INCREMENT,
	numeroEmpleado INT NOT NULL UNIQUE,
	usuarioId INT NOT NULL,
	FOREIGN KEY(usuarioId) REFERENCES Usuarios(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE Sucursales (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombreSucursal VARCHAR(50) NOT NULL UNIQUE,
	direccion VARCHAR(255) NOT NULL,
	telefono VARCHAR(30) NOT NULL UNIQUE,
	horarioAtencion VARCHAR(255) NOT NULL,
	capacidadMaxima INT NOT NULL,
	gestorId INT NOT NULL,
	FOREIGN KEY(gestorId) REFERENCES Gestores(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
);

CREATE TABLE Libros ( 
	isbn VARCHAR(13) PRIMARY KEY,
	titulo VARCHAR(255) NOT NULL,
	añoPublicacion DATE NOT NULL,
	editorial VARCHAR(255) NOT NULL,
	idioma VARCHAR(255) NOT NULL
);

CREATE TABLE CopiasFisicas (
	codigoBarras VARCHAR(20) PRIMARY KEY, 
	sucursalId INT NOT NULL,
	libroIsbn VARCHAR(13) NOT NULL,
	estado ENUM('Bien', 'Mal') NOT NULL,
	estanteria VARCHAR(255) NOT NULL,
	FOREIGN KEY(sucursalId) REFERENCES Sucursales(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	FOREIGN KEY(libroIsbn) REFERENCES Libros(isbn)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE Alquileres (
	id INT PRIMARY KEY AUTO_INCREMENT,
	fechaAlquiler DATE NOT NULL,
	fechaLimiteDevolucion DATE NOT NULL,
	fechaDevolucionEfectiva DATE CHECK (fechaDevolucionEfectiva IS NULL OR fechaDevolucionEfectiva > fechaAlquiler),  -- CHECK-2
	clienteId INT NOT NULL,
	copiaFisicaCodigoBarras VARCHAR(20) NOT NULL,
	FOREIGN KEY(clienteId) REFERENCES Clientes(id),
	FOREIGN KEY(copiaFisicaCodigoBarras) REFERENCES CopiasFisicas(codigoBarras),	
		UNIQUE (clienteId, copiaFisicaCodigoBarras, fechaAlquiler)
);


CREATE TABLE Generos (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE LibrosGeneros (
	 id INT PRIMARY KEY AUTO_INCREMENT,
 	 generoId INT NOT NULL,
    libroIsbn VARCHAR(13) NOT NULL,
    UNIQUE (libroIsbn, generoId),
    FOREIGN KEY (generoId) REFERENCES Generos(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (libroIsbn) REFERENCES Libros(isbn)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Escritores (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(255) NOT NULL,
	apellido VARCHAR(255) NOT NULL,
	biografia TEXT NOT NULL,
	fechaNacimiento DATE NOT NULL,
	fechaMuerte DATE CHECK (fechaMuerte IS NULL OR fechaMuerte > fechaNacimiento) -- CHECK-3
);

CREATE TABLE LibrosEscritores (
	 id INT PRIMARY KEY AUTO_INCREMENT,
    escritorId INT NOT NULL,
    libroIsbn VARCHAR(13) NOT NULL,
    UNIQUE (libroIsbn, escritorId),
    FOREIGN KEY (escritorId) REFERENCES Escritores(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (libroIsbn) REFERENCES Libros(isbn)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
