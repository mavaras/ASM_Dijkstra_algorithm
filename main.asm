TITLE alguno

INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data

inicio0	    	BYTE "--------------------------------------------------------------------------------",0dh,0ah
				BYTE "          ____  ___ ____ __   _ _    _ ____ __   _ ___ ____   ___    ",0dh,0ah
				BYTE "          |___]  |  |___ | \  |  \  /  |___ | \  |  |  |   \ |   |   ",0dh,0ah
				BYTE "          |___] _|_ |___ |  \_|   \/   |___ |  \_| _|_ |___/ |___|   ",0dh,0ah,0dh,0ah
				
				BYTE "       ALGORITMO DE DIJKSTRA APLICADO EN GRAFOS PONDERADOS DIRIGIDOS ",0dh,0ah
				BYTE "                         ARBOL DE CAMINOS MAS CORTOS                 ",0
inicio1			BYTE "                 ARQUITECTURA DE COMPUTADORES 3007863-1              ",0dh,0ah
				BYTE "                              SEMESTRE 2017-02                       ",0dh,0ah,0
inicio2			BYTE "Autores:                                                             ",0dh,0ah
				BYTE " 		Juan Pablo Chaves Morales                                      ",0dh,0ah
				BYTE " 		Mario Varas Gonzalez                                           ",0dh,0ah
				BYTE " 		Benjamin Cruz Alvarez                                          ",0dh,0ah,0dh,0ah,0
inicio3			BYTE "                Universidad Nacional de Colombia Sede Medellin       ",0dh,0ah
				BYTE "                              Facultad de Minas                      ",0dh,0ah
				BYTE "                                  Ano 2017                           ",0dh,0ah
				BYTE "--------------------------------------------------------------------------------",0
				 
descripcion     BYTE "------------------------------------------------------------------------------",0dh,0ah	
				BYTE "    ALGORITMO DE DIJKSTRA APLICADO SOBRE GRAFOS PONDERADOS DIRIGIDOS          ",0dh,0ah	
				BYTE "      PARA DETERMINAR LOS CAMINOS MAS CORTOS DESDE EL NODO INICIAL            ",0dh,0ah	
				BYTE "                        HASTA EL RESTO DE NODOS                               ",0dh,0ah,0dh,0ah,0dh,0ah
				BYTE "La idea subyacente en este algoritmo consiste en ir explorando todos los      ",0dh,0ah	
				BYTE "caminos mas cortos que parten del vertice origen y que llevan a todos los     ",0dh,0ah	
				BYTE "demas vértices; cuando se obtiene el camino mas corto desde el vertice origen,",0dh,0ah	
				BYTE "al resto de vertices que componen el grafo, el algoritmo se detiene.          ",0dh,0ah
				BYTE "El algoritmo es una especializacion de la busqueda de costo uniforme,         ",0dh,0ah	
				BYTE "y como tal, no funciona en grafos con aristas de coste negativo(al elegir     ",0dh,0ah	
				BYTE "siempre el nodo con distancia menor, pueden quedar excluidos de la busqueda   ",0dh,0ah	
				BYTE "nodos que en proximas iteraciones bajarian el costo general del camino al pasar",0dh,0ah
				BYTE "por una arista de costo negativo).                                            ",0dh,0ah
				BYTE "------------------------------------------------------------------------------",0dh,0ah,0		
				
representacion  BYTE "--------------------------------------------------------------------------------",0dh,0ah
				BYTE "                    REPRESENTACION DEL GRAFO POR CONSOLA                        ",0dh,0ah
				BYTE "En esta apliacacion se representaran los grafos dirigidos ponderados mediante   ",0dh,0ah
				BYTE "el uso de matrices de adyacencia. Como se muestra en el siguiente ejemplo:      ",0dh,0ah
				BYTE "            N1 --------> N2---------->N3                                        ",0dh,0ah
				BYTE "                   2            5                                               ",0dh,0ah
				BYTE "Un grafo sencillo que consta de 3 nodos y 2 aristas, para representarlo se crea ",0dh,0ah
				BYTE "una matriz de NxN elementos siendo N = numero de nodos; el elemento en la       ",0dh,0ah
				BYTE "posicion 'i,j' de la matriz respresenta el peso de la arista que va desde el    ",0dh,0ah
				BYTE "nodo i, hasta el nodo j. Si i = j quiere decir que es el mismo nodo,por lo tanto,",0dh,0ah
				BYTE "su distancia es 0. Si desde el nodo i hasta el nodo j no existe una arista      ",0dh,0ah
				BYTE "(dirigida) su peso en la matriz se traducirá a -1.                              ",0dh,0ah
				BYTE "Entonces, la matriz que representa el grafo anteriormente descrito seria:       ",0dh,0ah
				BYTE "                           0  2 -1                                              ",0dh,0ah
				BYTE "                          -1  0  5                                              ",0dh,0ah
				BYTE "                          -1 -1  0                                              ",0dh,0ah
				BYTE "--------------------------------------------------------------------------------",0dh,0ah,0
