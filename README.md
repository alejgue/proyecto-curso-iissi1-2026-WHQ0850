# Rincón del Libro

## Miembros del grupo L6-DF-5

1. Guerrero Fuentes, Alexandro
2. Leon Galdino, Marianna Andrea

## 1. Introducción al problema

- Descripción del problema para poner en contexto el proyecto, incluyendo información sobre los clientes y usuarios, la situación actual, problemas, expectativas, etc. Se valorará la presencia de información multimedia (fotos, gráficos, documentos escaneados, etc.).

## 2. Glosario de términos

- Términos específicos del dominio del problema, ordenados alfabéticamente. Se valorará la presencia de información multimedia.

- Alquiler(préstamo): Operación por la que un cliente retira una copia física de un libro durante un periodo, quedando registrada la fecha de alquiler y la fecha límite de devolución.
  
- Cliente (socio): Usuario de la biblioteca identificado por un número de socio, con fecha de alta, que puede alquilar copias físicas y puede estar sancionado. Alquila copias físicas de libros y consulta el catálogo.
  
- Copia Física(ejemplar): Cada ejemplar material de un libro, identificado por su código de barras, con un estado, una disponibilidad y ubicado en una
  estantería.
  
- Disponibilidad: Situación de una copia física respecto a si puede ser alquilada en un momento dado.
  
- Escritor(autor): Persona que ha escrito uno o varios libros.
  
- Estantería: Ubicación física (número de estante) donde se guarda una copia física dentro de una sucursal.
  
- Estado de alquiler: Situación en la que se encuentra un alquiler: activo, devuelto o vencido. No se almacena: se calcula a partir de las fechas del alquiler.
  
- Estado de copia: Condición material de una copia física: Bien o Mal.
  
- Gestor (bibliotecario/empleado): Usuario trabajador de la biblioteca, identificado por su número de empleado, que gestiona una sucursal.
  
- ISBN: Código normalizado internacional que identifica de forma única un libro.
  
- Libro (título/obra): Obra publicada identificada por su ISBN, con título, año de publicación, género, editorial e idioma.
  
- Sanción/sancionado: Penalización aplicada a un cliente que le impide (temporalmente) realizar alquileres.
  
- Sucursal (sede): Cada una de las sedes físicas de la biblioteca, con nombre, dirección, teléfono y horario de atención.
  
- Usuario: Persona registrada en el sistema de la biblioteca con datos de contacto comunes. Se especializa en Cliente o Gestor.


## 3. Visión general del sistema

### 3.1. Requisitos generales

El sistema deberá cumplir los siguientes requisitos generales:
  - Almacenamiento centralizado: toda la información relevante de la biblioteca deberá almacenarse de forma organizada en una base de datos.
  - Gestión de usuarios: el sistema permitirá distinguir entre clientes y gestores y controlar las operaciones que puede realizar cada tipo de
                          usuario.
  - Gestión del catálogo: se podrán registrar y consultar libros y sus creadores.
  - Gestión de ejemplares: cada copia física estará identificada individualmente y asociada a un libro, una sucursal, y constara si esta alquilada
                            y su estado de conservación.
  - Gestión de sucursales: se almacenará la información de las diferentes sucursales de la biblioteca.
  - Gestión de Alquileres: el sistema permitirá registrar préstamos, controlar las fechas previstas de devolución y registrar las devoluciones.
  - Consulta de disponibilidad: se podrá conocer qué ejemplares están disponibles para nuevos préstamos.
  - Integridad de la información: la base de datos deberá impedir registros incoherentes y referencias a elementos inexistentes.
  - Seguridad: las operaciones administrativas estarán restringidas a los usuarios autorizados.
  - Consulta del historial: los préstamos anteriores se conservarán para poder consultar las operaciones realizadas.

    
### 3.2. Usuarios del sistema 

El sistema contiene una entidad general denominada "Usuario", que representa a las personas registradas en la biblioteca. Esta entidad se especializa en dos tipos de usuarios: Cliente y Gestor.

La especialización es incompleta y disjunta. Es incompleta porque, en el modelo conceptual, podría haber usuarios que no pertenezcan a ninguna de las dos especializaciones, aunque la regla de negocio establece que todos los usuarios registrados deben ser clientes o gestores. Es disjunta porque un mismo usuario no puede ser simultáneamente cliente y gestor.

- Usuario (generalización)

Representa a una persona registrada en el sistema y almacena los datos comunes a todos los usuarios:

 1. Nombre.
 2. Apellidos.
 3. Email.
 4. Teléfono.
 5. Dirección.
 6. Fecha de registro.

