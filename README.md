##GIT URL: https://github.com/Abel-miller/examenformativo2.git
# Lista de Tareas App

Una aplicación Flutter para gestionar una lista de tareas. La aplicación utiliza el patrón Provider para manejar el estado de las tareas y proporciona funcionalidades clave como agregar, editar, marcar como completadas y eliminar tareas.

## Capturas de Pantalla

(Incluye aquí algunas capturas de pantalla de tu aplicación, si es posible)

## Funcionalidades Principales

- **Vista de Lista de Tareas:**
  - Mostrar una lista de tareas con título, descripción y opciones para marcar como completadas o eliminar.

- **Agregar/Editar Tareas:**
  - Formulario para agregar nuevas tareas o editar las existentes.

## Estructura del Proyecto

- `lib`
  - `modelo`
    - `task.dart`: Definición de la clase `Task`.
  - `providers`
    - `taskProvider.dart`: Implementación del provider para gestionar el estado de las tareas.
  - `vista`
    - `taskListScreen.dart`: Pantalla principal que muestra la lista de tareas.
    - `taskCreateScreen.dart`: Pantalla para agregar/editar tareas.
- `main.dart`: Punto de entrada de la aplicación.

## Requisitos Técnicos

- **Flutter:** 2.x
- **Dart:** 2.x

## Instalación

1. Clona este repositorio: `git clone https://github.com/TuUsuario/TuRepositorio.git`
2. Navega al directorio del proyecto: `cd TuRepositorio`
3. Ejecuta la aplicación: `flutter run`

## Configuración del Proyecto

- Asegúrate de tener Flutter y Dart instalados en tu sistema.
- Puedes cambiar el tema y los colores de la aplicación editando el código en `main.dart`.

## Contribuir

Si quieres contribuir al proyecto, sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una nueva rama: `git checkout -b mi-rama`
3. Realiza tus cambios y haz commit: `git commit -m "Descripción de los cambios"`
4. Haz push a tu rama: `git push origin mi-rama`
5. Abre un Pull Request.