opciones_menu	BYTE "Escoja una opcion:",0dh,0ah,0dh,0ah
				BYTE "Presione 1 para insertar un nuevo grafo...",0dh,0ah
				BYTE "Presione 2 para continuar con un grafo predefinido...",0dh,0ah
				BYTE "Presione 3 para salir del programa...",0dh,0ah,0
				
volver_menu		BYTE "Presione 0 para volver al menu principal...",0dh,0ah,0
mensaje_ingreso BYTE "Ingrese el numero de nodos:",0dh,0ah,0
mensaje_entrada BYTE "Ingrese los datos del grafo:",0dh,0ah,0dh,0ah
				BYTE "Ingrese la distancia del nodo actual a cada nodo 'x'.",0dh,0ah,0dh,0ah
				BYTE "Nota: La distancia de un nodo a si mismo es 0, la distancia del nodo actual",0dh,0ah
				BYTE "al nodo 'x' es igual al peso de la arista, la distancia del nodo actual a un,",0dh,0ah
				BYTE "nodo al que no sea adyacente es -1.",0dh,0ah,0
mensaje_nodos1  BYTE "Distancia de nodo ",0
mensaje_nodos2  BYTE " a nodo ",0
dos_puntos 		BYTE ": ",0dh,0ah,0
espacio			BYTE "  ",0
mensaje_matriz  BYTE "La matriz de adyacencia es: ",0dh,0ah,0
eleccion_nodo	BYTE "Escriba el nodo..",0dh,0ah,0
excepcion		BYTE "Entrada inesperada, por favor intentelo de nuevo",0dh,0ah,0
despedida		BYTE "--------------------------------------------------------------------------------",0dh,0ah
				BYTE "               d8888 8888888b.  8888888  .d88888b.   .d8888b.  ",0dh,0ah
				BYTE "              d88888 888   Y88b   888   d88P   Y88b d88P  Y88b ",0dh,0ah
				BYTE "             d88P888 888    888   888   888     888 Y88b.       ",0dh,0ah
				BYTE "            d88P 888 888    888   888   888     888   Y888b.    ",0dh,0ah
				BYTE "           d88P  888 888    888   888   888     888      Y88b.  ",0dh,0ah
				BYTE "          d88P   888 888    888   888   888     888        888  ",0dh,0ah
				BYTE "         d8888888888 888  .d88P   888   Y88b. .d88P Y88b  d88P  ",0dh,0ah
				BYTE "        d88P     888 8888888P   8888888   Y88888P     Y8888P    ",0dh,0ah,0dh,0ah,0dh,0ah
				BYTE "--------------------------------------------------------------------------------",0dh,0ah,0dh,0ah
				BYTE "               EL PROGRAMA SE HA EJECUTADO CORRECTAMENTE ",0dh,0ah
				BYTE "                 ! GRACIAS POR UTILIZAR EL PROGRAMA ! ",0dh,0ah,0dh,0ah
				BYTE "--------------------------------------------------------------------------------",0dh,0ah,0


matriz DWORD 100 DUP(2)			; vector usado para representar un grafo dirigido ponderado
vector_final DWORD 20 DUP(99999); vector donde se almacenará el resultado de aplicar Dijkstra al grafo
visitado DWORD 20 DUP(0)		; vector para ver cuáles nodos del grafo han sido visitados (nivel global)
visitado_aux DWORD 20 DUP(0)	; vector para no repetir nodos adyacentes en get_adyacente (nivel de nodo)
padres DWORD 20 DUP(-1)

nodo_actual DWORD ? 			;variable que guarda el nodo sobre el cual se está trabajando
nodo_actual_aux DWORD ?			
nodo_actual_pos DWORD 0
num_nodos DWORD 0				;numero de nodos del grafo
nodo_inicial DWORD ?			;nodo sobre el cual actua el algoritmo
nodo_adyacente DWORD ?			;representa los nodos adyacentes al  nodo actual
coste DWORD ?					;el acumulado de los pesos en el camino del nodo actual al nodo final
aux DWORD 0						
aux2 DWORD 999999				;utilizado en set_nodo_actual
count DWORD 0					;variable contadora
i DWORD 0						;variable contadora
j DWORD 0

