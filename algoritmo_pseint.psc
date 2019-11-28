// Funcion para validar los resultados de la revisión
Funcion resultado <- validar_documento ( total, cont1, cont2, cont3, cont4 )
	min = redon(total*0.01)
	Si cont1 >= min y cont2 >= min y cont3 >= min y cont4 >= min Entonces
		resultado = Verdadero
	SiNo
		resultado = Falso
	Fin Si
Fin Funcion

// Función que devuelve el total de palabras de un documento
Funcion contador <- total_palabras ( documento )
	contador = 0
	Mientras i <= Longitud(documento) + 1 Hacer
		letra = Subcadena(documento,i,i)
		Si letra == " " o letra == "," o letra == ";" o letra == "." o i == Longitud(documento) + 1 Entonces
			contador = contador + 1
		Fin Si
		i = i + 1
	Fin Mientras
Fin Funcion

// Funcion de búsqueda de coincidencias en un texto
Funcion conteo <- buscar_en_texto ( palabra, texto_entrante )
	conteo = 0
	palabra_aux = ""
	Mientras i <= Longitud(texto_entrante) + 1 Hacer
		letra = Subcadena(texto_entrante,i,i)
		Si letra == " " o letra == "," o letra == ";" o letra == "." o i == Longitud(texto_entrante) + 1 Entonces
			Si palabra == palabra_aux Entonces
				conteo = conteo + 1
			Fin Si
			palabra_aux = ""
		SiNo
			palabra_aux = Concatenar(palabra_aux,letra)
		Fin Si
		
		i = i + 1
	Fin Mientras
Fin Funcion

// Funcion para el conteo de coincidencias por palabra clave
Funcion contador <- contar_palabras ( pregunta, documento )
	contador = 0
	palabra_aux = ""
	
	Mientras i <= Longitud(pregunta) + 1 Hacer
		letra = Subcadena(pregunta,i,i)
		Si letra == " " o letra == "," o letra == ";" o letra == "." o i == Longitud(pregunta) + 1 Entonces
			contador = contador + buscar_en_texto(palabra_aux,documento)
			palabra_aux = ""
		SiNo
			palabra_aux = Concatenar(palabra_aux,letra)
		Fin Si
		
		i = i + 1
	Fin Mientras
Fin Funcion



