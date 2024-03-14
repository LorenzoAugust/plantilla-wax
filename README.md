# Plantilla Wax en Español

## Introducción

Esta es una plantilla con una versión en español del sistema para coleciones mínimas llamado Ed.

Diferencias con la versión original:

- Se ajustaron algunos errores de la compilación del contenedor de Docker en Mac y Windows
- Tiene, en lo posible, la interfaz traducida en español latinoamericano, con tintes colombianos. Útil para proyectos situados de humanidades digitales
- Tiene una pequeña documentación en español para hacer funcionar la colección de forma sencilla (o al menos lo más sencillo posible)
Aquí se pueden ver tutoriales en video sobre el uso de la plantilla: 

[Tutorial 1](https://youtu.be/82aTvPXY_qo?si=d1qe9stNUqVrX7r7)

[Tutorial 2](https://youtu.be/GI5zvrfwBnw)

Y a continuación se presentan instrucciones escritas de todos los pasos que se deben llevar a cabo:

## Instrucciones

### 1. Instalar Docker y GitHub Desktop

Para usar este sistema de colecciones es necesario instalar la aplicación Docker, que crea contenedores compatibles con diferentes sistemas operativos (Linux, Max y Windows). Docker se puede descargar aquí: [https://www.docker.com/](https://www.docker.com/).

A continuación abre la aplicación Docker instalada. OJO: Para que el resto del proceso funcione, la aplicación Docker debe estar abierta.

Si no tienes la aplicación GitHub Desktop, instálala: aquí se puede descargar [https://desktop.github.com/](https://desktop.github.com/). Inicia sesión con tu cuenta de GitHub.

### 2. Clonar este repositorio

Crea un repositorio en tu cuenta de GitHub haciendo clic en el botón verde de la esquina superior derecha que dice *Use this template*, haz clic en él y selecciona *Create new repository*. Dale un nombre adecuado al nuevo repositorio. Luego, clona ese repositorio nuevo dentro de tu computador para poder editar los archivos, la carpeta clonada será lo que denominaremos la *carpeta del proyecto*. [Aquí](https://docs.github.com/es/repositories/creating-and-managing-repositories/cloning-a-repository) se encuentran instrucciones detalladas acerca de cómo clonar un repositorio.

### 3. Construir el contenedor de base de Docker

Abre un editor de línea de comandos (por ejemplo Terminal en Mac y Linux o PowerShell en Windows), ve a la *carpeta del proyecto* desde la terminal (usando el comando `cd` y la ruta de la carpeta del proyecto, por ejemplo `user/documents/plantilla-ed`) y luego corre este código en la línea de comandos para construir el contenedor de Docker:

`docker build -t minicomp/wax .` (OJO: ¡Copiar incluyendo el punto!)

Si es la primera instalación, esto puede tomar un rato, paciencia.

OJO: debes asegurarte de correr ese código en la *carpeta del proyecto*. Se puede verificar en qué carpeta se encuentra la línea de comandos con `pwd` en Mac / Linux o con `cd` en Windows.

### 4. Abrir el contenedor

Los pasos anteriores solo deben hacerse una vez, este paso, número 4, debe hacerse cada vez que requieras modificar tu colección, tu contenido, o generar un nuevo sitio para publicar. Este paso consiste en inciar el contenedor de Docker para realizar todas las acciones de edición de la colección en el interior del contenedor.

Ejecuta el siguiente código para abrir el contenedor:

En Mac / Linux:

`docker run -it --rm -v ${PWD}:/wax --name wax -p 4000:4000 minicomp/wax bash`

En Windows:

`docker run -it --rm -v %cd%:/wax --name wax -p 4000:4000 minicomp/wax bash`

OJO: En caso de que esto no funcione en Windows, es necesario reemplazar `%cd%` por la ruta (path) de la carpeta del proyecto. Por ejemplo, una ruta podría ser `user/documents/plantilla-ed`, dependiendo de dónde se haya instalado.

La línea de comandos te mostrará que estás dentro del contendedor de wax porque aparecerá el siguiente texto en la línea de texto donde se ingresan los comandos: `/wax#`

Luego usa este código para actualizar algunas de las liberías del contenedor (el mismo para cualquier sistema operativo):

`sh actualizar.sh`

### 5. Editar el contenido de la colección

Ante la duda, revisa la carpeta `_data` dentro de la *carpeta del proyecto*.

#### 5.1. Metadatos

Se debe crear una tabla con metadatos, en formato .csv, que serán presentados en la colección. Cada item debe tener una fila con sus metadatos correspondientes. Los metadatos son de tu libre elección en su mayoría, pero necesariamente deben existir dos columnas: una llamada ***pid*** con un identificador único para cada ítem de la colección y otra llamada ***label*** con un nombre descriptivo (OJO: los nombres de estas columnas deben estar escritos en minúsculas). Las tabla de metadatos de la colección deben ponerse en la carpeta `_data` dentro de la *carpeta del proyecto*.

#### 5.2. Imágenes

Las imágenes de la colección deben ponerse en la siguiente ruta dentro de la *carpeta del proyecto*: `_data/raw_images/coleccion`. Los formatos válidos son: png, jpg, tiff, y pdf. El nombre de cada imagen debe corresponder **exactamente** con el ***pid*** adecuado usado en las filas de la tabla de metadatos.

### 6. Ejecutar las tareas de construcción del sitio de la colección

Opcionalmente, antes de hacer todas estas tareas, puedes eliminar los resultados de tareas previas con la siguiente función, si quieres eliminar los archivos creados previamente:

`sh borrar_version_previa.sh`

Wax ejecuta tres tareas que estructuran y son el andamio de la colección: crea derivatives compatibles con IIIF, crea una página por cada elemento de la colección, y crea un índice de búsqueda.

Para ejecturar estas tareas hay dos opciones, una simplificada con un solo comando que realiza todas las tareas juntas, y otra con varios comandos, que realiza cada tarea separadamente. Si esto parece muy complicado, usa la versión de un solo comando (puede que tarde un poco más, pero es más simple).

#### 6.1. Versión un solo comando

Asegurate de que estás en el contenedor de wax, como se describe en el punto 4 (para asegurarte, revisa que la línea de texto donde se ingresan los comandos dice `/wax#`).

Ejecuta el siguiente comando:

`sh ejecutar_tareas.sh`

#### 6.1. Versión de comandos separados

Asegurate de que estás en el contenedor de wax, como se describe en el punto 4 (para asegurarte, revisa que la línea de texto donde se ingresan los comandos dice `/wax#`).

Corre los siguientes códigos en orden para ejecutar las tareas que construyen la colección:

Crear imágenes en versión IIIF:

`bundle exec rake wax:derivatives:iiif coleccion`

Crear una página por cada elemento de la colección:

`bundle exec rake wax:pages coleccion`

Crear un índice de búsqueda:

`bundle exec rake wax:search main`

### 7. Previsualizar el sitio

Para previsualizar el sitio debes correr el siguiente código:

`sh generar_sitio.sh`

Este código creará un *build* e iniciará un servidor local que, siguiendo la dirección que se indica allí, puede abrirse en un navegador web. Así se verá el sitio cuando esté publicado finalmente.

Realiza los cambios necesarios y actualiza el explorador web para verlos.

Para salir de la previsualización del sitio presiona `ctrl/cmd + c`

### 8. Publicar el sitio

Asegúrate de haber creado un *build* reciente siguiendo la instrucción del punto anterior, es decir, el punto 7. Si estás usando GitHub pages, haz un *push* de los cambios del repositorio que clonaste en tu propia cuenta. Es posible que GitHub te indique que debes hacer un *fork* del repositorio original al interior de tu cuenta.

Ahora debes buscar tu repositorio clonado en tu cuenta de Github, hacer clic en el botón *settings* y, buscar el botón *pages* y, en la sección *Build and deployment* en la opción *Branch* escoger *main* y */(root)* y guardar. Esto creará una versión publicada en Github Pages.

### 9. Salir de wax

Para salir de Wax en la línea de comandos ejecuta este código: `exit`