.code
main PROC
;__________________________________Mensajes de Bienvenida y explicaciones________________________
	bienvenida:
	
	mov eax, white + (blue * 16) 			;Ajustando el color del texto y del fondo
	call SetTextColor					
	call Clrscr
	
	mov edx, OFFSET inicio0 				;Imprimiendo el mensaje inicio0
	call WriteString
	call Crlf
	call Crlf

	mov edx, OFFSET inicio1					;Imprimiendo el mensaje inicio1
	call WriteString
	call Crlf
	
	mov eax, cyan + (blue * 16)				;Cambiando el color del texto y el fondo
	call SetTextColor
	
	mov edx, OFFSET inicio2					;Imprimiendo el mensaje inicio2
	call WriteString
	call Crlf
	
	mov eax, white + (blue * 16)			;Cambiando el color del texto y el fondo
	call SetTextColor
	
	mov edx, OFFSET inicio3					;Imprimiendo el mensaje inicio3
	call WriteString
	call Crlf
	call WaitMsg
	call Clrscr
;______________________________________Descripcion para el usuario___________________________
	desc:
	
	mov edx, OFFSET descripcion 			;Imprimiendo el mensaje 'descripcion', que le indica al usuario el uso correcto del programa
	call WriteString
	call Crlf
	call WaitMsg
	call Clrscr
;______________________________________Mensaje de Representacion___________________________	
	repre:
	
	mov edx, OFFSET representacion			;Imprimiendo el mensaje 'representacion' el cual le explica al usuario como se representará
	call WriteString						;el grafo en el programa
	call Crlf
	call WaitMsg
	call Clrscr
;_______________________________________Menu________________________________________________
	menu:
	
	call Clrscr
	mov edx, OFFSET opciones_menu		; Imprimiendo las opciones de menú
	call Crlf
	call WriteString					
	call Crlf

	call ReadDec						; Se lee por consola la opcion de menu que digitó el usuario
	call Clrscr
	
	cmp eax, 1							; Si la opcion es 1 le remitirá al usuario al apartado de ingreso del grafo por consola
	je grafo_nuevo

	cmp eax, 2							; Si la opcion es 2 el programa ejecutará el algoritmo sobre un grafo predefinido
	je grafo_predeterminado

	cmp eax, 3							; Si la opcion es 3 el programa dará un mensaje de despedida y terminará la ejecucion
	je salir_programa

	mov edx, OFFSET excepcion			; Pide al usuario ingresar un numero de nuevo si lo ingresado no es lo que el programa espera
	call Crlf
	call WriteString
	call Crlf
	jmp menu

	;________________________________________GRAFO_PREDETERMINADO__________________________________________________
	grafo_predeterminado:

	; por seguridad
	call reset_visitado                 ;-----------------
	call reset_visitado_aux             ; Se reinician para evitar problemas
	call reset_vector_final             ;-----------------
	
	mov num_nodos, 7					; Como ya tenemos el grafo predefinido, le ponemos numero de nodos = 7
	call init_matriz					; Se llama al metodo init_matriz definido mas abajo
	call grafo_prueba					; Inicializa la matriz del grafo con los valores predeterminados
	call Crlf
	
	mWrite "El grafo predefinido que se usara sera el siguiente: "
	call Crlf
	call show_matriz					; Muesta la matriz de adyaencia del grafo
	call Crlf
	call WaitMsg
	
	mov count, 0						; Se inicializa la variable count
	call Crlf
	mWrite "Desde que nodo quiere iniciar?:"
	call Crlf
	call ReadDec
	mov nodo_inicial, eax				; Se define el nodo inicial del grafo predeterminados
	mov nodo_actual, eax				; Se define el nodo actual para posicionarse sobre el nodo inicial
	mov ecx, SizeOf DWORD				; Se guarda en el registro ecx, el tamaño de DWORD para manejar correctamente los indices de la matriz
	dec nodo_actual						
	imul ecx, nodo_actual				
	inc nodo_actual
	mov esi, ecx						; Se le asigna a esi el valor de ecx, que contiene el indice correcto para manejar los vectores
	mov vector_final[esi], 0			; Como vector_final es el vector solucion, se marca el coste del primer nodo que es 0, por ser el inicial
	mov visitado[esi], 1				; Se guarda en el vector visitado el nodo 1, para que quede marcado como visistado

	call dijkstra						; Se llama al metodo de dijkstra para ejecutar el algoritmo
	
	otravez:							; Después de que se ejecutó el algoritmo y se entregaron los resultado el usuario
	mov edx, OFFSET volver_menu			; tiene la oportunidad de ejecutarlo de nuevo, aca se le pide al usuario que ingrese el valor
	call Crlf							; 0 para continuar ejecutando el programa
	call WriteString
	call Crlf
	call ReadDec
	
	cmp eax,0							; En caso de no dijitar 0, se vuelve a lanzar el menaje anterior
	je menu
	call Clrscr
	jmp otravez

	;___________________________________________GRAFO_NUEVO____________________________________________________
	grafo_nuevo:
	
	; por seguridad
	call reset_visitado                  ;-----------------
	call reset_visitado_aux              ;Se reinician para evitar problemas
	call reset_vector_final              ;-----------------
	
	mov edx, offset mensaje_ingreso				; Mensaje para pedir el numero de nodos 
	call WriteString
	call Crlf
	mov eax, 0
	call ReadDec								; Lee por consola el numero de nodos
	mov num_nodos, eax							; Almacena el dato en la variable num_nodos
	call Crlf	
	
	call init_matriz					; Inicializa la matriz
	call get_grafo_nuevo				; Se llama al método get_grafo_nuevo para recibir los datos por parte del usuario
	mWrite "Desde que nodo quiere iniciar?:"; Se le pide al usuario que ingrese el nodo inicial del cual quiere que se origine el algoritmo
	call Crlf
	call ReadDec						; Se lee por consola la respuesta del usuario
	
	mov nodo_actual, eax				; Se guarda el nodo inicial ingresado por el usuario
	call Clrscr				
	mov ecx, SizeOf DWORD				; Se hacen operaciones sobre el registro ecx, para determinar el indice correctamente
	dec nodo_actual						;
	imul ecx, nodo_actual				;
	inc nodo_actual						;
	mov esi, ecx						; Ese valor calculado de ecx, se traslada al registro esi, el registro de iundexacion por excelencia
	mov vector_final[esi], 0			; Se empieza a llenar el vector solucion, en este caso se asigna 0 al ser el nodo inicial
	mov visitado[esi], 1				; Se marca el nodo inicial como visitado

	call show_matriz					; Metodo para imprimir la matrioz de adyacencia del grafo ingresado por el usuario

	call dijkstra						; Se llama al metodo de dijkstra para ejecutar el algoritmo, de define mas abajo
	
	mov edx, OFFSET volver_menu			; Despues de que se ejecutó el algoritmo y se entregaron los resultado el usuario
	call Crlf							; tiene la oportunidad de ejecutarlo de nuevo, aca se le pide al usuario que ingrese el valor
	call WriteString					; 0 para continuar ejecutando el programa
	call Crlf
	call ReadDec						; Lee el ingreso del usuario, en caso de no ser 0 lanzade nuevo el mensaje
	
	cmp eax,0
	je menu

	;________________________________________SALIR_DEL_PROGRAMA________________________________________________
	salir_programa:
	
	call Clrscr
	mov edx,OFFSET despedida             ;Se imprime un mensaje de despedida y agradecimeiento y se cierra el programa
	call WriteString                           
	call Crlf
	call WaitMsg
	exit
