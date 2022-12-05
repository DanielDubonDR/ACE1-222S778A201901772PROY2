include macros.asm

.model small

;*---------------------------------> SEGMENTO DE PILA
.stack

;*---------------------------------> SEGMENTO DE DATOS
.data
;?---------------------------------> Variables de texto

ln                  db 0ah, '$'
lnn                 db 0dh, 0ah
lnnn                db '--'
coma                db ','
tpReg               db ',0,0'
intro0              db 'Universidad de San Carlos de Guatemala','$'
intro1              db 'Facultad de Ingenieria','$'
intro2              db 'Escuela de Ciencias y Sistemas','$'
intro3              db 'Arquitectura de Computadores y Ensambladores 1','$'
intro4              db 'Seccion A','$'
intro5              db 'Daniel Reginaldo Dubon Rodriguez','$'
intro6              db '201901772','$'

lg1                 db '          Bienvenido ','$'
lg2                 db ' -> F3. Jugar', '$'
lg3                 db ' -> F4. Top 10 general puntuaciones', '$'
lg4                 db ' -> F5. Mis top 10 puntuaciones', '$'
lg5                 db ' -> F10. Cerrar Sesion', '$'

lg6                 db ' -> F1. Desbloquear usuario', '$'
lg7                 db ' -> F2. Promover usuario', '$'
lg8                 db ' -> F3. Degradar usuario', '$'
lg9                 db ' -> F4. Bubble Sort', '$'
lg10                db ' -> F5. Heap Sort', '$'
lg11                db ' -> F6. Quick Sort', '$'

lg12                 db ' -> F2. Top 10 general puntuaciones', '$'
lg13                 db ' -> F3. Mis top 10 puntuaciones', '$'
lg14                 db ' -> F7. Jugar', '$'


msgMenu             db '          MENU', '$'
op1                 db '-> F1. Login', '$'
op2                 db '-> F5. Registrar', '$'
op3                 db '-> F9. Salir', '$'
op                  db 'Ingrese una opcion: $'
mayor               db '   >  $'

msgUsuario          db ' Ingrese su nombre de usuario: $'
msgPass             db ' Ingrese su contrase',164,'a: $'



Merror              db 0ah,0dh,'Error en leer archivo $'


msgCargar           db 'Ingrese ruta del archivo: ', '$'

msgTop10General     db ' TOP 10 GENERAL PUNTUACIONES', '$'
msgTop10Usuario     db ' TOP 10 PERSONAL PUNTUACIONES', '$'
msgJugar            db ' JUGAR', '$'
msgDesbloquear      db ' Ingrese el nombre de usuario a desbloquear: ', '$'
msgPromoverAdmin    db ' ERROR: no se permite promover o degradar al administrador', '$'
msgPromoverUsuario  db ' ATENCION: el usuario ya tiene privilegios de administrador', '$'
msgDegradarUsuario  db ' ATENCION: el usuario no contaba con privilegios de administrador', '$'
msgPromovido        db ' Usuario promovido con exito', '$'
msgDegradado        db ' Usuario degradado con exito', '$'
msgDesbloqueado     db ' Usuario desbloqueado correctamente ', '$'
msgPromover         db ' Ingrese el nombre de usuario a promover: ', '$'
msgDegradar         db ' Ingrese el nombre de usuario a degradar: ', '$'
msgNoBloqueado      db ' ATENCION: el usuario no se encontraba bloqueado', '$'
msgBubbleSort       db '                        ORDENAMIENTO BUBBLE SORT', '$'
msgHeapSort         db '                        ORDENAMIENTO HEAP SORT', '$'
msgQuickSort        db '                        ORDENAMIENTO QUICK SORT', '$'

msgSentido          db ' INGRESE EL SENTIDO DEL ORDENAMIENTO: ', '$'
msgAscendente       db ' -> 1. Ascendente', '$'
msgDescendente      db ' -> 2. Descendente', '$'
msgMetrica          db ' INGRESE LA METRICA CON LA QUE SE REALIZARA EL ORDENAMIENTO: ', '$'
msgMetricaTiempo    db ' -> 1. Tiempo', '$'
msgMetricaPunteos   db ' -> 2. Punteo', '$'
msgVelocidad        db ' INGRESE LA VELOCIDAD DEL ORDENAMIENTO: ', '$'
msgVelocidad1       db ' -> 1. Lento', '$'
msgVelocidad2       db ' -> 2. Media', '$'
msgVelocidad3       db ' -> 3. Rapido', '$'

msgIniciarSesion    db '          INICIAR SESION', '$'
msgRegistrarse      db '          REGISTRARSE', '$'

varTipoOrdenamiento db 0
varSentido          db 0
txtAscendente       db 'Ascendente', 0dh
txtDescendente      db 'Descendente', 0dh
varMetrica          db 0
varVelocidad        db 0
txtBubleSort        db 'Bubble Sort', 0dh
txtHeapSort         db 'Heap Sort ', 0dh
txtQuickSort        db 'Quick Sort ', 0dh

