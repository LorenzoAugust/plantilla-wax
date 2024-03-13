# Plantilla Wax en Español

## Introducción

Esta es una plantilla con una versión en español del sistema para coleciones mínimas llamado Ed.

Diferencias con la versión original:

- Se ajustaron algunos errores de la compilación del contenedor de Docker en Mac y Windows
- Tiene, en lo posible, la interfaz traducida en español latinoamericano, con tintes colombianos. Útil para proyectos situados de humanidades digitales
- Tiene una pequeña documentación en español para hacer correr la colección

## Instrucciones

### 1. Instalar Docker

Para usar este sistema de colecciones es necesario instalar la aplicación Docker, que crea contenedores compatibles con diferentes sistemas operativos (Linux, Max y Windows). Docker se puede instalar aquí: [https://www.docker.com/](https://www.docker.com/).

A continuación abre la aplicación Docker instalada. OJO: Para que el resto del proceso funcione, la aplicación Docker debe estar abierta.

### 2. Clonar este repositorio

Clona este repositorio usando Github Desktop y tu cuenta de Github, la carpeta clonada será lo que denominaremos la *carpeta del proyecto*. Ante la duda, [aquí](https://docs.github.com/es/repositories/creating-and-managing-repositories/cloning-a-repository) se encuentran instrucciones detalladas acerca de cómo clonar un repositorio.

### 3. Construir el contenedor de base de Docker

Abre un editor de línea de comandos (por ejemplo Terminal en Mac y Linux o Command Prompt en Windows), ve a la carpeta del proyecto (usando el comando `cd` y la ruta de la carpeta del proyecto, por ejemplo `user/documents/plantilla-ed`) y luego correr este código en la línea de comandos para construir el contenedor de Docker:

`docker build -t minicomp/wax .` (¡Copiar incluyendo el punto!)

Si es la primera instalación, esto puede tomar un rato, paciencia.

OJO: debes asegurarte de correr ese código en la *carpeta del proyecto*. Se puede verificar en qué carpeta se encuentra la línea de comandos con `pwd` en Mac / Linux o con `cd` en Windows.

### 4. Iniciar el contenedor

Inicia el contenedor con este código:

En Mac / Linux:

`docker run -it --rm -v ${PWD}:/wax --name wax -p 4000:4000 minicomp/wax bash`

En Windows:

`docker run -it --rm -v %cd%:/wax --name wax -p 4000:4000 minicomp/wax bash`

OJO: En caso de que esto no funcione en Windows, es necesario reemplazar `%cd%` por la ruta (path) de la carpeta del proyecto. Por ejemplo, una ruta podría ser `user/documents/plantilla-ed`, dependiendo de dónde se haya instalado.

Luego usa este código (el mismo para cualquier sistema operativo):

`bundle update`

### 5. Editar el contenido de la colección

Ante la duda, revisa la carpeta `_data` dentro de la *carpeta del proyecto*.

#### 5.1. Metadatos

Se debe crear una tabla con metadatos que serán presentados en la colección. Cada item debe tener una fila con sus metadatos correspondientes. Los metadatos son de tu libre elección, en su mayoría, pero, necesariamente deben existir dos columnas: una llamada ***pid*** con un identificador único para cada ítem de la colección y otra llamada ***label*** con un nombre descriptivo. Las tabla de metadatos de la colección deben ponerse en la carpeta `_data` dentro de la *carpeta del proyecto*.

#### 5.2. Imágenes

Las imágenes de la colección deben ponerse en la siguiente ruta dentro de la *carpeta del proyecto*: `_data/raw_images/coleccion`. Los formatos válidos son: png, jpg, tiff, y pdf. Cada imagen debe corresponder con el ***pid*** adecuado usado en las filas de la tabla de metadatos.

Para mostrar textos transcritos puedes usar cualquiera de las layouts por defecto de Ed. que incluyen versiones apra drama, narrativa y poesía. Revisa la carpeta `_layouts` para más información.

### 6. Ejecutar las tareas de construcción del sitio de la colección

Corre los siguientes códigos en orden para ejecutar las tareas que construyen la colección:

Crear imágenes en versión IIIF:

`bundle exec rake wax:derivatives:iiif coleccion`

Crear una página por cada elemento de la colección:

`bundle exec rake wax:pages coleccion`

Crear un índice de búsqueda:

`bundle exec rake wax:search main`

Opcionalmente, antes de hacer todas estas tareas, puedes eliminar los resultados tareas previas con la función:

`bundle exec rake wax:clobber coleccion`

### 7. Previsualizar el sitio

Para previsualizar el sitio debes correr el siguiente código:

`bundle exec jekyll serve --host 0.0.0.0`

Este código creará un *build* e iniciará un servidor local que, siguiendo la dirección que se indica allí, puede abrirse en un navegador web. Así se verá el sitio cuando esté publicado finalmente.

Realiza los cambios necesarios y actualiza el servidor.

### 8. Publicar el sitio

Asegúrate de haber creado un *build* reciente siguiendo la instrucción del punto anterior. Si estás usando GitHub pages, haz un *push* de los cambios del repositorio que clonaste en tu propia cuenta. Es posible que Github te indique que debes hacer un *fork* del repositorio original al interior de tu cuenta.

Ahora debes buscar tu repositorio clonado en tu cuenta de Github, hacer clic en el botón *settings* y, buscar el botón *pages* y, en la sección *Build and deployment* en la opción *Branch* escoger *main* y */(root)* y guardar. Esto creará una versión publicada en Github Pages.

[Tutorial 1](https://youtu.be/82aTvPXY_qo?si=d1qe9stNUqVrX7r7)

[Tutorial 2](https://youtu.be/GI5zvrfwBnw)
