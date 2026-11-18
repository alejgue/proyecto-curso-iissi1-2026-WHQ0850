--Trigger R.N.1: Un cliente no puede tener más de 3 alquileres en el mismo mes.

DELIMITER //
CREATE TRIGGER check_max_alquileres BEFORE INSERT ON Alquileres
FOR EACH ROW
BEGIN
DECLARE numAlquilados INT;

--Ver si la fecha de alquiler es valida, revisar q no sea futura
    IF (NEW.fechaAlquiler > CURRENT_DATE())
    THEN SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'Error: No se pueden registrar alquileres con fecha futura.';
    END IF;

--cuento los alquileres de un mes y año

    SELECT COUNT(*) INTO numAlquilados
    FROM Alquileres
    WHERE clienteId = NEW.clienteId
    AND MONTH(fechaAlquiler) = MONTH(NEW.fechaAlquiler) AND YEAR(fechaAlquiler) = YEAR(NEW.fechaAlquiler);
    
--verifico q no sean 3 o mas

    IF numAlquilados >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente alcanzo su limite de alquileres mensual';
    END IF;
END //
DELIMITER ;



--Trigger R.N.3 y R.N.5: No se puede alquilar una copia si su estado es 'mal' o si ya tiene un alquiler activo.

DELIMITER //
CREATE TRIGGER check_alquilable BEFORE INSERT ON Alquileres
FOR EACH ROW
BEGIN

DECLARE estd VARCHAR(25);
DECLARE activos INT;

--Comprobar estado de la copia fisica

    SELECT estado INTO estd
    FROM CopiasFisicas
    WHERE codigoBarras = NEW.copiaFisicaCodigoBarras;
    
    IF estd <> 'bien' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'La copia fisica esta deteriorada';
    END IF;

--Verifico la disponibilidad de la copia fisica

    SELECT COUNT(*) INTO activos 
    FROM Alquileres
    WHERE codigoBarras = NEW.codigoBarras 
    AND fechaDevolucionEfectiva IS NULL; 
    
    IF (activos > 0) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'La copia física ya está prestada a otro cliente';
    END IF;

END //
DELIMITER ;




--Trigger R.N.6: Un socio sancionado no puede alquilar.

DELIMITER //
CREATE TRIGGER socioSancionado BEFORE INSERT ON Alquileres
FOR EACH ROW
BEGIN

DECLARE sancion BOOLEAN;

--compruebo si el cliente esta sancionado

    SELECT sancionado INTO sancion
    FROM Clientes
    WHERE id = NEW.clienteId;
    
    IF sancion = TRUE THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El cliente esta sancionado';
    END IF;

END //
DELIMITER ;


--Trigger R.N.7: No se puede añadir una copia si se supera la capacidadMaxima.

DELIMITER //
CREATE TRIGGER capacidadSucursal BEFORE INSERT ON CopiasFisicas
FOR EACH ROW
BEGIN
DECLARE copiasActuales INT;
DECLARE capMax INT;

-- Capacidad máxima de la sucursal

    SELECT capacidadMaxima INTO capMax
    FROM Sucursales
    WHERE id = NEW.sucursalId;

-- Contar el número actual de copias almacenadas en la sucursal

    SELECT COUNT(*) INTO copiasActuales
    FROM CopiasFisicas
    WHERE sucursalId = NEW.sucursalId;
    
    IF (copiasActuales >= capMax)
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'La sucursal ha alcanzado su capacidad máxima de copias físicas';
    END IF;

END // 
DELIMITER ;

--RN8 Evita registrar una fechaBaja en Clientes que sea futura respecto al día de hoy

DELIMITER //
CREATE TRIGGER fecha_baja BEFORE INSERT ON Clientes
FOR EACH ROW
BEGIN

    IF (NEW.fechaBaja IS NOT NULL AND NEW.fechaBaja > CURRENT_DATE())
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'La fecha de baja del cliente no puede ser una fecha futura';
    END IF;
    
END //
DELIMITER ;


--RN9 Fecha de defunción de escritor no futura
DELIMITER //
CREATE TRIGGER fecha_muerte_escritor BEFORE INSERT ON Escritores
FOR EACH ROW
BEGIN

    IF (NEW.fechaMuerte IS NOT NULL AND NEW.fechaMuerte > CURRENT_DATE())
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'La fecha de defunción del escritor no puede ser una fecha futura';
    END IF;

END //
DELIMITER ;

--Disyunción de Usuario: Un usuario no puede ser Cliente y Gestor a la vez. Al insertar en Cliente, verificar que no exista en Gestor, y viceversa.

--Para Clinetes
DELIMITER //
CREATE TRIGGER check_disyuncion_cliente BEFORE INSERT ON Clientes
FOR EACH ROW
BEGIN

DECLARE existeGestor INT; 

SELECT COUNT(*) INTO existeGestor
FROM Gestores
WHERE usuarioId = NEW.usuarioId;
IF (existeGestor > 0)
THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'El usuario ya está registrado como Gestor';
END IF;

END //
DELIMITER ;

--Para Gestores
DELIMITER //
CREATE TRIGGER disyuncion_gestor BEFORE INSERT ON Gestores
FOR EACH ROW
BEGIN

DECLARE existeCliente INT;

    SELECT COUNT(*) INTO existeCliente 
    FROM Clientes
    WHERE usuarioId = NEW.usuarioId;
    IF (existeCliente > 0)
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El usuario ya está registrado como Cliente';
    END IF;
    
END //
DELIMITER ;


--fechaBaja verificar

DELIMITER //

CREATE TRIGGER cliente_fechaBaja_insert
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN

    DECLARE v_fechaRegistro DATE;

    IF NEW.fechaBaja IS NOT NULL THEN
    
    -- Comprobar que no sea futura
        IF NEW.fechaBaja > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha de baja no puede ser posterior a la fecha actual';
        END IF;
    
    -- Comprobar que no sea anterior a fechaRegistro del Usuario
        SELECT fechaRegistro INTO v_fechaRegistro
        FROM Usuario
        WHERE idUsuario = NEW.idUsuario;
    
        IF v_fechaRegistro IS NOT NULL AND NEW.fechaBaja < v_fechaRegistro THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha de baja no puede ser anterior a la fecha de registro del usuario';
        END IF;

    END IF;
END //

--si tengo q agregarlo

CREATE TRIGGER cliente_fechaBaja_update
BEFORE UPDATE ON Cliente
FOR EACH ROW
BEGIN
    DECLARE v_fechaRegistro DATE;

    IF NEW.fechaBaja IS NOT NULL THEN
        -- Comprobar que no sea futura
        IF NEW.fechaBaja > CURDATE() THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La fecha de baja no puede ser posterior a la fecha actual';
        END IF;

        -- Comprobar que no sea anterior a fechaRegistro del Usuario
        SELECT fechaRegistro INTO v_fechaRegistro
        FROM Usuario
        WHERE idUsuario = NEW.idUsuario;

        IF v_fechaRegistro IS NOT NULL AND NEW.fechaBaja < v_fechaRegistro THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La fecha de baja no puede ser anterior a la fecha de registro del usuario';
        END IF;
    
    END IF;
END //

DELIMITER ;
