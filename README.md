# Rincón del Libro

## Miembros del grupo L6-DF-5

1. Guerrero Fuentes, Alexandro
1. Leon Galdino, Marianna Andrea
1. Apellidos, Nombre
1. Apellidos, Nombre

## 1. Introducción al problema

- Descripción del problema para poner en contexto el proyecto, incluyendo información sobre los clientes y usuarios, la situación actual, problemas, expectativas, etc. Se valorará la presencia de información multimedia (fotos, gráficos, documentos escaneados, etc.).

## 2. Glosario de términos

- Términos específicos del dominio del problema, ordenados alfabéticamente. Se valorará la presencia de información multimedia.

## 3. Visión general del sistema

### 3.1. Requisitos generales

El sistema deberá cumplir los siguientes requisitos generales:
  - Almacenamiento centralizado: toda la información relevante de la biblioteca deberá almacenarse de forma organizada en una base de datos.
  - Gestión de usuarios: el sistema permitirá distinguir entre clientes y gestores y controlar las operaciones que puede realizar cada tipo de usuario.
  - Gestión del catálogo: se podrán registrar y consultar libros y sus creadores.
  - Gestión de ejemplares: cada copia física estará identificada individualmente y asociada a un libro, una sucursal, y constara si esta alquilada y su estado de conservación.
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

-- Nombre.
-- Apellidos.
-- Email.
-- Teléfono.
-- Dirección.
-- Fecha de registro.
-- Estado [Activo, Suspendido].

Esta entidad permite centralizar los datos comunes y evitar su duplicación en las especializaciones.

- Cliente (socio)

Es una especialización de Usuario que representa a las personas que utilizan los servicios de préstamo de la biblioteca.

Sus atributos específicos son:

-- Número de socio (identifica de forma única a cada cliente).
-- Fecha de alta.
-- Sanción (opcional, permitiendo indicar si el cliente tiene alguna sanción registrada).

Los clientes pueden consultar el catálogo de libros, conocer la disponibilidad de los ejemplares y realizar alquileres de copias físicas, cumpliendo las condiciones establecidas por la biblioteca.

- Gestor (empleado)

Es una especialización de Usuario que representa al personal encargado de administrar el sistema de la biblioteca.

Su atributo específico es:

-- Número de empleado, que identifica de forma única a cada gestor.

Los gestores son responsables de mantener actualizado el catálogo, registrar y administrar las copias físicas, gestionar los alquileres y las devoluciones, y realizar consultas y listados necesarios para el funcionamiento de la biblioteca. De igual forma, cada gestor estará asociado a la sucursal cuya gestión tenga asignada.


## 4. Catálogo de requisitos

### 4.1. Requisitos funcionales

#### R.F.01. Título requisito funcional

Como [tipo de usuario]
quiero [servicio]
para [razón]

**Prueba de aceptación**
- Descripción de la primera comprobación a realizar
- Descripción de la segunda comprobación a realizar
- Se debe aplicar la regla de negocio R.N.XX.
- ...

#### 4.1.1. Requisitos de información

##### R.I.01. Título requisito de información

Como [tipo de usuario]
quiero [servicio]
para [razón]

**Prueba de aceptación**
- Descripción de la primera comprobación a realizar
- Descripción de la segunda comprobación a realizar
- ...

#### 4.1.2. Reglas de negocio

##### R.N.01. Título regla negocio

Descripción de la regla de negocio.

### 4.2. Mapa de historias de usuario (opcional)

### 4.3. Requisitos no funcionales (opcional)

**R.N.F. 01. Título requisito no funcional**
Como [tipo de usuario]
quiero [servicio]
para [razón]

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


