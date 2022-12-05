# Proyecto 2 - Manual Técnico

## Arquitecutra de Computadores y Ensambladores 1 Sección A
| Nombre                           | Carné                                      |
|:--------------------------------:|:------------------------------------------:|
| Daniel Reginaldo Dubón Rodríguez | 201901772                                  |

## ASSEMBLER

Ensamblador es un lenguaje de programacion de bajo nivel
consiste en un conjunto de mnemonicos que representan
instrucciones basicas para los procesadores,
microprocesadores, microcontroladores y otros circuitos
integrados programables.
Su implementacion es mediante la representacion simbolica de
los codigos binarios de maquina estos se usan para programar
la arquitectura del procesador.
El lenguaje assembly tiene la representacion mas directa del
codigo maquina especifico para cada arquitectura, que puede ser
legible por un programador.

## DOSBOX

DOSBox es un emulador que recrea un entorno similar al sistema DOS con el
objetivo de poder ejecutar programas y videojuegos originalmente escritos para el
sistema operativo MS-DOS de Microsoft en computadoras más modernas o en
diferentes arquitecturas.
DOSBox es un emulador de CPU completo, no solo una capa de compatibilidad
como DOSEmu o las máquinas con DOS virtual de Windows y OS/2, que
aprovechan las posibilidades de virtualización de la familia de procesadores Intel
80386. No requiere un procesador x86 ni una copia de MS-DOS o cualquier otro
DOS para ejecutarse, y puede ejecutar juegos que requieran que la CPU esté en
modo real o modo protegido.

<img src="./Imagenes/box.png" alt="drawing" style="width:200px;"/><br>

## MASM v6.11
Microsoft Macro Assembler es un ensamblador para la familia x86 de 
microprocesadores. Soporta una amplia variedad de facilidades para macros y 
programación estructurada, incluyendo bucles, llamadas a procedimientos y 
alternación


## CODIGO
## INDICE
1. Variables
2. Procedimientos
3. Macros
### Variables
Aca en esta se declararon las variables de texto que sirven para mostrar los diferentes mensajes de texto en pantalla

<img src="./Imagenes/vtexto.png" alt="drawing" style="width:500px;"/><br>

Aca muestra los mensajes de errores que puedan ocurrir en el programa

<img src="./Imagenes/verrores.png" alt="drawing" style="width:500px;"/><br>

En esta area se declaron las variables de tipo numerico que serviran para llevar control sobre el programa.

<img src="./Imagenes/vdatos.png" alt="drawing" style="width:500px;"/><br>

Aca se declararon las variables que almacena las posiciones en que se generaran y avanzaran los distintos bloques de tetris.

<img src="./Imagenes/vposicionbloque.png" alt="drawing" style="width:500px;"/><br>

Aca se declararon las variables que serviran para poder llevar el control de login y registro del usuario

<img src="./Imagenes/vloginRegistro.png" alt="drawing" style="width:500px;"/><br>

En esta area se declararon las variables que serviran para escribir en el archivo de reporte de ordenamientos

<img src="./Imagenes/vreporte.png" alt="drawing" style="width:500px;"/><br>

## ETIQUETAS

### MENU

Se muestra la logica implementada para la creacion del menu principal, dependiendo de que tecla se presione, ejecutara alguna de las opciones seleccionadas

<img src="./Imagenes/menu.png" alt="drawing" style="width:200px;"/><br>

### LOGIN
Permite realizar el login de un usuario validando sus credenciales y distinguiendo el tipo de usuario

<img src="./Imagenes/login.png" alt="drawing" style="width:500px;"/><br>

### REGISTRO

Permite realizar el registro de un usuario validando las restricciones para el nombre de usuario y la contraseña

<img src="./Imagenes/registro.png" alt="drawing" style="width:500px;"/><br>

### VER_USUARIO_A_PENALIZAR, PENALIZACION_ADMIN, PENALIZACION_ADMIN2, BLOQUEO_USUARIO

Estas etiquetas permiten realizar un tipo de penalizacion por ingresar tres veces incorrectamente su contraseña, distinguiendo el tipo de usuario