Algoritmo SLR_Algoritmo
	
	// *************** MODULO DE REVISION
	
	Imprimir '1. REVISION'
	Imprimir 'Ingrese titulo'
	leer r_titulo //Titulo de la revision
	Escribir 'Ingrese descripcion de revision'
	Leer r_descripcion //Descripcion de la revision
	Imprimir  'Ingrese autores de revicion'
	leer r_autores //Autores de la revision
	
	// *************** MODULO DE PLANIFICACION
	
	Imprimir '2. PLANIFICACION'
	Imprimir 'Ingrese los objetivos'
	Leer p_objetivos //Objetivos de revision
		
	//  Entradas del PICOC
	Imprimir "¿Cuál es la población?" // Pregunta
	Imprimir "Ingrese las palabras clave: " Sin Saltar
	Leer poblacion // Palabras clave
	Imprimir "Ingrese los sinonimos: " Sin Saltar
	Leer sinonimos_poblacion // Sinonimos
	
	Imprimir "¿Qué interviene en la investigación?" // Pregunta
	Imprimir "Ingrese las palabras clave: " Sin Saltar 
	Leer intervencion  // Palabras clave
	Imprimir "Ingrese los sinonimos: " Sin Saltar
	Leer sinonimos_intervencion // Sinonimos
	
	Imprimir "¿Con qué puede compararse?" // Pregunta
	Imprimir "Ingrese las palabras clave: " Sin Saltar 
	Leer comparacion // Palabras clave
	Imprimir "Ingrese los sinonimos: " Sin Saltar
	Leer sinonimos_comparacion
	
	Imprimir "¿Qué resultados espera obtener?" // Pregunta
	Imprimir "Ingrese las palabras clave: " Sin Saltar
	Leer resultado // Palabras clave
	Imprimir "Ingrese los sinonimos: " Sin Saltar
	Leer sinonimos_resultado // Sinonimos
	
	Imprimir "¿En qué tipo de circunstancias se encuentra?" // Pregunta
	Imprimir "Ingrese las palabras clave: " Sin Saltar
	Leer contexto // Palabras clave
	Imprimir "Ingrese los sinonimos: " Sin Saltar
	Leer sinonimos_contexto // Sinonimos
	
	// *************** MODULO DE CONDUCCION
	
	// Fuentes
	Imprimir "A continuación ingrese documentos para ser revisados y comparar con sus parametros de búsqueda."
	Escribir '******************************************************'
	Escribir 'Ingrese datos del primer documento a considerar:'
	Escribir 'Título: ' Sin Saltar
	Leer c_titulo_uno
	Escribir 'Ingrese autor: ' Sin Saltar 
	Leer c_autor_uno
	Escribir 'Descripción, de preferencia que sea amplia' Sin Saltar
	Leer c_descripción_uno
	
	Escribir '******************************************************'
	Escribir 'Ingrese datos del segundo documento a considerar:'
	Escribir 'Título: ' Sin Saltar
	Leer c_titulo_dos
	Escribir 'Ingrese autor: ' Sin Saltar 
	Leer c_autor_dos
	Escribir 'Descripción, de preferencia que sea amplia' Sin Saltar
	Leer c_descripción_dos
	
	Escribir '******************************************************'
	Escribir 'Ingrese datos del tercer documento a considerar:'
	Escribir 'Título: ' Sin Saltar
	Leer c_titulo_tres
	Escribir 'Ingrese autor: ' Sin Saltar 
	Leer c_autor_tres
	Escribir 'Descripción, de preferencia que sea amplia' Sin Saltar
	Leer c_descripción_tres
	
	
	//Criterios de inclusión y exclusión
	
	// ***************  MODULO DE REVISIÓN
	
	// Proceso para el primer documento
	total_palabras_primer_doc = total_palabras(c_descripción_uno)
	conteo_pobl_primer_doc = contar_palabras(poblacion,c_titulo_uno) + contar_palabras(poblacion, c_descripción_uno)
	conteo_inter_primer_doc = contar_palabras(intervencion, c_titulo_uno) + contar_palabras(intervencion, c_descripción_uno)
	conteo_comp_primer_doc = contar_palabras(comparacion,c_titulo_uno) + contar_palabras(comparacion, c_descripción_uno)
	conteo_res_primer_doc = contar_palabras(resultado,c_titulo_uno) + contar_palabras(resultado, c_descripción_uno)
	conteo_con_primer_doc = contar_palabras(contexto,c_titulo_uno) + contar_palabras(contexto, c_descripción_uno)
	
	Imprimir "DOCUMENTO: ", c_titulo_uno, " | AUTOR: ", c_autor_uno
	Imprimir "Número de palabras: ", total_palabras_primer_doc
	Imprimir "Palabras clave de Población: ", conteo_pobl_primer_doc
	Imprimir "Palabras clave de Intervencion: ", conteo_inter_primer_doc
	Imprimir "Palabras clave de Comparación: ", conteo_comp_primer_doc
	Imprimir "Palabras clave de Resultado: ", conteo_res_primer_doc
	Imprimir "Palabras clave de Contexto: ", conteo_con_primer_doc
	
	// Proceso para el segundo documento
	total_palabras_segundo_doc = total_palabras(c_descripción_dos)
	conteo_pobl_segundo_doc = contar_palabras(poblacion,c_titulo_dos) + contar_palabras(poblacion,c_descripción_dos)
	conteo_inter_segundo_doc = contar_palabras(intervencion,c_titulo_dos) + contar_palabras(intervencion,c_descripción_dos)
	conteo_comp_segundo_doc = contar_palabras(comparacion,c_titulo_dos) + contar_palabras(comparacion,c_descripción_dos)
	conteo_res_segundo_doc = contar_palabras(resultado,c_titulo_dos) + contar_palabras(resultado,c_descripción_dos)
	conteo_con_segundo_doc = contar_palabras(contexto,c_titulo_dos) + contar_palabras(contexto,c_descripción_dos)
	
	Imprimir "DOCUMENTO: ", c_titulo_dos, " | AUTOR: ", c_autor_dos
	Imprimir "Número de palabras: ", total_palabras_segundo_doc
	Imprimir "Palabras clave de Población: ", conteo_pobl_segundo_doc
	Imprimir "Palabras clave de Intervencion: ", conteo_inter_segundo_doc
	Imprimir "Palabras clave de Comparación: ", conteo_comp_segundo_doc
	Imprimir "Palabras clave de Resultado: ", conteo_res_segundo_doc
	Imprimir "Palabras clave de Contexto: ", conteo_con_segundo_doc
	
	// Proceso para el tercer documento
	total_palabras_tercer_doc = total_palabras(c_descripción_tres)
	conteo_pobl_tercer_doc = contar_palabras(poblacion,c_titulo_tres) + contar_palabras(poblacion,c_titulo_tres)
	conteo_inter_tercer_doc = contar_palabras(intervencion,c_titulo_tres) + contar_palabras(intervencion,c_titulo_tres)
	conteo_comp_tercer_doc = contar_palabras(comparacion,c_titulo_tres) + contar_palabras(comparacion,c_titulo_tres)
	conteo_res_tercer_doc = contar_palabras(resultado,c_titulo_tres) + contar_palabras(resultado,c_titulo_tres)
	conteo_con_tercer_doc = contar_palabras(contexto,c_titulo_tres) + contar_palabras(contexto,c_titulo_tres)
	
	Imprimir "DOCUMENTO: ", c_titulo_tres, " | AUTOR: ", c_autor_tres
	Imprimir "Número de palabras: ", total_palabras_tercer_doc
	Imprimir "Palabras clave de Población: ", conteo_pobl_tercer_doc
	Imprimir "Palabras clave de Intervencion: ", conteo_inter_tercer_doc
	Imprimir "Palabras clave de Comparación: ", conteo_comp_tercer_doc
	Imprimir "Palabras clave de Resultado: ", conteo_res_tercer_doc
	Imprimir "Palabras clave de Contexto: ", conteo_con_tercer_doc
	
	// 
FinAlgoritmo