Esta entidad permite centralizar los datos comunes y evitar su duplicación en las especializaciones.

- Cliente (socio)

Es una especialización de Usuario que representa a las personas que utilizan los servicios de préstamo de la biblioteca.

Sus atributos específicos son:

 1. Número de socio (identifica de forma única a cada cliente).
 2. Fecha de alta.
 3. Sanción (opcional, permitiendo indicar si el cliente tiene alguna sanción registrada).

Los clientes pueden consultar el catálogo de libros, conocer la disponibilidad de los ejemplares y realizar alquileres de copias físicas, cumpliendo las condiciones establecidas por la biblioteca.

- Gestor (empleado)

Es una especialización de Usuario que representa al personal encargado de administrar el sistema de la biblioteca.

Su atributo específico es:

1. Número de empleado, que identifica de forma única a cada gestor.

Los gestores son responsables de mantener actualizado el catálogo, registrar y administrar las copias físicas, gestionar los alquileres y las devoluciones, y realizar consultas y listados necesarios para el funcionamiento de la biblioteca. De igual forma, cada gestor estará asociado a la sucursal cuya gestión tenga asignada.


## 4. Catálogo de requisitos

### 4.1. Requisitos funcionales

#### R.F.01. Listado del catálogo de libros

Como cliente, 
quiero obtener un listado de los libros pudiendo filtrar por título, escritor, género, editorial o idioma, 
para localizar obras de mi interés. 

#### R.F.02. Consultar disponibilidad de un libro

Como cliente, 
quiero consultar la disponibilidad de un libro (qué copias físicas están disponibles y en qué sucursal se encuentran), 
para saber si puedo alquilarlo.

#### R.F.03. Listado de copias físicas

Como gestor, 
quiero obtener un listado de las copias físicas de un libro o de una sucursal, mostrando su estado y su estantería, 
para localizar los ejemplares.

#### R.F.04. Listado de clientes

Como gestor, 
quiero obtener un listado de los clientes (socios) de la biblioteca con sus datos, 
para tenerlos localizados.

#### R.F.05. Listado de clientes sancionados

Como gestor, 
quiero obtener un listado de los clientes que están sancionados, 
para saber a quiénes no se les puede alquilar.

#### R.F.06. Listado de alquileres activos

Como gestor, 
quiero obtener un listado de los alquileres activos (todavía no devueltos), 
para hacer el seguimiento de los préstamos en curso.

#### R.F.07. Listado de alquileres vencidos

Como gestor, 
quiero obtener un listado de los alquileres cuya fecha límite de devolución ya ha pasado y aún no han sido devueltos, 
para identificar a los usuarios morosos.

#### R.F.08. Listado de escritores

Como cliente, 
quiero consultar el listado de escritores y su información, 
para conocer los autores disponibles en la biblioteca.

#### R.F.09. Listado de sucursales

Como cliente, 
quiero consultar las sucursales de la biblioteca con su dirección, teléfono y horario de atención, 
para saber dónde acudir.

#### R.F.10. Listado de libros de una sucursal

Como gestor, 
quiero consultar los libros que residen en una sucursal determinada, 
para conocer el fondo de cada sede.

#### R.F.11. Consultar la información de un libro

Como cliente, 
quiero consultar los datos de un libro concreto (título, escritor/es, año, género, editorial e idioma), 
para decidir si me interesa.


**Prueba de aceptación**
- Descripción de la primera comprobación a realizar
- Descripción de la segunda comprobación a realizar
- Se debe aplicar la regla de negocio R.N.XX.
- ...

#### 4.1.1. Requisitos de información

##### R.I.01. Información de usuarios
Como gestor del sistema, 
quiero registrar y consultar la información de los usuarios 
para mantener sus datos personales y de contacto.

**Prueba de aceptación**
- Comprobar que se pueden registrar el nombre y los apellidos del usuario.
- Comprobar que se puede almacenar su teléfono.
- Comprobar que se puede almacenar su dirección.
- Comprobar que la fecha de registro es opcional.
- Comprobar que cada usuario tiene un identificador único.

R.I.02. Información de clientes (socios)
Como gestor del sistema, 
quiero registrar y consultar la información de los clientes
para gestionar su condición de socio y sus préstamos.

**Prueba de aceptación**
- Comprobar que cada cliente tiene un número de socio único.
- Comprobar que se almacena la fecha de alta del cliente.
- Comprobar que se puede registrar si el cliente está sancionado.
- Comprobar que el estado de sanción es opcional.
- Comprobar que cada cliente dispone de los datos comunes de usuario.
- Comprobar que se puede identificar si un cliente está dado de alta.