<img src="./Imagenes/penalizacionLogin.png" alt="drawing" style="width:500px;"/><br>

### ADMINISTRADOR

Esta etiqueta muestra el menu del adminstrador y detecta las opciones a seleccionar

<img src="./Imagenes/menuAdmin.png" alt="drawing" style="width:500px;"/><br>

### VERIFICAR_BLOQUEADO

Verifica si el usuario que trata de ingresar tiene bloqueado su usuario

<img src="./Imagenes/verificarBloqueado.png" alt="drawing" style="width:500px;"/><br>

### DESBLOQUEAR_USUARIO

Desbloquea a un usuario especificado

<img src="./Imagenes/desbloquearUsuario.png" alt="drawing" style="width:500px;"/><br>

### PROMOVER_USUARIO

Le da privilegios de administrador a un usuario normal

<img src="./Imagenes/promoverUsuario.png" alt="drawing" style="width:500px;"/><br>

### DEGRADAR_USUARIO

Le quita privilegios de administrador a un usuario que lo hayan promovido anteriormente

<img src="./Imagenes/degradarUsuario.png" alt="drawing" style="width:500px;"/><br>

### BUBBLE_SORT, HEAP_SORT, QUICK_SORT

Muestra los menus de los diferentes tipos de ordenamientos

<img src="./Imagenes/ordenamientos.png" alt="drawing" style="width:500px;"/><br>

### CONFIGURACION_PRE_JUEGO

Hace una configuracion inicial para poder entrar en modo video

<img src="./Imagenes/configuracionPreJuego.png" alt="drawing" style="width:500px;"/><br>

### PANTALLA_NIVEL

Muestra la pantalla de cambio de nivel, haciendo que el juego comience si se presiona la tecla de espacio

<img src="./Imagenes/pantallaNivel.png" alt="drawing" style="width:500px;"/><br>

### JUEGO

Logica del juego tetris, controla el movimiento, generacion de piezas, control del tiempo, nivel

<img src="./Imagenes/juego.png" alt="drawing" style="width:500px;"/><br>

### MOV_LEFT, MOV_RIGHT

Mueve las piezas hacia la derecha o izquierda

<img src="./Imagenes/movimientos.png" alt="drawing" style="width:500px;"/><br>

### TOP10_GLOBAL, TOP10_USUARIO

Muestra el top 10 de mejores tiempos del usuario en concreto y tambien el top de comparando con el ranking general de usuarios.

<img src="./Imagenes/tops.png" alt="drawing" style="width:500px;"/><br>


### MENU_SENTIDO_ORDENAMIENTO

Muestra el menu para escoger el sentido que tendra el ordenamiento

<img src="./Imagenes/sentidoOrdenamiento.png" alt="drawing" style="width:500px;"/><br>

### CONFIGURAR_ASCENDENTE, CONFIGURAR_DESCENDENTE

Configura el sentido dependiendo de la opcion que se haya escogido en el menu

<img src="./Imagenes/configurarDescedenteAscedente.png" alt="drawing" style="width:500px;"/><br>

### MENU_METRICA_ORDENAMIENTO

Muestra el menu para escoger la variable con que hara el ordenamiento

<img src="./Imagenes/metrica.png" alt="drawing" style="width:500px;"/><br>

### CONFIGURAR_PUNTAJE, CONFIGURAR_TIEMPO

Configura la metrica dependiendo de la opcion que se haya escogido en el menu

<img src="./Imagenes/configurarPuntajeTiempo.png" alt="drawing" style="width:500px;"/><br>

### MENU_VELOCIDAD_ORDENAMIENTO

Muestra el menu para escoger la velocidad que tendra la animacion del ordenamiento

<img src="./Imagenes/velocidad.png" alt="drawing" style="width:500px;"/><br>

### CONFIGURAR_VELOCIDAD_LENTA, CONFIGURAR_VELOIDAD_MEDIA, CONFIGURAR_VELOCIDAD_RAPIDA

Configura la velocidad del ordenamiento dependiendo de la opcion que se haya escogido en el menu

<img src="./Imagenes/configurarVelocidad.png" alt="drawing" style="width:500px;"/><br>