nombreEjemplo       db 'Daniel', '$$'
nivel               db 'Nivel: 1', '$'
score               db 'Score: 000', '$'
tiempo              db 'Time: 00:00:00', '$'
msgStart            db ' Press SPACE to start', '$'

txtPausa            db '--------- PAUSA ---------', '$'
txtReadnuar         db 'DEL -> Reanduar', '$'
txtTerminar         db 'ESC -> Terminar Juego', '$'
txtContine          db 'Press SPACE to exit', '$'
txtGameOver         db '------- GAME OVER -------', '$'
txtPiezaSiguiente   db 'Pieza sig.', '$'
tp1                 db ' 1. ', '$'
tp2                 db ' 2. 000', 0ah, 0dh, '$'
tp3                 db ' 3. 000', 0ah, 0dh, '$'
tp4                 db ' 4. 000', 0ah, 0dh, '$'
tp5                 db ' 5. 000', 0ah, 0dh, '$'
tp6                 db ' 6. 000', 0ah, 0dh, '$'
tp7                 db ' 7. 000', 0ah, 0dh, '$'
tp8                 db ' 8. 000', 0ah, 0dh, '$'
tp9                 db ' 9. 000', 0ah, 0dh, '$'
tp10                db '10. 000', 0ah, 0dh, '$'

;?---------------------------------> Variables REPORTE ORDENAMIENTO
encabezado1         db 'Universidad San Carlos de Guatemala', 0dh
encabezado2         db 'Facultad de Ingenieria', 0dh
encabezado3         db 'Escuela de Ciencias y Sistemas', 0dh
encabezado4         db 'Arquitectura de Computadores y Ensambladores 1', 0dh
encabezado5         db 'Seccion A', 0dh
encabezado6         db 0dh,'Daniel Reginaldo Dubon Rodriguez', 0dh
encabezado7         db '201901772', 0dh
encabezado8         db 0dh,'-----------------------------------------------------------------------------------------------------------', 0dh
encabezado9         db 0dh,'Tipo: '
encabezado10        db 'Sentido: '
encabezado11        db 'Fecha: '
encabezado12        db 0dh,'Hora: '
encabezado13        db 'Rank            Player              N               Points               Time', 0dh
reporteCreado       db ' Reporte creado con exito', '$'

dia                 db 2 dup('0'), '/'
mes                 db 2 dup('0'), '/2022'
hora                db 2 dup('0'), ':'
minuto              db 2 dup('0'), ':'
segundo             db 2 dup('0'), 0dh

;?---------------------------------> Variables de de datos
naux                db 2 dup('0'), '$'
baux                db 10

handler             dw ?
handler2            dw ?
handler3            dw ?
handler4            dw ?
nombreArchUsuarios  db 'users.tet',0
nombreArchRep       db 'REPSORT.REP',0
nombrePunt          db 'punt.tet',0
buffer              db '0'
buffer4             db '0'
contenidoUsuarios   db 400 dup('$')
contenidoScore      db 400 dup('$')
lengthUsuarios      dw 0
lengthScore         dw 0

user                db 17 dup('$')
pass                db 20 dup('$')
tipo                db 2 dup('$')
bloqueado           db 2 dup('$')
user1               db 17 dup('$')
pass1               db 20 dup('$')
tipo1               db 2 dup('$')
bloqueado1          db 2 dup('$')
; userp               db 20 dup('$')
; passp               db 20 dup('$')
posTipo             dw 0
posBloqueado        dw 0

esNumero            db 0
esMayuscula         db 0
esMinuscula         db 0
esCaracterEspecial  db 0
usuarioCorrecto     db 0
usuarioEncontrado   db 0

longPass            db 0
passRegistro        db 21 dup('$')
longPassLogin       db 0
passLogin           db 21 dup('$')
acceso              db 0
userAux             db 17 dup('$')

contadorErrores     db 0
incrementoPenalizacion db 0

posY                dw 10
ybloqueAux          dw 0
posX                dw 60
xbloqueAux          dw 0
xlinea              dw 0

tipoPiezaActual     db 0
tipoPiezaSiguiente  db 0

posXSig             dw 220
posYSig             dw 50

anchoPieza          dw 0
altoPieza           dw 0
centisegundos       db 0
segundos            db 0
minutos             db 0
velocidadPieza      dw 1
nivelJuego          db 1
incPoints           db 0
points              db 0
pointsAux           db 0
cambioTam           dw 0

usuarioRegistro label byte
    maxRegistro     db 16
    longRegistro    db ?
    userRegistro    db 17 dup('$')

usuarioLogin label byte
    maxLogin        db 16
    longLogin       db ?
    userLogin       db 17 dup('$')

usuarioModificar label byte
    maxModificar        db 16
    longModificar       db ?
    userModificar       db 17 dup('$')