main ENDP

;------------------------------------------------------------
dijkstra PROC USES eax ebx ecx esi
;
; Aplica el algoritmo de Dijkstra al grafo contenido en matriz,
; mostrando al final los resultados de su aplicación.
;
; El algoritmo va recorriendo, empezando por el nodo inicial,
; el conjunto de los nodos del grafo. Por cada uno de ellos (U)
; obtiene su lista de adyacencia (nodos adyacentes (V)) y toma 
; decisiones en función del peso almacenado en vector_final y 
; del que hay de U a V. 
; El resultado es el peso mínimo para moverse del nodo inicial 
; a cada uno de los demás nodos.
;
; Supone que nodo_actual y num_nodos están ya con valor.
;------------------------------------------------------------
	mov count, 0
	dijkstra_loop:

		
		mov edx, nodo_actual						;Se manipulan los registros para obtener el indice correcto para controlar los vectores
		dec edx											
		mov ebx, SizeOf DWORD
		imul ebx, edx
		mov visitado[ebx], 1						;En este caso el indice sirve para marcar como visitado el nodo sobre el cual se trabaja

		;________________________Obtiene todos los adyacentes al nodo actual___________
		get_adyacentes:
			call get_adyacente						;Este metodo obtiene los nodos adyacentes a nodo_actual 1 por 1
													;En el metodo anterior la funcion cambia el estado de la variable nodo_adyacente 
													;si es -1 quiere decir que no tiene adyacentes, en caso de si tener, devuleve el numero del nood
			cmp nodo_adyacente, -1					;Compara con menos 1 para saber si es adyaqcente o no, y salta segun sea el caso
			jne hay_adyacente
			je no_hay_adyacente

			hay_adyacente:
			; if(vector_final[nodo_adyacente-1] > (vector_final[nodo_actual-1] + matriz[nodo_actual_pos])) {
			;	vector_final[nodo_adyacente-1] = vector_final[nodo_actual-1] + matriz[nodo_actual_pos];
			;	padres[nodo_adyacente-1] = nodo_actual;
			;}
			
			mov ecx, SizeOf DWORD					;-------------------------------------
			mov edx, nodo_actual					;En este apartado mdiante el uso de resgistros se calcula el indice correcto para
			dec edx									;manipular vectores
			imul ecx, edx							;
			mov ebx, vector_final[ecx]				;Con estos indices se accede a diferentes valores de los vectoes, para llevar a cabo
			mov eax, nodo_actual_pos                ;la operacion del segundo operando del 'IF' descrito arriba
			mov ecx, SizeOf DWORD                   ;
			dec nodo_adyacente                      ;
			imul ecx, nodo_adyacente                ;
			inc nodo_adyacente                      ;
			add eax, ecx                            ;----------------------------

			add ebx, matriz[eax]					;SEGUNDO OPERANDO (vector_final[nodo_actual-1] + matriz[nodo_actual_pos])
			mov eax, ebx							;Se almacena este resultado en el registro eax
			mov aux, eax							;Posteriormente se almacena e resultado en 2 variables, aux y coste
			mov coste, eax

			;PRIMER OPERANDO (vector_final[nodo_adyacente-1])
			mov eax, 0								;----------------------- 
			mov ecx, SizeOf DWORD                   ;Al igual que el segundo operando, se calcula el primero  
			dec nodo_adyacente                      ;con valores extraidos de vectores, mediante indices calculados 
			imul ecx, nodo_adyacente                ;con registros. 
			inc nodo_adyacente                      ; 
			add eax, ecx                            ; 
			mov ebx, vector_final[eax]              ;---------------- 
                                                    
			mov eax, aux							;Se preocede a guardar los valores de aux y coste en registros 
			mov edx, coste							;estos valores equivalen a el segundo operando calculado arriba 
			
			cmp edx, ebx							;Se realiza la comparacion para saber si el primer operacndo es mayor que el segundo
			jl mayor
			jge menor

			mayor:
			
				mov ebx, nodo_adyacente				;----------------------
				dec ebx                             ;En caso de ser mayor se guarda este valor en el vector solucion
				imul ebx, SizeOf DWORD              ;
				mov edx, coste                      ;
				mov vector_final[ebx], edx          ;---------------------
				
			menor:
											;Si es menor se devuelve a calcular otro valor
			jmp get_adyacentes

			;-------------
			no_hay_adyacente:
			;-------------					;---------------------------------
			call set_nodo_actual 			;Si llego acá fue porque no encontro adyacentes, en ese caso se llama a la funcion
			mov eax, nodo_actual_aux        ;set_nodo_actual que cambia el estado del nodo actual, para hallar sus adyacentes
			mov nodo_actual, eax            ;-------------------------------------
			call reset_visitado_aux			;Se reinicia el vector de visitados

		inc count							;Se incrementa el contador
		mov edx, count
	cmp edx, num_nodos    					;Y se compara con el nuumero de nodos para trabajar sobre todos los nodos del grafo
	jl dijkstra_loop

	call Crlf
	call show_resultado					; mostrar RESULTADO, este metodo se define abajo
	ret
