
--USUARIOS
INSERT INTO Usuarios (id, nombre, apellido, telefono, direccion, contraseña, fechaRegistro) VALUES
(1, 'Laura', 'Gómez Pérez', '611223344', 'Calle Sierpes 12, Sevilla', 'pass_101', '2024-01-15'),
(2, 'Carlos', 'Ruiz Medina', '622334455', 'Av. de la Constitución 24, Sevilla', 'pass_102', '2024-03-10'),
(3, 'Elena', 'Torres Vega', '633445566', 'Calle Betis 8, Sevilla', 'pass_103', '2024-05-20'),
(4, 'Javier', 'Morales Gil', '644556677', 'Calle Feria 45, Sevilla', 'pass_201', '2023-11-01'),
(5, 'Marta', 'Sánchez Díaz', '655667788', 'Calle San Jacinto 30, Sevilla', 'pass_202', '2023-12-05'),
(6, 'Andrés', 'Navarro Soto', '666778899', 'Calle Regina 14, Sevilla', 'pass_14', '2025-02-10'),
(7, 'Sofía', 'Castro León', '677889900', 'Av. Eduardo Dato 18, Sevilla', 'pass_105', '2026-01-08'),
(8, 'Diego', 'Herrera Cruz', '688990011', 'Calle Asunción 22, Sevilla', 'pass_106', '2026-11-18');

--CLIENTES Y GESTORES
INSERT INTO Clientes (id, usuarioId, numeroSocio, sancionado, fechaBaja) VALUES
(1, 1, 'SOC-0001', FALSE, NULL),
(2, 2, 'SOC-0002', TRUE, NULL),
(3, 3, 'SOC-0003', FALSE, '2025-09-15'),
(4, 6, 'SOC-0004', FALSE, NULL),
(5, 7, 'SOC-0005', TRUE, '2026-10-01'),
(6, 8, 'SOC-0006', FALSE, '2026-11-18');

INSERT INTO Gestores (id, usuarioId, numeroEmpleado) VALUES
(1, 4, 'EMP-101'),
(2, 5, 'EMP-102');

--SUCURSALES
INSERT INTO Sucursales (id, nombreSucursal, direccion, telefono, horarioAtencion, capacidadMaxima, gestorId) VALUES
(1, 'Sucursal Centro', 'Plaza Nueva 5, Sevilla', '954112233', '09:00 - 21:00', 5000, 1),
(2, 'Sucursal Triana', 'Calle San Jacinto 50, Sevilla', '954445566', '10:00 - 20:00', 3200, 2),
(3, 'Sucursal Nervión', 'Av. Luis de Morales 12, Sevilla', '954778899', '08:30 - 20:30', 4100, 1);

--LIBROS
INSERT INTO Libros (isbn, titulo, añoPublicacion, editorial, idioma) VALUES
('9788420412146', 'Don Quijote de la Mancha', 1605, 'Alfaguara', 'Español'),
('9788497592208', 'Cien años de soledad', 1967, 'Debolsillo', 'Español'),
('9788445000663', 'El Señor de los Anillos', 1954, 'Minotauro', 'Español'),
('9780140449136', 'Crimen y castigo', 1866, 'Penguin Classics', 'Inglés'),
('9788497931021', 'Buenos presagios', 1990, 'Timun Mas', 'Español'),
('9788408163435', 'La sombra del viento', 2001, 'Planeta', 'Español');

--ESCRITORES
INSERT INTO Escritores (id, nombre, apellido, biografia, fechaNacimiento, fechaMuerte) VALUES
(1, 'Miguel', 'de Cervantes', 'Novelista, poeta y dramaturgo español.', '1547-09-29', '1616-04-22'),
(2, 'Gabriel', 'García Márquez', 'Escritor colombiano, Premio Nobel 1982.', '1927-03-06', '2014-04-17'),
(3, 'J.R.R.', 'Tolkien', 'Escritor y filólogo británico.', '1892-01-03', '1973-09-02'),
(4, 'Fiódor', 'Dostoyevski', 'Escritor de la Rusia zarista.', '1821-11-11', '1881-02-09'),
(5, 'Terry', 'Pratchett', 'Escritor británico de fantasía y humor.', '1948-04-28', '2015-03-12'),
(6, 'Neil', 'Gaiman', 'Autor británico de novelas y cómics.', '1960-11-10', NULL),
(7, 'Carlos', 'Ruiz Zafón', 'Escritor español.', '1964-09-25', '2020-06-19');

--GÉNEROS
INSERT INTO Generos (id, nombre) VALUES
(1, 'Novela clásica'),
(2, 'Realismo mágico'),
(3, 'Fantasía épica'),
(4, 'Novela psicológica'),
(5, 'Humor'),
(6, 'Misterio');

---------
INSERT INTO LibroEscritores (id, libroIsbn, escritorId) VALUES
(1, '9788420412146', 1),
(2, '9788497592208', 2),
(3, '9788445000663', 3),
(4, '9780140449136', 4),
(5, '9788497931021', 5),
(6, '9788497931021', 6),
(7, '9788408163435', 7);

----------
INSERT INTO LibroGeneros (id, libroIsbn, generoId) VALUES
(1, '9788420412146', 1),
(2, '9788497592208', 2),
(3, '9788445000663', 3),
(4, '9780140449136', 4),
(5, '9788497931021', 3),
(6, '9788497931021', 5),
(7, '9788408163435', 6);

--COPIAS FÍSICAS
INSERT INTO CopiasFisicas (codigoBarras, estado, estanteria, libroIsbn, sucursalId) VALUES
('CB-0001', 'Disponible', 'A-01', '9788420412146', 1),
('CB-0002', 'Prestado',   'A-01', '9788420412146', 1),
('CB-0003', 'Disponible', 'B-12', '9788497592208', 1),
('CB-0004', 'Dañado',     'C-04', '9788445000663', 2),
('CB-0005', 'Disponible', 'D-08', '9780140449136', 2),
('CB-0006', 'Disponible', 'E-02', '9788497931021', 3),
('CB-0007', 'Prestado',   'F-10', '9788408163435', 3),
('CB-0008', 'Disponible', 'F-11', '9788408163435', 1);

--ALQUILERES
INSERT INTO Alquileres (id, clienteId, fechaLimiteDevolucion, fechaDevolucionEfectiva, copiaFisicaCodigoBarras, fechaAlquiler) VALUES
(1, 1, '2026-10-20', '2026-10-18', 'CB-0001', '2026-10-05'),
(2, 1, '2026-11-28', NULL, 'CB-0002', '2026-11-12'),
(3, 2, '2026-09-15', '2026-09-22', 'CB-0003', '2026-09-01'),
(4, 3, '2025-08-20', '2025-08-19', 'CB-0005', '2025-08-05'),
(5, 4, '2026-11-15', '2026-11-01', 'CB-0006', '2026-11-01'),
(6, 4, '2026-11-10', NULL, 'CB-0007', '2026-10-25'),
(7, 4, '2026-12-02', NULL, 'CB-0008', '2026-11-18');



