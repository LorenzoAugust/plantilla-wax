---
layout: page
title: Metadatos
permalink: /metadatos/
collection: coleccion
---

Acerca de los metadatos

Los metadatos usados para este proyectos son de diferentes tipos estadísticos, aunque la mayoría son categóricos (pid, label, autor, título de publicación, lugar, tipo documental, téctica y sección), hay algunos que no lo son: la fecha(dd,mm, yyyy), que es ordinal y el número de folios, que es numérico. Respecto a la clasificación general de los metadatos es necesario precisar que son, en su mayoría descriptivos, es el caso de los metadatos autor, título de publicación, fecha (dd, mm, yyyy), lugar, n° de folios, tipo documental y técnica. Por otro lado, son de tipo administrativo el pid y label. Solo se cuenta con una metadato estructural y es el de sección, pues permite establecer la relación y filiación de los artículos por su ubicación dentro del medio, además de permitir navegar y clasificar más facilmente los elementos de la colección. 

En aras de garantizar la consistencia de los metadatos registrados en los nuevos elementos de la colección a continuación se indica cuál es la estructura determinada de registro para cada metadato: 
- Pid: corresponde al código de marcación de cada elemento del archivo, este está compuesto por las siguientes partículas alfanuméricas separadas por guion bajo: siglas del fondo documental en mayúscula + tres primeras letras de la serie en mayúscula + tres primeras letras de sub series en mayúsculas + partícula DOC en mayúscula seguida del número consecutivo + partícula FOL (en caso de tener más de un folio) seguida del número consecutivo.
- label: es el nombre de cada elemento de la colección digital. Está compuesto por la palabra "Prensa", con la primera letra en mayúscula, y el número consecutivo.
- Autor: hace referencia a la persona física o entidad responsable del contenido intelectual de un documento. Debe ingresarse de la siguiente forma: 
	* Persona natural: Ingreso directo por el nombre seguido del o de los apellidos con primera letra en mayúscula.
	* Persona jurídica: se debe ingresar el nombre de la institución tal y como aparece en el documento.
	* Apodos y seudónimos: Si el documento está firmado con apodos o seudónimos, se debe respetar el contenido y escribirlo tal cual aparezca. Si se conoce el nombre de pila de autor, es posible escribirlo entre corchetes cuadrados en la misma celda. 
- Título de la publicación: corresponde al medio en el que fue publicado el documento. Se debe ingresar de manera completa (sin abreviaturas) y con las iniciales en mayúscula. 
- Fecha: se debe extraer de la información registrada en el documento y registrada en números asignando una celda a cada parte de la fecha. Debe ser ingresada en el formato día, mes y año en cada una de las columnas determinadas. Los campos día y mes deben ser diligenciados con dos dígitos. En caso de no contar con la información, se debe indicar “sin información” mediante las siglas s.i.
- Lugar: es nombre del espacio geográfico donde se produjo el documento. Debe ser escrito tal cual como figure en el documento, pero siempre com la inicial en mayúscula. 
- N° de folios: este campo hace referencia a la extensión del documento y debe registrarse con números, no con letras.
- Tipo documental:  es la tipología a la que corresponde el documento, en este caso como se trata de prensa impresa, debe consignarse como "recorte de periódico". El dato debe ser ingresado con la primera letra en mayúscula.
- Técnica: corresponde a la forma en la que la infomración fue registrada en el soporte del documento. Para el caso de la prensa se preferirá el término "dactilografía" por encima de otros como "mecanografía". 
Sección: hace referencia a la división del periódico en el que fue puesto el texto. Debe ingresarse con la inicial el mayúscula. 
Para cualquiera de los metadatos, en caso de no contar con la información, se debe indicar “sin información” mediante las siglas s.i.

{% include interactive_metadata_table.html collection=page.collection %}