msgEncontrado       db 'Usuario encontrado', '$'
msgNoEncontrado     db ' ERROR el usuario no esta previamente registrado', '$'
msgNoEncontrado2    db ' ERROR usuario no encontrado', '$'
errNombreUsuario    db ' ERROR: El nombre de usuario no puede iniciar con un numero', '$'
errNombreUsuario2   db ' ERROR: El nombre de usuario debe tener como minimo 8 caracteres', '$'
errNombreUsuario3   db ' ERROR: Solo se aceptan los caracteres especiales . - _', '$'
errNombreUsuario4   db ' ERROR: El nombre de usuario ya existe', '$'
errPass             db ' ERROR: La contrase',164,'a debe ser entre 16-20 caracteres', '$'
errPass1            db ' ERROR: La contrase',164,'a debe contener al menos 3 mayusculas', '$'
errPass2            db ' ERROR: La contrase',164,'a debe contener al menos 2 numeros', '$'
errPass3            db ' ERROR: La contrase',164,'a debe contener al menos 2 caracteres especiales @ > # + *', '$'
msgRegistro         db ' Se ha registrado correctamente', '$'
passIncorrecto      db ' ERROR: La contrase',164,'a es incorrecta', '$'
msgBloqueado        db ' ERROR: Su usuario esta bloqueado, consulte su situacion con el administrador', '$'
countdown           db '   >  Contrase',164,'a incorrecta',44,' reintentar dentro de: ', '$'


lengthEntradaAux    dw 0
naux3               db 3 dup('0'), '$'