dijkstra ENDP

;------------------------------------------------------------
init_matriz PROC USES eax ebx ecx esi
;
; Inicializa la matriz de nodos, el grafo, poniendo todos los valores a -1 o 0
;------------------------------------------------------------
	mov ebx, 0                                
	mov ecx, 0                                
	mov eax, num_nodos                        
	mul num_nodos                             
	mov edx, eax                              
	mov esi, 0                                
	mov aux, 0                                
	for1:                                     
		for2:                           ;----------------------------------------     
			cmp ecx, aux                ;     
			je el_mismo                 ;     
			mov matriz[esi], -1         ;En este apartado simplemente se llena la matriz con 0 y -1     
			jmp otro                    ;     
			el_mismo:                   ;     
			mov matriz[esi], 0          ;     
			otro:                       ;     
			add esi, SizeOf DWORD       ;     
			inc ecx                     ;     
		cmp ecx, num_nodos              ;     
		jl for2                         ;     
		mov ecx, 0                      ;     
		add ebx, num_nodos              ;     
		inc aux                         ;_______________________________________________________     
	cmp ebx, edx                              
	jl for1                                   

	ret
init_matriz ENDP

;------------------------------------------------------------
show_matriz PROC USES eax ebx ecx esi
;
; Muestra la matriz de nodos, el grafo
;------------------------------------------------------------
	mov ebx, 0
	mov ecx, 0
	mov eax, num_nodos
	imul eax, num_nodos
	mov edx, eax
	mov esi, 0
	mWrite "__________________GRAFO__________________"
	call Crlf
	for1:
		for2:                          ;-----------------------------------
			mov eax, matriz[esi]       ;
			call WriteInt              ;
			mWrite "  "                ;Metodo para imprimir la matriz de adyacencia por consola
			add esi, SizeOf DWORD      ;
			inc ecx                    ;
		cmp ecx, num_nodos             ;
		jl for2                        ;
		mov ecx, 0                     ;
		;add esi, SizeOf DWORD         ;
		add ebx, num_nodos             ;
		call Crlf                      ;
	cmp ebx, edx                       ;-------------------------
	jl for1                           
	ret
