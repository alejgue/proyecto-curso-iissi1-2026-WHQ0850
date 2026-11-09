--Trigger R.N.1: Un cliente no puede tener más de 3 alquileres en el mismo mes.




--Trigger R.N.3 y R.N.5: No se puede alquilar una copia si su estado es 'mal' o si ya tiene un alquiler activo.
--Tienes que consultar la tabla CopiaFisica y buscar si existe un Alquiler sin fecha de devolución.




--Trigger R.N.6: Un socio sancionado no puede alquilar.





--Trigger R.N.7: No se puede añadir una copia si se supera la capacidadMaxima.





--Disyunción de Usuario: Un usuario no puede ser Cliente y Gestor a la vez. Al insertar en Cliente, verificar que no exista en Gestor, y viceversa.