R.I.03. Información de gestores
Como administrador del sistema, 
quiero registrar y consultar la información de los gestores 
para identificarlos y gestionar sus permisos administrativos.

**Prueba de aceptación**
- Comprobar que cada gestor tiene un número de empleado.
- Comprobar que se almacenan los datos comunes de usuario.
- Comprobar que se puede identificar a cada gestor de forma única.

R.I.04. Información de sucursales
Como gestor del sistema, 
quiero registrar y consultar la información de las sucursales 
para conocer sus datos de contacto y horarios de atención.

**Prueba de aceptación**
- Comprobar que se puede almacenar el nombre de la sucursal.
- Comprobar que se puede registrar su dirección.
- Comprobar que se puede registrar su teléfono.
- Comprobar que se puede almacenar el horario de atención.
- Comprobar que cada sucursal puede identificarse de forma inequívoca.

R.I.05. Información de libros
Como usuario del sistema, 
quiero consultar la información de los libros 
para identificar sus características y conocer en qué sucursales se encuentran.

**Prueba de aceptación**
- Comprobar que se almacena el ISBN del libro.
- Comprobar que se registra el título.
- Comprobar que se puede almacenar el año de publicación.
- Comprobar que se registra el género literario.
- Comprobar que se almacena la editorial.
- Comprobar que se registra el idioma.
- Comprobar que se pueden asociar uno o varios escritores a un libro.
- Comprobar que se puede conocer la sucursal o las sucursales donde reside el libro.

R.I.06. Información de escritores
Como usuario del sistema, 
quiero consultar la información de los escritores 
para conocer sus datos personales y su trayectoria.

**Prueba de aceptación**
- Comprobar que se almacena el nombre y los apellidos del escritor.
- Comprobar que se puede registrar su biografía.
- Comprobar que se puede almacenar su fecha de nacimiento.
- Comprobar que un escritor puede estar relacionado con varios libros.

R.I.07. Información de copias físicas
Como gestor del sistema, 
quiero registrar y consultar la información de las copias físicas 
para controlar su estado, ubicación y disponibilidad.

**Prueba de aceptación**
- Comprobar que cada copia física tiene un código de barras único.
- Comprobar que se registra el estado físico de la copia, que puede ser bien o mal.
- Comprobar que se registra la disponibilidad de la copia, que puede ser disponible o no disponible.
- Comprobar que se puede almacenar la estantería donde se ubica.
- Comprobar que cada copia física está asignada a una sucursal.
- Comprobar que cada copia física corresponde a un único libro.
- Comprobar que un libro puede tener varias copias físicas.

R.I.08. Información de préstamos
Como gestor del sistema, 
quiero registrar y consultar la información de los préstamos 
para controlar los alquileres de copias físicas y conservar su historial.

**Prueba de aceptación**
- Comprobar que se almacena la fecha de inicio del préstamo.
- Comprobar que se registra la fecha límite de devolución.
- Comprobar que la fecha límite de devolución no es anterior a la fecha de inicio del préstamo.
- Comprobar que la fecha de devolución efectiva se registra cuando se devuelve la copia.
- Comprobar que se identifica al cliente que realiza el préstamo.
- Comprobar que se identifica la copia física prestada.
- Comprobar que solo los clientes dados de alta pueden realizar préstamos.
- Comprobar que una misma copia física no puede tener más de un préstamo activo simultáneamente.
- Comprobar que una copia física prestada no aparece como disponible para un nuevo préstamo.
- Comprobar que los préstamos devueltos se conservan para mantener el historial de operaciones.

#### 4.1.2. Reglas de negocio

##### R.N.01. Identificador único de usuarios

Cada usuario debe tener un identificador único.

##### R.N.02. Correspondencia entre libros y copias físicas

Cada copia física debe corresponder a un único libro, aunque un libro pueda tener varias copias.

##### R.N.03. Asignación de copias a sucursales

Cada copia física debe estar asignada a una sucursal.

##### R.N.04. Validación del estado de alta del cliente

Un préstamo solo puede realizarse a un cliente que este dado de alta.

##### R.N.05. Exclusividad de préstamos activos por copia

Una misma copia física no puede tener más de un préstamo activo simultáneamente.

##### R.N.06. Validación de fechas de préstamo y devolución

La fecha prevista de devolución no puede ser anterior a la fecha del préstamo.