show_matriz ENDP

;------------------------------------------------------------
get_adyacente PROC USES eax ebx ecx esi
;
; Obtiene los nodos adyacentes al nodo_actual, uno por uno
;------------------------------------------------------------		
	mov ecx, 1
	mov esi, 0
	mov edx, 1

	mov ebx, nodo_actual                ;-------------------------------
	dec ebx                             ;
	mov aux, ebx                        ;Por medio del uso de registros se calula el indice correcto
	mov eax, num_nodos                  ;para acceder a la fila correcta de la matrtiz de adyacencia
	dec eax                             ;y obtener los adyacentes de cada nodo
	imul edx, eax                       ;
	imul edx, SizeOf DWORD              ;(recordemos que cada fila representa un nodo y cada columna sus 'adyacencia' )
	imul ebx, edx                       ;
	add esi, ebx                        ;
	mov edx, SizeOf DWORD               ;
	imul edx, aux                       ;
	add esi, edx                        ;
	mov eax, esi                        ;
	mov nodo_actual_pos, esi            ;--------------------------------
	mov eax, esi

	for1:
		mov eax, matriz[esi]				; cada elemento de la fila (adyacentes)
		cmp eax, -1	
		je no_adyacente
		jne adyacente						; si no tiene -1 en esa casilla, es o él mismo o uno adyacente
		adyacente:
			cmp eax, 0						; ver si es él mismo
			je no_adyacente

			;dec eax
			cmp visitado_aux[ecx], 0		; ver si se ha visitado o no
			je adyacente_libre
			jne no_adyacente
			adyacente_libre:
				mov visitado_aux[ecx], 1 	; marcar como visitado para no repetirlo en la siguiente vuelta
				mov nodo_adyacente, ecx
				ret							; retornamos en eax el número del vértice adyacente elegido
		no_adyacente:
		add esi, SizeOf DWORD				; se calcula el indice de esi, para estudiar el siguien nodo
		inc ecx	
	cmp ecx, num_nodos
	jle for1
	
	mov nodo_adyacente, -1					; no hay adyacentes
	ret
get_adyacente ENDP

;------------------------------------------------------------
set_nodo_actual PROC USES eax ebx ecx esi
;
; Escoge un nuevo nodo_actual para dar otra vuelta al bucle
; Escoge el nodo siguiente a la arista más corta que extienda el grafo,
; es decir, parte de los nodos visitados y elige aquél al que se
; pueda llegar directamente con menos coste
;------------------------------------------------------------
	mov aux2, 999999					; Se define aux2 como 99999 representando el infinito relativo
	mov esi, 0							; Inicializando las variables que nos sirven de indice y contador
	mov ecx, 0
	for1:
		call reset_visitado_aux			; Se llama el metodo para reiniciar el vector de visitados
		inc ecx							
		mov nodo_actual, ecx			; Se define el nuevo nodo sobre le cual se a actuar
		dec ecx
		
		cmp visitado[esi], 1			; Se compara para saber si este ya fué visitado
		je ya_visitado
		jne sig
		ya_visitado:
			mov eax, SizeOf DWORD 		;------------------------------
			mov ebx, nodo_actual        ; En caso de aparecer como visitado se marco como no visitado
			dec ebx                     ;
			imul eax, ebx               ;
			mov aux, eax                ;-------------------------------
			mov visitado[eax], 0		; marcar como no visitado para que get_adyacente no devuelva -1
			
			call get_adyacente			; obtiene los adyacentes a nodo_actual
			mov visitado[eax], 1
			cmp nodo_adyacente, -1		; -1: no hay adyacentes que visitar o no quedan
			jne hay_adyacente
			je sig

			hay_adyacente:
			mov edx, num_nodos
			imul edx, SizeOf DWORD
			imul edx, ecx

			mov ebx, nodo_adyacente
			dec ebx
			imul ebx, SizeOf DWORD
			add edx, ebx
			mov eax, nodo_actual
			dec eax
			imul eax, SizeOf DWORD
			add edx, eax

			mov eax, aux2
			cmp matriz[edx], eax
			jl actualizar_minimo
			jge ya_visitado

			actualizar_minimo:
			
				mov ebx, nodo_adyacente
				cmp ebx, -1					
				je sig

				mov aux, edx
				mov edx, nodo_adyacente
				dec edx
				imul edx, SizeOf DWORD
				cmp visitado[edx], 1
				je ya_visitado
				mov edx, aux

				mov nodo_actual_aux, ebx
				mov aux, ecx
				mov ecx, matriz[edx]
				mov aux2, ecx
				mov ecx, aux
				jmp ya_visitado
		sig:
			add esi, SizeOf DWORD
			inc ecx
	cmp ecx, num_nodos
	jl for1

	mov nodo_actual, -1
	ret						; no quedan. Todos visitados