### GENERAR_REPORTE_ORDENAMIENTO

Genera el reporte final del ordenamiento

<img src="./Imagenes/generarReporte.png" alt="drawing" style="width:500px;"/><br>


## PROCEDIMIENTOS

### dibujarPantalla

Dibuja los elementos graficos de la pantalla de juego

<img src="./Imagenes/dibujarPantalla.png" alt="drawing" style="width:500px;"/><br>

### dibujarPantallaPausa

Muestra la pantalla de pausa, con su informacion requerida

<img src="./Imagenes/pantallaPausa.png" alt="drawing" style="width:500px;"/><br>

### dibujarPantallaTerminado

Dibuja la pantalla al terminar el juego

<img src="./Imagenes/pantallaFinal.png" alt="drawing" style="width:500px;"/><br>

### DelayPantalla

Permite hacer un retraso para refrescar la pantalla de juego y dar la animacion de movimiento

<img src="./Imagenes/delay.png" alt="drawing" style="width:500px;"/><br>

### VSync

Ayuda a sincronizar los graficos para poder observar la pantalla estable

<img src="./Imagenes/sincronizar.png" alt="drawing" style="width:500px;"/><br>

### random

Permite generar una pieza de tetris aleatoria

<img src="./Imagenes/random.png" alt="drawing" style="width:500px;"/><br>

### verificarPosY

Verifica la posicion de la pieza en el eje Y

<img src="./Imagenes/posY.png" alt="drawing" style="width:500px;"/><br>

### tiempoJuego

Lleva el control del tiempo en juego

<img src="./Imagenes/tiempo.png" alt="drawing" style="width:500px;"/><br>


## MACROS

### pritnc

Hace posible imprimir un texto en pantalla con un color especificado

<img src="./Imagenes/macrocolor.png" alt="drawing" style="width:500px;"/><br>

### printn

Permite imprimir un numero de dos cifras en pantalla

<img src="./Imagenes/printn.png" alt="drawing" style="width:500px;"/><br>

### cls

Permite limpiar la pantalla

<img src="./Imagenes/cls.png" alt="drawing" style="width:500px;"/><br>

### getch

Permite el ingreso de un caracter a traves del teclado

<img src="./Imagenes/getch.png" alt="drawing" style="width:500px;"/><br>

### getch2

Permite el ingreso de una ruta para abrir un archivo

<img src="./Imagenes/getch2.png" alt="drawing" style="width:500px;"/><br>


### getText

Permite el ingreso de las expresiones aritmeticas en la calculadora

<img src="./Imagenes/getText.png" alt="drawing" style="width:500px;"/><br>

### limpiarCadena

Permite limpiar la cadena donde se almacena la expresion aritmetica a operar

<img src="./Imagenes/limpiarCadena.png" alt="drawing" style="width:500px;"/><br>

### leerArchivo

Permite leer un archivo y guardar su contenido

<img src="./Imagenes/leerArchivo.png" alt="drawing" style="width:500px;"/><br>

### generarReporte

Permite generar el reporte del programa

<img src="./Imagenes/generarReporte.png" alt="drawing" style="width:500px;"/><br>

### abrirArchivo

Permite abrir un archivo en modo lectura/escritura

<img src="./Imagenes/abrirArchivo.png" alt="drawing" style="width:500px;"/><br>

### cerrarArchivo

Permite cerrar un archivo previamente abierto

<img src="./Imagenes/cerrarArchivo.png" alt="drawing" style="width:500px;"/><br>

### escribirArchivo

Permite escribir en un archivo

<img src="./Imagenes/escribirArchivo.png" alt="drawing" style="width:500px;"/><br>

### convertirCadena

Permite convertir un numero en cadena para poder imprimirlo en pantalla

<img src="./Imagenes/convertirCadena.png" alt="drawing" style="width:500px;"/><br>

### generarFecha

Genera la fecha y guarda el resultado en sus variables asignadas

<img src="./Imagenes/generarFecha.png" alt="drawing" style="width:500px;"/><br>

### generarHora

Genera la hora actual que tiene el sistema y la guarda en sus variables asignadas

<img src="./Imagenes/generarHora.png" alt="drawing" style="width:500px;"/><br>