##### R.N.07. Control de disponibilidad de copias

Una copia prestada no puede considerarse disponible para un nuevo préstamo.

##### R.N.08. Correspondencia entre libros y Creadores

Un libro puede tener varios creadores y un creador puede estar relacionado con varios libros.

##### R.N.09. Control de permisos según el usuario

Solo los gestores pueden realizar las operaciones administrativas reservadas a ese perfil.

##### R.N.10. Conservación del historial de prestamos

Los préstamos devueltos deben conservarse para mantener el historial de operaciones.


### 4.2. Mapa de historias de usuario (opcional)


Libros |
------------------------------------------------------------------
Como cliente, quiero buscar libros por título 
para localizar las obras que me interesan.

Como cliente, quiero conocer qué ejemplares 
están disponibles y en qué sucursal.

Como cliente, quiero consultar mis préstamos 
activos y las fechas previstas de devolución.


Como gestor, quiero registrar libros y creadores para mantener actualizado el catálogo.
Alta
HU-05
Como gestor, quiero registrar copias físicas y asignarlas a sucursales.
Alta
HU-06
Como gestor, quiero registrar préstamos para saber qué ejemplares tiene cada cliente.
Alta
HU-07
Como gestor, quiero registrar devoluciones para actualizar la disponibilidad.
Alta
HU-08
Como gestor, quiero consultar el historial de préstamos para revisar las operaciones realizadas.
Media




### 4.3. Requisitos no funcionales (opcional)

**R.N.F. 01. Tiempo de respuesta**
Como responsable de la biblioteca, 
quiero que el sistema responda en menos de 2 segundos con hasta 100 usuarios concurrentes, 
para ofrecer una buena experiencia al cliente.

**R.N.F. 02. Control de acceso**
Como director de la biblioteca, 
quiero que sólo los gestores puedan acceder a las funciones de gestión y que los clientes únicamente consulten el catálogo y sus propios datos, 
para proteger la información.

**R.N.F. 03. Usabilidad**
Como cliente, 
quiero una interfaz sencilla e intuitiva 
para consultar el catálogo.

**R.N.F. 04. Disponibilidad**
Como director de la biblioteca, 
quiero que el sistema esté disponible durante todo el horario de apertura de las sucursales
para poder atender de la mejor forma posible al cliente.

-- fin entregable 1 --

## 5. Modelo conceptual

### 5.1. Diagramas de clases UML

- con restricciones.

### 5.2. Escenarios de prueba

- con descripción textual y diagrama de objetos UML.

## 6. Matrices de trazabilidad

- Matriz de trazabilidad entre los elementos del modelo conceptual y los requisitos.

|       | EntidadX   | AsociaciónX  | RestricciónX  | Entidad2 ...   | 
|:------|:-----------|:-----------|:-----------|:-----------|
| RI-1  | X          | X          | X          | X          |
| RI-2  |            | X          |            | X          |
| RF-1  |            | X          |            | X          |
| RF-2  | X          |            | X          | X          |
| RN-1  |            | X          |            |            |
| RN-2  | X          | X          | X          |            |
| ...   |            |            |            |            |

-- fin entregable 2 --

## 7. Modelo relacional en 3FN

- Relaciones obtenidas al aplicar la transformación del modelo conceptual.

### 7.1.  Justificación de la estrategia de transformación de jerarquías

- si se identificaron jerarquías en el MC.


### 8. Matriz de trazabilidad MC/SQL (opcional):

- Restricciones sobre el MC / Elementos del modelo tecnológico (SQL) (Triggers, checks, etc.)
- Incluir Reglas de negocio — Constraints/Triggers en las matrices de trazabilidad para el entregable 3

|       | EntidadX   | AsociaciónX  | RestricciónX  | Entidad2 ...   | 
|:-------|:-------|:-------|:-------|:-------|
| TABLA-1 |        |        |        |        |
| TABLA-2 |        |        |        |        |
| TABLA-3 |        |        |        |        |
| TABLA-4 |        |        |        |        |
| TRIG-1 |        |        |        |        |
| TRIG-2 | X      | X      |        | X      |
| TRIG-3 |        | X      |        | X      |
| TRIG-4 |        |        | X      |        |
| CONST-1 |        |        |        |        |
| CONST-2 | X      | X      |        | X      |
| CONST-3 |        | X      |        | X      |
| CONST-4 |        |        | X      |        |

Se consideran todo tipo de constraints declarativas (aquellas definidas durante el CREATE TABLE).
-- fin entregable 3 --

## Referencias