set_nodo_actual ENDP

;------------------------------------------------------------
reset_visitado_aux PROC USES eax ebx ecx esi
;
; Resetea el vector visitado_aux de cara a otra llamada a get_adyacente
;------------------------------------------------------------
	mov ecx, 0
	mov esi, 0
	vaciar:
		mov visitado_aux[esi], 0   ;-------------------
		add esi, SizeOf DWORD      ;Simplemente resetea el vector de visitados
		inc ecx                    ;rellenandolos con 0
	cmp ecx, num_nodos             ;
	jle vaciar                     ;--------------------

	ret
reset_visitado_aux ENDP

;------------------------------------------------------------
reset_vector_final PROC USES eax ebx ecx esi
;
; Resetea el vector visitado_aux de cara a otra llamada a get_adyacente
;------------------------------------------------------------
	mov ecx, 0
	mov esi, 0
	vaciar:
		mov vector_final[esi], 99999
		add esi, SizeOf DWORD
		inc ecx
	cmp ecx, num_nodos
	jle vaciar

	ret
reset_vector_final ENDP

;------------------------------------------------------------
reset_visitado PROC USES eax ebx ecx esi
;
; Resetea el vector visitado_aux de cara a otra llamada a get_adyacente
;------------------------------------------------------------
	mov ecx, 0
	mov esi, 0
	vaciar:
		mov visitado[esi], 0
		add esi, SizeOf DWORD
		inc ecx
	cmp ecx, num_nodos
	jle vaciar

	ret
reset_visitado ENDP

;------------------------------------------------------------
get_grafo_nuevo PROC USES eax ebx ecx esi
;
; Recoge los datos de un grafo nuevo
;------------------------------------------------------------

	mov edx, offset mensaje_entrada				;Empieza a pedir los datos del grafo
	call WriteString
	call Crlf
	mov esi, 0
	mov i, 0
	FOR1:
		mov eax, num_nodos
		cmp eax, i
		jle FIN_FOR1
		mov j, 0
		FOR2:
			mov eax, num_nodos
			cmp eax, j
			jle FIN_FOR2
			mov ebx, i
			cmp ebx, j                          ;-----------------------
			je el_mismo                         ;
			mov edx, OFFSET mensaje_nodos1		;Mensajes que indicaan la distancia que se pide 
			call WriteString                    ;
			mov eax, i                          ;
			inc eax                             ;
			call WriteDec                       ;
			mov edx, OFFSET mensaje_nodos2		; 
			call WriteString                    ;
			mov eax, j                          ;
			inc eax                             ;
			call WriteDec                       ;
			mov edx, OFFSET dos_puntos          ;-------------------------
			call WriteString
			call ReadInt						;Se lee cada dato de distancia
			mov matriz[esi], eax				;Se almacena cada dato leido en la matriz de adyacencia
			call Crlf
			inc j
			add esi, SizeOf DWORD
			jmp FOR2
			el_mismo:                            ;-------------
				mov matriz[esi], 0               ;Aqui se fija un condicional para no pedir la distacia de un nodo
				inc j                            ;a sí mismo
				add esi, SizeOf DWORD            ;
				jmp FOR2                         ;-----------------------
		FIN_FOR2:
		inc i
		jmp FOR1
	FIN_FOR1:
	ret
get_grafo_nuevo ENDP

