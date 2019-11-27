Funcion variable_de_retorno <- review ( Argumentos )
	
Fin Funcion

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
	
	// *************** Modulo de revision
	Imprimir '1. REVISION'
	Imprimir 'Ingrese titulo'
	leer r_titulo //Titulo de la revision
	Escribir 'Ingrese descripcion de revision'
	Leer r_descripcion //Descripcion de la revision
	Imprimir  'Ingrese autores de revicion'
	leer r_autores //Autores de la revision
	
	// *************** Modulo de planificacion
	Imprimir '2. PLANIFICACION'
	Imprimir 'Ingrese los objetivos'
	Leer p_objetivos //Objetivos de revision
		
	// ***************  Entradas del PICOC
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
	
	//Palabras claves
	
	//Conducción
	// ***************  Entradas de Documentos
	Imprimir "A continuación ingrese documentos para ser revisados y comparar con sus parametros de búsqueda."
	Escribir 'Ingrese datos del primer documento a considerar:'
	Escribir 'Título: ' Sin Saltar
	Leer c_titulo1
	Escribir 'Ingrese autor: ' Sin Saltar 
	Leer c_autor1
	Escribir 'Descripción, de preferencia que sea amplia' Sin Saltar
	Leer c_descripción1
	
	
	//Criterios de inclusión y exclusión
	
	// ***************  Desarrollo	
	// Proceso para el primer documento
	total_palabras_primer_doc = total_palabras(c_descripción1)
	conteo_pobl_primer_doc = contar_palabras(poblacion,c_descripción1)
	conteo_inter_primer_doc = contar_palabras(intervencion,c_descripción1)
	conteo_comp_primer_doc = contar_palabras(comparacion,c_descripción1)
	conteo_res_primer_doc = contar_palabras(resultado,c_descripción1)
	conteo_con_primer_doc = contar_palabras(contexto,c_descripción1)
	
	Imprimir "DOCUMENTO 1 - Resultados: "
	Imprimir "Número de palabras: ", total_palabras_primer_doc
	Imprimir "Palabras clave de Población: ", conteo_pobl_primer_doc
	Imprimir "Palabras clave de Intervencion: ", conteo_inter_primer_doc
	Imprimir "Palabras clave de Comparación: ", conteo_comp_primer_doc
	Imprimir "Palabras clave de Resultado: ", conteo_res_primer_doc
	Imprimir "Palabras clave de Contexto: ", conteo_con_primer_doc
	
	// Proceso para el segundo documento
	total_palabras_segundo_doc = total_palabras(documento_dos)
	conteo_pobl_segundo_doc = contar_palabras(poblacion,documento_dos)
	conteo_inter_segundo_doc = contar_palabras(intervencion,documento_dos)
	conteo_comp_segundo_doc = contar_palabras(comparacion,documento_dos)
	conteo_res_segundo_doc = contar_palabras(resultado,documento_dos)
	conteo_con_segundo_doc = contar_palabras(contexto,documento_dos)
	
	Imprimir "DOCUMENTO 2 - Resultados: "
	Imprimir "Número de palabras: ", total_palabras_segundo_doc
	Imprimir "Palabras clave de Población: ", conteo_pobl_segundo_doc
	Imprimir "Palabras clave de Intervencion: ", conteo_inter_segundo_doc
	Imprimir "Palabras clave de Comparación: ", conteo_comp_segundo_doc
	Imprimir "Palabras clave de Resultado: ", conteo_res_segundo_doc
	Imprimir "Palabras clave de Contexto: ", conteo_con_segundo_doc
	
	// Proceso para el tercer documento
	total_palabras_tercer_doc = total_palabras(documento_tres)
	conteo_pobl_tercer_doc = contar_palabras(poblacion,documento_tres)
	conteo_inter_tercer_doc = contar_palabras(intervencion,documento_tres)
	conteo_comp_tercer_doc = contar_palabras(comparacion,documento_tres)
	conteo_res_tercer_doc = contar_palabras(resultado,documento_tres)
	conteo_con_tercer_doc = contar_palabras(contexto,documento_tres)
	
	Imprimir "DOCUMENTO 3 - Resultados: "
	Imprimir "Número de palabras: ", total_palabras_tercer_doc
	Imprimir "Palabras clave de Población: ", conteo_pobl_tercer_doc
	Imprimir "Palabras clave de Intervencion: ", conteo_inter_tercer_doc
	Imprimir "Palabras clave de Comparación: ", conteo_comp_tercer_doc
	Imprimir "Palabras clave de Resultado: ", conteo_res_tercer_doc
	Imprimir "Palabras clave de Contexto: ", conteo_con_tercer_doc
	
	// Mostrar Documentos Válidos
	Imprimir "DOCUMENTOS A CONSIDERAR: "
	cont_validos = 0
	Si validar_documento(total_palabras_primer_doc, conteo_pobl_primer_doc, conteo_inter_primer_doc, conteo_comp_primer_doc, conteo_res_primer_doc) Entonces
		Imprimir "Documento 1"
		cont_validos = cont_validos + 1
	Fin Si
	
	Si validar_documento(total_palabras_segundo_doc, conteo_pobl_segundo_doc, conteo_inter_segundo_doc, conteo_comp_segundo_doc, conteo_res_segundo_doc) Entonces
		Imprimir "Documento 2"
		cont_validos = cont_validos + 1
	Fin Si
	
	Si validar_documento(total_palabras_tercer_doc, conteo_pobl_tercer_doc, conteo_inter_tercer_doc, conteo_comp_tercer_doc, conteo_res_tercer_doc) Entonces
		Imprimir "Documento 3"
		cont_validos = cont_validos + 1
	Fin Si
	
	Si cont_validos == 0 Entonces
		Imprimir "Ninguno."
	Fin Si
FinAlgoritmo