### getUsuarioRegistro, getUsuarioLogin

Permite obteener los usuarios en el ambito del registro y login

<img src="./Imagenes/gets.png" alt="drawing" style="width:500px;"/><br>

### verificarNumero, verificarMayuscula, verificarMinuscula, verificarCaracterEspecialUsuario

Vefica si un caracter es un numero, mayuscula, minuscula o caracter especial

<img src="./Imagenes/verificar.png" alt="drawing" style="width:500px;"/><br>

### verificarUsuario

Verifica si el usuario ingresado esta registrado o no

<img src="./Imagenes/verificarUser.png" alt="drawing" style="width:500px;"/><br>

### contarMayusculas, contarNumeros, verificarCaracterEspecialPass, contarCaracteresEspeciales

Cuenta la cantidad de cuantos caracteres son mayusculas, son numeros o caracteres especiales

<img src="./Imagenes/verificar2.png" alt="drawing" style="width:500px;"/><br>

### verificarPassword

Verifica si las contraseñas ingresadas coinciden

<img src="./Imagenes/verificarPass.png" alt="drawing" style="width:500px;"/><br>

### guardarUsuario

Guarda el usuario en el archivo users.tet

<img src="./Imagenes/guardarUsuario.png" alt="drawing" style="width:500px;"/><br>

### delay

Es el delay que maneja el countdown para la penalizacion del administrador

<img src="./Imagenes/delay2.png" alt="drawing" style="width:500px;"/><br>

### modoVideo

Nos permite configurar y entrar en modo video

<img src="./Imagenes/modoVideo.png" alt="drawing" style="width:500px;"/><br>

### dibujarFila

Permite dibujar una linea horizontal en pantalla

<img src="./Imagenes/dibujarFila.png" alt="drawing" style="width:500px;"/><br>

### dibujarColumna

Permite dibujar una linea vertical en pantalla

<img src="./Imagenes/dibujarColumna.png" alt="drawing" style="width:500px;"/><br>

### imprimirTexto

Permite mostrar texto en modo video

<img src="./Imagenes/imprimirTexto.png" alt="drawing" style="width:500px;"/><br>

### videoModeOFF

Permite salir del modo video

<img src="./Imagenes/videoOff.png" alt="drawing" style="width:500px;"/><br>

### Pushear, Popear

Nos ayuda a guardar los valores de los registros en la pila y extraer los valores de la pila y asignarselos a los registros

<img src="./Imagenes/push.png" alt="drawing" style="width:500px;"/><br>

### generarReporteOrdenamiento

Genera el reporte de los ordenamientos

<img src="./Imagenes/generarReporteOrd.png" alt="drawing" style="width:500px;"/><br>

### lnHorizontal, T_Invertida, Cuadrado, Zeta, ZetaEspejo, L_Invertida, L_Invertida2, PiezaEspecial

Nos permite dibujar cada una de las piezas de tetris en pantalla

<img src="./Imagenes/bloques.png" alt="drawing" style="width:500px;"/><br>

### obtenerAnchoPieza, obtenerAltoPieza

Permite calcular las dimensiones de la pieza actual en juego y en base a eso ver las coliciones con las paredes del juego

<img src="./Imagenes/dimensiones.png" alt="drawing" style="width:500px;"/><br>

### controlScore

Permite llevar el control de los puntos del juego

<img src="./Imagenes/controlScore.png" alt="drawing" style="width:500px;"/><br>

### controlNivel

Permite llevar el control del nivel en que se encuentra el juego y configuar el juego en base al nivel en que se encuentra

<img src="./Imagenes/controlNivel.png" alt="drawing" style="width:500px;"/><br>

### rotarFiguraActual

Nos permite rotar las piezas del juego

<img src="./Imagenes/rotarPieza.png" alt="drawing" style="width:500px;"/><br>

# Conclusiones

- Los procedimientos y macros nos ayudan en gran manera a la reutilización de codigo y para poder cambiar el flujo del programa.

- El modo video es una forma grafica y visual de poder ver la informacion en pantalla, mostrandose de una forma mas atractiva al usuario que hace uso del programa