;------------------------------------------------------------
show_resultado PROC USES eax ebx ecx esi
;
; Muestra el vector_final, que contiene el resultado de aplicar el algoritmo
;------------------------------------------------------------
	mov ecx, 1
	mov esi, 0

	call Crlf
	mWrite "________________RESULTADO________________"
	call Crlf
	mWrite "Nodo inicial: "
	mov eax, nodo_inicial
	call WriteInt
	call Crlf
	looop:
		mWrite "Nodo -> "
		mov eax, ecx
		call WriteInt
		mWrite "  Peso -> "
		mov eax, vector_final[esi]
		call WriteInt
		call Crlf
		add esi, SizeOf DWORD
		inc ecx
	cmp ecx, num_nodos
	jle looop
	call Crlf
	call Crlf
	mWrite "Nota: Si el resultado es 99999, quiere decir que no existe un camino"
	call Crlf
	mWrite "entre el nodo seleccionado y el nodo X."
	call Crlf
	mWrite " 99999 se refiere a infinito relativo"
	call Crlf
	ret
show_resultado ENDP

;------------------------------------------------------------
grafo_prueba PROC USES eax ebx ecx esi
;
; Crea un grafo predefinido de 7 nodos para hacer pruebas
;------------------------------------------------------------
	mov esi, SizeOf DWORD											;ESTE ES EL GRAFO QUE SE UTILIZA EN LA OPCION DE GRAFO PREDETERMINADO
	imul esi, (2 - 1)
	mov matriz[esi], 2			; 1 -> 2 peso 2

	mov esi, SizeOf DWORD
	imul esi, (4 - 1)
	mov matriz[esi], 1			; 1 -> 4 peso 4

	mov esi, SizeOf DWORD
	imul esi, num_nodos			; segunda fila, nodo 2
	;sub esi, SizeOf DWORD
	add esi, (SizeOf DWORD * (4 - 1))
	mov matriz[esi], 3			; 2 -> 4 peso 3
		
	mov esi, SizeOf DWORD
	imul esi, num_nodos			; segunda fila, nodo 2
	;add esi, SizeOf DWORD
	add esi, (SizeOf DWORD * (5 - 1))
	mov matriz[esi], 10			; 2 -> 5 peso 10

	mov esi, SizeOf DWORD
	imul esi, num_nodos			; tercera fila, nodo 3
	imul esi, 2
	;add esi, (2 * SizeOf DWORD)
	add esi, (SizeOf DWORD * (1 - 1))
	mov matriz[esi], 4			; 3 -> 1 peso 4

	mov esi, SizeOf DWORD
	imul esi, num_nodos			; tercera fila, nodo 3
	imul esi, 2
	;add esi, (2 * SizeOf DWORD)
	add esi, (SizeOf DWORD * (6 - 1))
	mov matriz[esi], 5			; 3 -> 6 peso 5

	mov esi, SizeOf DWORD
	imul esi, num_nodos			; cuarta fila, nodo 4
	imul esi, 3
	;add esi, (3 * SizeOf DWORD)
	add esi, (SizeOf DWORD * (5 - 1))
	mov matriz[esi], 2			; 4 -> 5 peso 2

	mov esi, SizeOf DWORD
	imul esi, num_nodos			; cuarta fila, nodo 4
	imul esi, 3
	;add esi, (3 * SizeOf DWORD)
	add esi, (SizeOf DWORD * (3 - 1))
	mov matriz[esi], 2			; 4 -> 3 peso 2

	mov esi, SizeOf DWORD
	imul esi, num_nodos			; cuarta fila, nodo 4
	imul esi, 3
	;add esi, (3 * SizeOf DWORD)
	add esi, (SizeOf DWORD * (6 - 1))
	mov matriz[esi], 8			; 4 -> 6 peso 8

	mov esi, SizeOf DWORD
	imul esi, num_nodos			; cuarta fila, nodo 4
	imul esi, 3
	;add esi, (3 * SizeOf DWORD)
	add esi, (SizeOf DWORD * (7 - 1))
	mov matriz[esi], 4			; 4 -> 7 peso 4

	mov esi, SizeOf DWORD
	imul esi, num_nodos			; quinta fila, nodo 5
	imul esi, 4
	;add esi, (4 * SizeOf DWORD)
	add esi, (SizeOf DWORD * (7 - 1))
	mov matriz[esi], 6			; 5 -> 7 peso 6

	mov esi, SizeOf DWORD
	imul esi, num_nodos			; séptima fila, nodo 7
	imul esi, 6
	;add esi, (6 * SizeOf DWORD)
	add esi, (SizeOf DWORD * (6 - 1))
	mov matriz[esi], 1			; 7 -> 6 peso 1

	ret
grafo_prueba ENDP

END main