;*---------------------------------> SEGMENTO DE CODIGO
.code
    main PROC
    INTRODUCCION:
        mov ax, @data
        mov ds, ax
        printIntro
        getch
        cmp al, 0dh
        je MENU
        ; je CONFIGURACION_PRE_JUEGO
        jne INTRODUCCION


    MENU:
        printMenu
        leerTecla
        cmp ah, 3Bh
        je LOGIN
        cmp ah, 3Fh
        je REGISTRAR
        cmp ah, 43h
        je SALIR
        jmp MENU
    
    LOGIN:
        cls
        print ln
        print msgIniciarSesion
        print ln
        print ln
        print msgUsuario
        print ln
        print mayor
        getUsuarioLogin
        ; print ln
        ; print userLogin
        leerArchivo nombreArchUsuarios, contenidoUsuarios, lengthUsuarios
        verificarUsuario userLogin, longLogin
        cmp usuarioEncontrado, 0
        je errorUsuarioNoEncontrado
        print ln
        print ln
        print msgPass
        print ln
        print mayor
        obtenerPassword passLogin, longPassLogin
        print ln
        ; print passLogin
        verificarPassword
        ; print ln
        ; printn acceso
        ; mov contadorErrores, 0 ;!ver donde colocar
        cmp acceso, 0
        je errorPassword
        ; print contenidoUsuarios
        ; obtenerUsuarios
        ; print user
        ; getch
        jmp VERIFICAR_BLOQUEADO

        errorUsuarioNoEncontrado:
            print ln
            print ln
            print msgNoEncontrado
            getch
            jmp MENU
        
        errorPassword:
            cmp bloqueado[0], '1' ;!agregue estas dos lineas
            je errorBloqueado
            print ln
            print passIncorrecto
            comparar userLogin, userAux, longLogin
            ; print ln
            ; printn contadorErrores
            cmp contadorErrores, 2
            jge VER_USUARIO_A_PENALIZAR
            getch
            jmp MENU
    
    VER_USUARIO_A_PENALIZAR:
        cmp tipo, '1'
        je PENALIZACION_ADMIN
        jmp BLOQUEAR_USUARIO
    
    PENALIZACION_ADMIN:
        inc incrementoPenalizacion
        mov al, 30
        mul incrementoPenalizacion
        mov bl, al
        jmp PENALIZACION_ADMIN2
    
    PENALIZACION_ADMIN2:
        cls
        print ln
        print countdown
        printn3 bl
        cmp bl, 0
        je MENU
        dec bl
        delay 1000
        jmp PENALIZACION_ADMIN2

    
    BLOQUEAR_USUARIO:
        cls
        mov si, posBloqueado
        mov contenidoUsuarios[si], '1'
        guardarCambiosUsuario
        print ln
        print msgBloqueado
        getch
        jmp MENU
    
    VERIFICAR_BLOQUEADO:
        cmp bloqueado[0], '1'
        je errorBloqueado
        jmp VER_TIPO_USUARIO
    
        errorBloqueado:
            cls
            print ln
            print msgBloqueado
            getch
            jmp MENU
    
    VER_TIPO_USUARIO:
        leerScore nombrePunt, contenidoScore, lengthScore
        cmp tipo[0], '1'
        je ADMINISTRADOR
        cmp tipo[0], '0'
        je USUARIO
        cmp tipo[0], '2'
        je USUARIO_ADMIN
        jmp MENU
    
    ADMINISTRADOR:
        mov contadorErrores, 0
        cls
        print ln
        print lg1
        print user
        print ln
        print ln
        print lg6
        print ln
        print lg7
        print ln
        print lg8
        print ln
        print lg9
        print ln
        print lg10
        print ln
        print lg11
        print ln
        print lg5
        print ln
        print ln
        print mayor
        leerTecla
        cmp ah, 3bh
        je DESBLOQUEAR_USUARIO
        cmp ah, 3ch
        je PROMOVER_USUARIO
        cmp ah, 3dh
        je DEGRADAR_USUARIO
        cmp ah, 3eh
        je BUBBLE_SORT
        cmp ah, 3fh
        je HEAP_SORT
        cmp ah, 40h
        je QUICK_SORT
        cmp ah, 44h
        je MENU
        jmp ADMINISTRADOR
    
    DESBLOQUEAR_USUARIO:
        cls
        print ln
        print msgDesbloquear
        print ln
        print mayor
        getUsuarioModificar
        ; leerArchivo nombreArchUsuarios, contenidoUsuarios, lengthUsuarios
        verificarUsuarioModificar userModificar, longModificar
        cmp usuarioEncontrado, 0
        je errorUsuarioNoEncontrado2
        cmp bloqueado1[0], '0'
        je errorDesbloquearUsuario
        mov si, posBloqueado
        mov contenidoUsuarios[si], '0'
        guardarCambiosUsuario
        print ln
        print ln
        print msgDesbloqueado
        getch
        cmp tipo, '1'
        je ADMINISTRADOR
        cmp tipo, '2'
        je USUARIO_ADMIN

    errorDesbloquearUsuario:
        print ln
        print ln
        print msgNoBloqueado
        getch
        cmp tipo, '1'
        je ADMINISTRADOR
        cmp tipo, '2'
        je USUARIO_ADMIN
    
    errorUsuarioNoEncontrado2:
            print ln
            print ln
            print msgNoEncontrado2
            getch
            cmp tipo, '1'
            je ADMINISTRADOR
            cmp tipo, '2'
            je USUARIO_ADMIN
            ; jmp MENU

    PROMOVER_USUARIO:
        cls
        print ln
        print msgPromover
        print ln
        print mayor
        getUsuarioModificar
        verificarUsuarioModificar userModificar, longModificar
        cmp usuarioEncontrado, 0
        je errorUsuarioNoEncontrado2
        cmp tipo1[0], '1'
        je errorPromoverAdmin
        cmp tipo1[0], '2'
        je errorPromoverAdmin2
        mov si, posTipo
        mov contenidoUsuarios[si], '2'
        guardarCambiosUsuario
        print ln
        print ln
        print msgPromovido
        getch
        cmp tipo, '1'
        je ADMINISTRADOR
        cmp tipo, '2'
        je USUARIO_ADMIN
        jmp ADMINISTRADOR
    
        errorPromoverAdmin:
            print ln
            print ln
            print msgPromoverAdmin
            getch
            jmp ADMINISTRADOR
        
        errorPromoverAdmin2:
            print ln
            print ln
            print msgPromoverUsuario
            getch
            jmp ADMINISTRADOR
    
    DEGRADAR_USUARIO:
        cls
        print ln
        print msgDegradar
        print ln
        print mayor
        getUsuarioModificar
        verificarUsuarioModificar userModificar, longModificar
        cmp usuarioEncontrado, 0
        je errorUsuarioNoEncontrado2
        cmp tipo1[0], '1'
        je errorPromoverAdmin
        cmp tipo1[0], '0'
        je errorDegradarUsuario
        mov si, posTipo
        mov contenidoUsuarios[si], '0'
        guardarCambiosUsuario
        print ln
        print ln
        print msgDegradado
        getch
        cmp tipo, '1'
        je ADMINISTRADOR
        cmp tipo, '2'
        je USUARIO_ADMIN
        jmp ADMINISTRADOR

    errorDegradarUsuario:
        print ln
        print ln
        print msgDegradarUsuario
        getch
        jmp ADMINISTRADOR
    
    BUBBLE_SORT:
        mov varTipoOrdenamiento, 1
        cls
        print ln
        print msgBubbleSort
        jmp MENU_SENTIDO_ORDENAMIENTO
    
    HEAP_SORT:
        mov varTipoOrdenamiento, 2
        cls
        print ln
        print msgHeapSort
        jmp MENU_SENTIDO_ORDENAMIENTO
    
    QUICK_SORT:
        mov varTipoOrdenamiento, 3
        cls
        print ln
        print msgQuickSort
        jmp MENU_SENTIDO_ORDENAMIENTO
    

    USUARIO:
        guardarScore
        mov contadorErrores, 0
        cls
        print ln
        print lg1
        print user
        print ln
        print ln
        print lg2
        print ln
        print lg3
        print ln
        print lg4
        print ln
        print lg5
        print ln
        print ln
        print mayor
        leerTecla
        cmp ah, 3dh
        je CONFIGURACION_PRE_JUEGO
        cmp ah, 3eh
        je TOP10_GLOBAL
        cmp ah, 3fh
        je TOP10_USUARIO
        cmp ah, 44h
        je MENU
        jmp USUARIO
    
    INICIAR_JUEGO:
        cls
        getch
        cmp tipo, '2'
        je USUARIO_ADMIN
        jmp USUARIO
    
    CONFIGURACION_PRE_JUEGO:
        xor ax,ax
        xor bx,bx
        xor cx,cx
        xor dx,dx
        xor si,si
        xor di,di
        mov nivel[7], '1'
        mov tiempo[6], '0'
        mov tiempo[7], '0'
        mov tiempo[9], '0'
        mov tiempo[10], '0'
        mov tiempo[12], '0'
        mov tiempo[13], '0'
        mov posY, 10
        mov posX, 60
        mov centisegundos, 0
        mov segundos, 0
        mov minutos, 0
        mov velocidadPieza, 1
        mov nivelJuego, 1
        mov points, 0
        mov pointsAux, 0
        mov score[7], '0'
        mov score[8], '0'
        mov score[9], '0'
        call random
        mov dl, tipoPiezaSiguiente
        mov tipoPiezaActual, dl
        call asignarPiezaSiguiente
        jmp PANTALLA_NIVEL
    
    PANTALLA_NIVEL:
        modoVideo
        call dibujarPantalla
        imprimirTexto txtPiezaSiguiente, 185, 3
        imprimirTexto nivel, 8, 12
        imprimirTexto user, 187, 15
        imprimirTexto score, 185, 17
        imprimirTexto tiempo, 185, 19
        imprimirTexto msgStart 1, 14
        ; inc posY
        call VSync
        ; call VSync
        call DelayPantalla
        HasKey
        jz PANTALLA_NIVEL
        leerTecla
        cmp al, 32
        je JUEGO
        jmp PANTALLA_NIVEL
    
    JUEGO:
        ; cls
        modoVideo
        call dibujarPantalla
        imprimirTexto txtPiezaSiguiente, 185, 3
        imprimirTexto nivel, 1, 0
        imprimirTexto user, 187, 15
        imprimirTexto score, 185, 17
        imprimirTexto tiempo, 185, 19
        push dx
        mov dx, velocidadPieza
        add posY, dx
        pop dx
        call verificarPosY
        call tiempoJuego
        call VSync
        ; call VSync
        call DelayPantalla
        controlNivel
        HasKey
        jz JUEGO
        leerTecla
        cmp al, 27
        je PANTALLA_PAUSA
        cmp al, 32
        je CAMBIO
        cmp al, 49
        je CAMBIO2
        cmp ah, 4Bh
        je MOV_LEFT
        cmp ah, 4Dh
        je MOV_RIGTH
        jmp JUEGO
    
    PANTALLA_PAUSA:
        modoVideo
        call dibujarPantallaPausa
        call VSync
        call DelayPantalla
        HasKey
        jz PANTALLA_PAUSA
        leerTecla
        cmp al, 27
        je TERMINAR_JUEGO
        cmp ax, 5300h
        je JUEGO
        jmp PANTALLA_PAUSA
    
    PANTALLA_GAME_OVER:
        modoVideo
        call dibujarPantallaTerminado
        call VSync
        call DelayPantalla
        HasKey
        jz PANTALLA_GAME_OVER
        leerTecla
        cmp al, 32
        je TERMINAR_JUEGO
        jmp PANTALLA_GAME_OVER
    
    TERMINAR_JUEGO:
        videoModeOFF
        cmp tipo, '2'
        je USUARIO_ADMIN
        jmp USUARIO
    
    
    CAMBIO2:
        push dx
        mov dl, tipoPiezaSiguiente
        mov tipoPiezaActual, dl
        call random
        pop dx
        jmp JUEGO

    CAMBIO:
        rotarFiguraActual
        jmp JUEGO
    
    MOV_LEFT:
        cmp posX, 10
        jle JUEGO
        sub posX, 18
        jmp JUEGO
    
    MOV_RIGTH:
        obtenerAnchoPieza
        cmp anchoPieza, 195
        jge JUEGO
        add posX, 18
        jmp JUEGO
    
    TOP10_GLOBAL:
        leerScore nombrePunt, contenidoScore, lengthScore
        cls
        print ln
        print msgTop10General
        print ln
        print ln
        print contenidoScore
        getch
        cmp tipo, '1'
        je ADMINISTRADOR
        cmp tipo, '2'
        je USUARIO_ADMIN
        jmp USUARIO
    
    TOP10_USUARIO:
        cls
        print ln
        print msgTop10Usuario
        print ln
        print ln
        print tp1
        print score[7]
        print ln
        print tp2
        print tp3
        print tp4
        print tp5
        print tp6
        print tp7
        print tp8
        print tp9
        print tp10
        getch
        cmp tipo, '2'
        je USUARIO_ADMIN
        jmp USUARIO
    
    USUARIO_ADMIN:
        guardarScore
        mov contadorErrores, 0
        cls
        print ln
        print lg1
        print user
        print ln
        print ln
        print lg6
        print ln
        print lg12
        print ln
        print lg13
        print ln
        print lg9
        print ln
        print lg10
        print ln
        print lg11
        print ln
        print lg14
        print ln
        print lg5
        print ln
        print ln
        print mayor
        leerTecla
        cmp ah, 3bh
        je DESBLOQUEAR_USUARIO
        cmp ah, 3ch
        je TOP10_GLOBAL
        cmp ah, 3dh
        je TOP10_USUARIO
        cmp ah, 3eh
        je BUBBLE_SORT
        cmp ah, 3fh
        je HEAP_SORT
        cmp ah, 40h
        je QUICK_SORT
        cmp ah, 41h
        je CONFIGURACION_PRE_JUEGO
        cmp ah, 44h
        je MENU
        jmp USUARIO_ADMIN


    REGISTRAR:
        cls
        print ln
        print msgRegistrarse
        print ln
        print ln
        print msgUsuario
        print ln
        print mayor
        getUsuarioRegistro
        print ln
        verificarNumero userRegistro[0]
        cmp esNumero, 1
        je errorNombreUsuario
        cmp longRegistro, 8
        jl errorNombreUsuario2
        validarUsuarioRegistro
        cmp usuarioCorrecto, 1
        je errorNombreUsuario3
        leerArchivo nombreArchUsuarios, contenidoUsuarios, lengthUsuarios
        verificarUsuario userRegistro, longRegistro
        cmp usuarioEncontrado, 1
        je errorUsuarioEncontrado
        print ln
        print msgPass
        print ln
        print mayor
        obtenerPassword passRegistro, longPass
        validarLongitudPass
        cmp bl, 0
        je errorPass
        contarMayusculas
        cmp cl, 3
        jl errorPass1
        contarNumeros
        cmp cl, 2
        jl errorPass2
        contarCaracteresEspeciales
        cmp cl, 2
        jl errorPass3
        ; print ln
        ; print passRegistro
        ; print ln
        ; printn longPass
        guardarUsuario
        print ln
        print ln
        print msgRegistro
        getch
        JMP MENU

        errorNombreUsuario:
            print ln
            print errNombreUsuario
            getch
            jmp REGISTRAR
        
        errorNombreUsuario2:
            print ln
            print errNombreUsuario2
            getch
            jmp REGISTRAR
        
        errorNombreUsuario3:
            print ln
            print errNombreUsuario3
            getch
            jmp REGISTRAR
        
        errorPass:
            print ln
            print ln
            print errPass
            getch
            jmp REGISTRAR
        
        errorPass1:
            print ln
            print ln
            print errPass1
            getch
            jmp REGISTRAR
        
        errorPass2:
            print ln
            print ln
            print errPass2
            getch
            jmp REGISTRAR
        
        errorPass3:
            print ln
            print ln
            print errPass3
            getch
            jmp REGISTRAR
        
        errorUsuarioEncontrado:
            print ln
            print errNombreUsuario4
            getch
            jmp REGISTRAR
    
    
    MENU_SENTIDO_ORDENAMIENTO:
        print ln
        print ln
        print msgSentido
        print ln
        print ln
        print msgAscendente
        print ln
        print msgDescendente
        print ln
        print ln
        print mayor
        getch
        cmp al, '1'
        je CONFIGURAR_ASCENDENTE
        cmp al, '2'
        je CONFIGURAR_DESCENDENTE
        cmp varTipoOrdenamiento, 1
        je BUBBLE_SORT
        cmp varTipoOrdenamiento, 2
        je HEAP_SORT
        cmp varTipoOrdenamiento, 3
        je QUICK_SORT
    
    CONFIGURAR_ASCENDENTE:
        mov varSentido, 1
        jmp MENU_METRICA_ORDENAMIENTO
    
    CONFIGURAR_DESCENDENTE:
        mov varSentido, 2
        jmp MENU_METRICA_ORDENAMIENTO
    
    MENU_METRICA_ORDENAMIENTO:
        cls
        print ln
        print msgMetrica
        print ln
        print ln
        print msgMetricaTiempo
        print ln
        print msgMetricaPunteos
        print ln
        print ln
        print mayor
        getch
        cmp al, '1'
        je CONFIGURAR_PUNTAJE
        cmp al, '2'
        je CONFIGURAR_TIEMPO
        jmp MENU_METRICA_ORDENAMIENTO
    
    CONFIGURAR_PUNTAJE:
        mov varMetrica, 1
        jmp MENU_VELOCIDAD_ORDENAMIENTO
    
    CONFIGURAR_TIEMPO:
        mov varMetrica, 2
        jmp MENU_VELOCIDAD_ORDENAMIENTO
    
    MENU_VELOCIDAD_ORDENAMIENTO:
        cls
        print ln
        print msgVelocidad
        print ln
        print ln
        print msgVelocidad1
        print ln
        print msgVelocidad2
        print ln
        print msgVelocidad3
        print ln
        print ln
        print mayor
        getch
        cmp al, '1'
        je CONFIGURAR_VELOCIDAD_LENTA
        cmp al, '2'
        je CONFIGURAR_VELOCIDAD_MEDIA
        cmp al, '3'
        je CONFIGURAR_VELOCIDAD_RAPIDA
        jmp MENU_VELOCIDAD_ORDENAMIENTO
    
    CONFIGURAR_VELOCIDAD_LENTA:
        mov varVelocidad, 1
        jmp GENERAR_REPORTE_ORDENAMIENTO
    
    CONFIGURAR_VELOCIDAD_MEDIA:
        mov varVelocidad, 2
        jmp GENERAR_REPORTE_ORDENAMIENTO
    
    CONFIGURAR_VELOCIDAD_RAPIDA:
        mov varVelocidad, 3
        jmp GENERAR_REPORTE_ORDENAMIENTO
    
    GENERAR_REPORTE_ORDENAMIENTO:
        cls
        generarReporteOrdenamiento
        print ln
        print reporteCreado
        getch
        cmp tipo, '1'
        je ADMINISTRADOR
        cmp tipo, '2'
        je USUARIO_ADMIN

    ; ARCHIVO:
    ;     cls
    ;     print ln
    ;     print msgCargar
    ;     getText2 ruta
    ;     leerArchivo ruta, Merror
    ;     getch
    ;     jmp MENU

    
    SALIR:
        ; generarReporte
        ; mov ax, 3h 
        ; int 10h
        ; jmp INTRODUCCION
        .exit

    main ENDP

    dibujarPantalla proc near
        dibujarAreaJuego:
            dibujarFila 4, 5, 187, 127
            dibujarFila 5, 5, 187, 127
            dibujarColumna 5, 6, 196, 127
            dibujarColumna 4, 6, 196, 127
            dibujarColumna 186, 6, 196, 127
            dibujarColumna 187, 6, 196, 127
            dibujarFila 195, 5, 187, 127
            dibujarFila 196, 5, 187, 127
        
        dibujarAreaPiezaSig:
            dibujarFila 32, 195, 305, 24
            dibujarFila 115, 195, 305, 24
            dibujarColumna 195, 32, 115, 24
            dibujarColumna 305, 32, 115, 24
        
        pintarBloqueActual:
            cmp tipoPiezaActual, 0
            je pieza0
            cmp tipoPiezaActual, 1
            je pieza1
            cmp tipoPiezaActual, 2
            je pieza2
            cmp tipoPiezaActual, 3
            je pieza3
            cmp tipoPiezaActual, 4
            je pieza4
            cmp tipoPiezaActual, 5
            je pieza5
            cmp tipoPiezaActual, 6
            je pieza6
            cmp tipoPiezaActual, 7
            je pieza7
            cmp tipoPiezaActual, 10
            je pieza10
            cmp tipoPiezaActual, 11
            je pieza11
            cmp tipoPiezaActual, 12
            je pieza12
            cmp tipoPiezaActual, 13
            je pieza13
            cmp tipoPiezaActual, 14
            je pieza14
            cmp tipoPiezaActual, 15
            je pieza15
            cmp tipoPiezaActual, 16
            je pieza16
            cmp tipoPiezaActual, 17
            je pieza17
            cmp tipoPiezaActual, 18
            je pieza18
            cmp tipoPiezaActual, 19
            je pieza19
            cmp tipoPiezaActual, 20
            je pieza20
            cmp tipoPiezaActual, 21
            je pieza21
            ; lnHorizontal posX, posY
            ; L_Invertida2 posXSig, posYSig

        pieza0:
            lnHorizontal posX, posY
            jmp pintarBloqueAux
        
        pieza1:
            T_Invertida posX, posY
            jmp pintarBloqueAux
        
        pieza2:
            Cuadrado posX, posY
            jmp pintarBloqueAux
        
        pieza3:
            Zeta posX, posY
            jmp pintarBloqueAux
        
        pieza4:
            ZetaEspejo posX, posY
            jmp pintarBloqueAux
        
        pieza5:
            L_Invertida1 posX, posY
            jmp pintarBloqueAux
        
        pieza6:
            L_Invertida2 posX, posY
            jmp pintarBloqueAux
        
        pieza7:
            PiezaEspecial posX, posY
            jmp pintarBloqueAux
        
        pieza10:
            lnVertical posX, posY
            jmp pintarBloqueAux
        
        pieza11:
            T_Invertida1 posX, posY
            jmp pintarBloqueAux
        
        pieza12:
            T_Invertida2 posX, posY
            jmp pintarBloqueAux
        
        pieza13:
            T_Invertida3 posX, posY
            jmp pintarBloqueAux
        
        pieza14:
            Zeta1 posX, posY
            jmp pintarBloqueAux
        
        pieza15:
            ZetaEspejo1 posX, posY
            jmp pintarBloqueAux
        
        pieza16:
            L_Invertida1_1 posX, posY
            jmp pintarBloqueAux
        
        pieza17:
            L_Invertida1_2 posX, posY
            jmp pintarBloqueAux
        
        pieza18:
            L_Invertida1_3 posX, posY
            jmp pintarBloqueAux
        
        pieza19:
            L_Invertida2_1 posX, posY
            jmp pintarBloqueAux
        
        pieza20:
            L_Invertida2_2 posX, posY
            jmp pintarBloqueAux
        
        pieza21:
            L_Invertida2_3 posX, posY
            jmp pintarBloqueAux
        
        pintarBloqueAux:
            cmp tipoPiezaSiguiente, 0
            je piezaAux0
            cmp tipoPiezaSiguiente, 1
            je piezaAux1
            cmp tipoPiezaSiguiente, 2
            je piezaAux2
            cmp tipoPiezaSiguiente, 3
            je piezaAux3
            cmp tipoPiezaSiguiente, 4
            je piezaAux4
            cmp tipoPiezaSiguiente, 5
            je piezaAux5
            cmp tipoPiezaSiguiente, 6
            je piezaAux6
            cmp tipoPiezaSiguiente, 7
            je piezaAux7
        
        piezaAux0:
            lnHorizontal posXSig, posYSig
            jmp salirDibujarPantalla
        
        piezaAux1:
            T_Invertida posXSig, posYSig
            jmp salirDibujarPantalla
        
        piezaAux2:
            Cuadrado posXSig, posYSig
            jmp salirDibujarPantalla
        
        piezaAux3:
            Zeta posXSig, posYSig
            jmp salirDibujarPantalla
        
        piezaAux4:
            ZetaEspejo posXSig, posYSig
            jmp salirDibujarPantalla
        
        piezaAux5:
            L_Invertida1 posXSig, posYSig
            jmp salirDibujarPantalla
        
        piezaAux6:
            L_Invertida2 posXSig, posYSig
            jmp salirDibujarPantalla
        
        piezaAux7:
            PiezaEspecial posXSig, posYSig
            jmp salirDibujarPantalla
        
        
        
    salirDibujarPantalla:
        ret
    dibujarPantalla endp

    dibujarPantallaPausa proc 

        ; imprimirTexto nivel, 1, 0
        ; imprimirTexto user, 185, 15
        imprimirTexto score, 29, 1
        imprimirTexto tiempo, 1, 1
        imprimirTexto nivel, 16, 6
        imprimirTexto txtPausa, 7, 9
        imprimirTexto txtReadnuar, 7, 12
        imprimirTexto txtTerminar, 7, 15

        dibujarFila 4, 5, 316, 113
        dibujarFila 5, 5, 316, 113
        dibujarColumna 5, 6, 196, 113
        dibujarColumna 4, 6, 196, 113
        dibujarColumna 314, 6, 196, 113
        dibujarColumna 315, 6, 196, 113
        dibujarFila 195, 5, 316, 113
        dibujarFila 196, 5, 316, 113
        ret
    dibujarPantallaPausa endp

    dibujarPantallaTerminado proc 

        convertirACadenaV3 score, 1, 7
        convertirACadenaV3 score, 0, 8
        convertirACadenaV3 score, 0, 9
        imprimirTexto score, 29, 1
        imprimirTexto tiempo, 1, 1
        imprimirTexto txtGameOver, 7, 10
        imprimirTexto txtContine, 10, 15

        dibujarFila 4, 5, 316, 145
        dibujarFila 5, 5, 316, 145
        dibujarColumna 5, 6, 196, 145
        dibujarColumna 4, 6, 196, 145
        dibujarColumna 314, 6, 196, 145
        dibujarColumna 315, 6, 196, 145
        dibujarFila 195, 5, 316, 145
        dibujarFila 196, 5, 316, 145
        ret
    dibujarPantallaTerminado endp

    DelayPantalla proc near
        mov cx, 00001h
        mov dx, 0000h
        mov ah, 86h
        int 15h
        ret
    DelayPantalla endp

    VSync proc near
        mov dx, 03dah
        WaitNotVSync:
            in al, dx
            and al, 08h
            jnz WaitNotVSync
        WaitVSync:
            in al, dx
            and al, 08h
            jz WaitVSync
        ret
    VSync endp

    random PROC near
        push ax
        push bx
        push dx
		mov ah, 0h
		int 1ah

		mov ax, dx
		mov dx, 0
		mov bx, 8
		div bx

		mov tipoPiezaSiguiente, dl
        pop dx
        pop bx
        pop ax
		ret
	random ENDP

    asignarPiezaSiguiente proc near
        inc tipoPiezaSiguiente
        cmp tipoPiezaSiguiente, 8
        je reinciarVuelta
        jmp afuera

        reinciarVuelta:
            mov tipoPiezaSiguiente, 0
            jmp afuera
        
        afuera:
            ret
    asignarPiezaSiguiente endp

    verificarPosY proc near
        obtenerAltoPieza
        cmp altoPieza, 195
        jge reiniciarPosY
        jmp salirVerificarPosY

        reiniciarPosY:
            mov posY, 10
            mov posX, 60
            cambioPieza
            controlScore
            jmp salirVerificarPosY
        
        salirVerificarPosY:
            ret
    verificarPosY endp

    tiempoJuego proc near
        add centisegundos, 9
        cmp centisegundos, 100
        jge aumentarSegundo
        jmp salirTiempoJuego

        aumentarSegundo:
            mov centisegundos, 0
            inc segundos
            cmp segundos, 60
            jge aumentarMinuto
            jmp salirTiempoJuego
        
        aumentarMinuto:
            mov segundos, 0
            inc minutos
            cmp minutos, 60
            jge reiniciarTiempo
            jmp salirTiempoJuego
        
        reiniciarTiempo:
            mov minutos, 0
            jmp salirTiempoJuego

        salirTiempoJuego:
            convertirACadenaV2 tiempo, centisegundos, 12, 13
            convertirACadenaV2 tiempo, segundos, 9, 10
            convertirACadenaV2 tiempo, minutos, 6, 7
            ret
    tiempoJuego endp

END main
