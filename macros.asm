cls macro
    mov ax, 03h
    int 10h
endm

printc macro txt, color
    ; carga en memoria las variables del semento de datos
    mov ax, @data
    mov ds, ax

    ; impresion por pantalla
    mov ah, 09h
    mov bl, color
    mov cx, lengthof txt - 1
    int 10h
    lea dx, txt
    int 21h
endm

printn macro n
    mov ax, 0
    mov al, n
    div baux

    mov naux[0], al
    mov naux[1], ah

    add naux[0], 48
    add naux[1], 48

    lea dx, naux
    mov ah, 09h
    int 21h
endm

printn3 macro n
    ;! asdfa
    mov naux3[0], '0'
    mov naux3[1], '0'
    mov naux3[2], '0'

    mov ax, 0
    mov al, n
    mov cl, 0ah
    div cl
    add ah, 30h

    mov naux3[2], ah

    mov ah, 0
    div cl
    add ah, 30h
    mov naux3[1], ah
    add al, 30h
    mov naux3[0], al

    print naux3
endm

print macro txt
    ; carga en memoria las variables del semento de datos
    mov ax, @data
    mov ds, ax

    ; impresion por pantalla
    mov ah, 09h
    lea dx, txt
    int 21h
endm

getch macro
    mov ah, 01h
    int 21h
endm

leerTecla macro
    mov ah, 00h
    int 16h
endm

HasKey macro
    push ax
    mov ah, 01h
    int 16h
    pop ax
endm

printIntro macro
    cls
    printc ln, 0d
    printc intro0, 10d
    printc ln, 0d
    printc intro1, 10d
    printc ln, 0d
    printc intro2, 10d
    printc ln, 0d
    printc intro3, 10d
    printc ln, 0d
    printc intro4, 10d
    printc ln, 0d
    printc intro5, 10d
    printc ln, 0d
    printc intro6, 10d
endm

printMenu macro
    cls
    printc ln, 0d
    printc msgMenu, 4d
    printc ln, 0d
    printc ln, 0d
    printc op1, 9d
    printc ln, 0d
    printc op2, 9d
    printc ln, 0d
    printc op3, 9d
    printc ln, 0d
    printc ln, 0d
    printc mayor, 10d
endm


getText macro variable
    LOCAL continue, salir
    mov lenEntrada, 0
    limpiarCadeaEntrada
    xor si,si
    continue:
        getch
        cmp al,0dh
        je salir
        mov variable[si],al
        inc lenEntrada
        inc si
        jmp continue

    salir:
        mov variable[si],'$'
        dec lenEntrada
endm


limpiarCadeaEntrada macro
    LOCAL repetir, salir
    xor di, di
    mov cx, 100
    repetir:
        mov entrada[di], '$'
        inc di
    loop repetir
endm

leerArchivo macro rruta, contenidoArchivo, longitudArchivo
    LOCAL abrir, error, leer, salir

    xor di, di
    ; Verificar en el futuro si es necesario limpiar el contenido del archivo

    abrir:
        mov ah, 3dh
        mov al, 0
        mov dx, offset rruta
        int 21h
        jc error
        mov handler, ax

    leer:
        mov ah, 3fh
        mov bx, handler
        mov dx, offset buffer
        mov cx, 1
        int 21h
        jc error
        cmp ax, 0
        jz salir
        mov ch, buffer
        mov contenidoArchivo[di], ch
        inc di
        jmp leer

    error:
        print Merror

    salir:
        dec di
        mov longitudArchivo, di
        mov ah, 3eh
        mov bx, handler
        int 21h
        
endm

; obtenerUsuarios macro
;     LOCAL salir, obtenerUsuariosLoop, obtenerPass, limpiar, limpiar1, limpiar2, verificar, obtenerUsuariosLoop2, iguales, continuar, comparar, noIgual, verificar2

;     xor di, di
;     xor si, si

;     mov userp[0], 'd'
;     mov userp[1], 'o'
;     mov userp[2], 'n'

;     obtenerUsuariosLoop:
;         cmp contenidoUsuarios[si], ','
;         je limpiar
;         cmp contenidoUsuarios[si], '$'
;         je salir
;         mov dh, contenidoUsuarios[si]
;         mov user[di], dh
;         inc di
;         inc si
;         jmp obtenerUsuariosLoop
    
;     limpiar:
;         xor di, di
;         inc si
;         jmp obtenerPass

;     obtenerPass:
;         cmp contenidoUsuarios[si], ','
;         je limpiar1
;         cmp contenidoUsuarios[si], '$'
;         je salir
;         mov dh, contenidoUsuarios[si]
;         mov pass[di], dh
;         inc di
;         inc si
;         jmp obtenerPass
    
;     limpiar1:
;         xor di, di
;         inc si
;         jmp obtenerTipo
    
;     obtenerTipo:
;         cmp contenidoUsuarios[si], ','
;         je limpiar2
;         cmp contenidoUsuarios[si], '$'
;         je salir
;         mov dh, contenidoUsuarios[si]
;         mov tipo[di], dh
;         inc di
;         inc si
;         jmp obtenerTipo
    
;     limpiar2:
;         xor di, di
;         inc si
;         jmp obtenerBloqueo
    
;     obtenerBloqueo:
;         cmp contenidoUsuarios[si], 13
;         je verificar
;         cmp contenidoUsuarios[si], '$'
;         je salir
;         mov dh, contenidoUsuarios[si]
;         mov bloqueado[di], dh
;         inc di
;         inc si
;         jmp obtenerBloqueo
    
;     verificar:
;         xor di, di
;         jmp verificar2
    
;     verificar2:
;         mov dh, userp[di]
;         cmp user[di], dh
;         je comparar
;         jmp continuar
    
;     comparar:
;         cmp di, 19
;         je iguales
;         inc di
;         jmp verificar2

;     continuar:
;         print user
;         print ln
;         print pass
;         print ln
;         print tipo
;         print ln 
;         print bloqueado
;         getch
;         xor di, di
;         inc si
;         inc si
;         limpiarTexto user
;         limpiarTexto pass
;         limpiarTexto tipo
;         limpiarTexto bloqueado
;         cmp contenidoUsuarios[si], '$'
;         je salir
;         jmp obtenerUsuariosLoop
    
;     iguales:
;         print ln
;         print msgEncontrado
;         print ln
;         jmp salir

;     salir:
;         print user
;         print ln
;         print pass
;         print ln
;         print tipo
;         print ln 
;         print bloqueado

; endm

getText2 macro variable
    LOCAL continue, salir

    ; limpiarRuta
    xor si,si

    continue:
        getch
        cmp al,0dh
        je salir
        mov variable[si],al
        inc si
        jmp continue

    salir:
        mov variable[si],0
endm

abrirArchivo macro
    LOCAL error, salir

    mov ah, 3dh
    mov al, 10b
    mov dx, offset nombreArchUsuarios
    int 21h
    jc error
    mov handler2, ax
    jmp salir

    error:
        print MError
    
    salir:
endm

cerrarArchivo macro
    mov ah,3eh
    mov handler2, bx
    int 21h
endm

escribirEnArchivo macro texto
    mov ah, 40h
    mov bx, handler2
    mov cx, sizeof texto
    mov dx, offset texto
    int 21h
endm

escribirEnArchivo2 macro texto
    mov ah, 40h
    mov bx, handler2
    mov cx, lengthUsuarios
    inc cx
    mov dx, offset texto
    int 21h
endm

escribirEnArchivo3 macro texto, longitud
    mov ah, 40h
    mov bx, handler2
    xor cx, cx
    mov cl, longitud
    mov dx, offset texto
    int 21h
endm

convertirACadena macro buffer     
    push dx
    xor dx,dx
    mov dl,al
    xor ax,ax
    mov bl,0ah
    mov al,dl
    div bl
    push ax
    add al,30h
    mov buffer[0], al        
    inc di
    pop ax
    add ah,30h
    mov buffer[1], ah
    inc di
    pop dx
endm

limpiarTexto macro text
    LOCAL repetir
    xor bx, bx
    mov cx, lengthof text
    repetir:
        mov text[bx], '$'
        inc bx
    loop repetir
endm

getUsuarioRegistro macro
    limpiarTexto userRegistro
    mov ah, 0ah
    lea dx, usuarioRegistro
    int 21h
endm

getUsuarioLogin macro
    limpiarTexto userLogin
    mov ah, 0ah
    lea dx, usuarioLogin
    int 21h
endm

getUsuarioModificar macro
    limpiarTexto userModificar
    mov ah, 0ah
    lea dx, usuarioModificar
    int 21h
endm

verificarNumero macro caracter
    LOCAL salir, noEs, mayor, siEs

    mov esNumero, 0
    cmp caracter, 48
    jge mayor
    jmp noEs

    mayor:
        cmp caracter, 58
        jle siEs
        jmp noEs
    
    siEs:
        mov esNumero, 1
        jmp salir
    
    noEs:
        mov esNumero, 0
        jmp salir
    
    salir:

endm

verificarMayuscula macro caracter
    LOCAL salir, noEs, mayor, siEs

    mov esMayuscula, 0
    cmp caracter, 65
    jge mayor
    jmp noEs

    mayor:
        cmp caracter, 90
        jle siEs
        jmp noEs
    
    siEs:
        mov esMayuscula, 1
        jmp salir
    
    noEs:
        mov esMayuscula, 0
        jmp salir
    
    salir:

endm

verificarMinuscula macro caracter
    LOCAL salir, noEs, mayor, siEs

    mov esMinuscula, 0
    cmp caracter, 97
    jge mayor
    jmp noEs

    mayor:
        cmp caracter, 122
        jle siEs
        jmp noEs
    
    siEs:
        mov esMinuscula, 1
        jmp salir
    
    noEs:
        mov esMinuscula, 0
        jmp salir
    
    salir:

endm

verificarCaracterEspecialUsuario macro caracter
    LOCAL salir, siEs, noEs
    mov esCaracterEspecial, 0
    cmp caracter, 45
    je siEs
    cmp caracter, 95
    je siEs
    cmp caracter, 46
    je siEs
    jmp noEs

    siEs:
        mov esCaracterEspecial, 1
        jmp salir
    
    noEs:
        mov esCaracterEspecial, 0
        jmp salir
    
    salir:
endm

validarUsuarioRegistro macro
    LOCAL salir, verificar, noEs, verificar1
    xor si, si
    mov bl, 0
    mov usuarioCorrecto, 0

    verificar:
        verificarMinuscula userRegistro[si]
        cmp esMinuscula, 1
        je verificar1
        verificarMayuscula userRegistro[si]
        cmp esMayuscula, 1
        je verificar1
        verificarNumero userRegistro[si]
        cmp esNumero, 1
        je verificar1
        verificarCaracterEspecialUsuario userRegistro[si]
        cmp esCaracterEspecial, 1
        je verificar1
        jmp noEs

    verificar1:
        inc si
        inc bl
        cmp bl, longRegistro
        je salir
        jmp verificar

    noEs:
        mov usuarioCorrecto, 1
        jmp salir

    salir:
endm

verificarUsuario macro userComparar, longUserComparar
    LOCAL salir, obtenerUsuariosLoop, obtenerPass, limpiar, limpiar1, limpiar2, verificar, obtenerUsuariosLoop2, iguales, continuar, comparar, noIgual, verificar2, obtenerTipo, obtenerBloqueo, antesSalir, verificar4, verificar5, comparar1, pre_iguales

    xor di, di
    xor si, si
    mov usuarioEncontrado, 0
    limpiarTexto user
    limpiarTexto pass

    obtenerUsuariosLoop:
        cmp contenidoUsuarios[si], ','
        je limpiar
        cmp contenidoUsuarios[si], '$'
        je antesSalir
        mov dh, contenidoUsuarios[si]
        mov user[di], dh
        inc di
        inc si
        jmp obtenerUsuariosLoop
    
    limpiar:
        xor di, di
        inc si
        limpiarTexto pass
        jmp obtenerPass

    obtenerPass:
        cmp contenidoUsuarios[si], ','
        je limpiar1
        cmp contenidoUsuarios[si], '$'
        je antesSalir
        mov dh, contenidoUsuarios[si]
        mov pass[di], dh
        inc di
        inc si
        jmp obtenerPass
    
    limpiar1:
        xor di, di
        inc si
        jmp obtenerTipo
    
    obtenerTipo:
        cmp contenidoUsuarios[si], ','
        je limpiar2
        cmp contenidoUsuarios[si], '$'
        je antesSalir
        mov dh, contenidoUsuarios[si]
        mov tipo[di], dh
        mov posTipo, si
        inc di
        inc si
        jmp obtenerTipo
    
    limpiar2:
        xor di, di
        inc si
        jmp obtenerBloqueo
    
    obtenerBloqueo:
        cmp contenidoUsuarios[si], 13
        je verificar
        cmp contenidoUsuarios[si], '$'
        je antesSalir
        mov dh, contenidoUsuarios[si]
        mov bloqueado[di], dh
        mov posBloqueado, si
        inc di
        inc si
        jmp obtenerBloqueo
    
    verificar:
        xor di, di
        xor bx, bx
        jmp verificar2
    
    verificar2:
        mov dh, userComparar[di]
        cmp user[di], dh
        je comparar
        jmp continuar
    
    comparar:
        mov bh, longUserComparar
        dec bh
        cmp bl, bh
        je pre_iguales
        inc di
        inc bl
        jmp verificar2

    antesSalir:
        jmp verificar4

    verificar4:
        xor di, di
        xor bx, bx
        jmp verificar5
    
    verificar5:
        mov dh, userComparar[di]
        cmp user[di], dh
        je comparar1
        jmp salir
    
    comparar1:
        mov bh, longUserComparar
        dec bh
        cmp bl, bh
        je pre_iguales
        inc di
        inc bl
        jmp verificar5

    continuar:
        ; print user
        ; print ln
        ; print pass
        ; print ln
        ; print tipo
        ; print ln 
        ; print bloqueado
        ; getch
        xor di, di
        inc si
        inc si
        limpiarTexto user
        limpiarTexto pass
        limpiarTexto tipo
        limpiarTexto bloqueado
        cmp contenidoUsuarios[si], '$'
        je salir
        limpiarTexto user
        jmp obtenerUsuariosLoop

    pre_iguales:
        inc di
        cmp user[di], '$'
        je iguales
        jmp continuar

    iguales:
        ; print ln
        ; print msgEncontrado
        mov usuarioEncontrado, 1
        ; print ln
        jmp salir

    salir:
        ; print user
        ; print ln
        ; print pass
        ; print ln
        ; print tipo
        ; print ln 
        ; print bloqueado

endm

obtenerPassword macro variable, longitud
    LOCAL salir, ciclo

    limpiarTexto variable
    mov longitud, 0
    xor si, si

    ciclo:
        mov ax, 00h
        mov ah, 08h
        int 21h
        cmp al, 0dh
        je salir
        mov variable[si], al
        inc si
        inc longitud
        mov ah, 02h
        mov dl, '$'
        int 21h
        jmp ciclo

    salir:

endm

validarLongitudPass macro
    LOCAL salir, noEs, mayor, siEs

    mov bl, 0
    cmp longPass, 16
    jge mayor
    jmp noEs

    mayor:
        cmp longPass, 20
        jle siEs
        jmp noEs
    
    siEs:
        mov bl, 1
        jmp salir
    
    noEs:
        mov bl, 0
        jmp salir
    
    salir:
endm

contarMayusculas macro
    LOCAL salir, ciclo, incrementar
    xor di, di
    xor cx, cx

    ciclo:
        cmp ch, longPass
        je salir
        verificarMayuscula passRegistro[di]
        cmp esMayuscula, 1
        je incrementar
        inc di
        inc ch
        jmp ciclo
    
    incrementar:
        inc cl
        inc ch
        inc di
        jmp ciclo

    salir:
        ; print ln
        ; printn cl
endm

contarNumeros macro
    LOCAL salir, ciclo, incrementar
    xor di, di
    xor cx, cx

    ciclo:
        cmp ch, longPass
        je salir
        verificarNumero passRegistro[di]
        cmp esNumero, 1
        je incrementar
        inc di
        inc ch
        jmp ciclo
    
    incrementar:
        inc cl
        inc ch
        inc di
        jmp ciclo

    salir:
        ; print ln
        ; printn cl
endm

verificarCaracterEspecialPass macro caracter
    LOCAL salir, siEs, noEs
    mov esCaracterEspecial, 0
    cmp caracter, 64
    je siEs
    cmp caracter, 62
    je siEs
    cmp caracter, 35
    je siEs
    cmp caracter, 43
    je siEs
    cmp caracter, 42
    je siEs
    jmp noEs

    siEs:
        mov esCaracterEspecial, 1
        jmp salir
    
    noEs:
        mov esCaracterEspecial, 0
        jmp salir
    
    salir:
endm

contarCaracteresEspeciales macro
    LOCAL salir, ciclo, incrementar
    xor di, di
    xor cx, cx

    ciclo:
        cmp ch, longPass
        je salir
        verificarCaracterEspecialPass passRegistro[di]
        cmp esCaracterEspecial, 1
        je incrementar
        inc di
        inc ch
        jmp ciclo
    
    incrementar:
        inc cl
        inc ch
        inc di
        jmp ciclo

    salir:
        ; print ln
        ; printn cl
endm

guardarUsuario macro
    abrirArchivo
    escribirEnArchivo2 contenidoUsuarios
    escribirEnArchivo lnn
    escribirEnArchivo3 userRegistro, longRegistro
    escribirEnArchivo coma
    escribirEnArchivo3 passRegistro, longPass
    escribirEnArchivo tpReg
    cerrarArchivo
endm

verificarPassword macro
    LOCAL salir, verificar, verificar2, comparar, iguales, pre_iguales

    verificar:
        mov acceso, 0
        xor di, di
        xor bx, bx
        jmp verificar2
    
    verificar2:
        mov dh, passLogin[di]
        cmp pass[di], dh
        je comparar
        jmp salir
    
    comparar:
        mov bh, longPassLogin
        dec bh
        cmp bl, bh
        je pre_iguales
        inc di
        inc bl
        jmp verificar2
    
    pre_iguales:
        inc di
        cmp pass[di], '$'
        je iguales
        jmp salir
    
    iguales:
        mov acceso, 1
        jmp salir

    salir:
endm

delay macro param   
    LOCAL ret2, ret1, finRet
    push ax
    push bx
    xor ax, ax
    xor bx, bx
    mov ax,param

    ret2:
        dec ax
        jz finRet
        mov bx, param
        
    ret1:
        dec bx
        jnz ret1
        jmp ret2

    finRet:
        pop bx
        pop ax
endm

comparar macro txt1, txt2, longTxt1
    LOCAL salir2, verificar, verificar2, comparar, iguales, salir1, salir

    verificar:
        mov acceso, 0
        xor di, di
        xor bx, bx
        jmp verificar2
    
    verificar2:
        mov dh, txt1[di]
        cmp txt2[di], dh
        je comparar
        jmp salir1
    
    comparar:
        mov bh, longTxt1
        dec bh
        cmp bl, bh
        je iguales
        inc di
        inc bl
        jmp verificar2
    
    iguales:
        mov bx, 1
        jmp salir2

    salir2:
        inc contadorErrores
        jmp salir

    salir1:
        mov contadorErrores, 0
        copiar txt1, txt2, longTxt1
        jmp salir
    
    salir:
endm

copiar macro txt1, txt2, longitud
    LOCAL salir, ciclo
    xor di, di
    xor bx, bx
    mov bl, longitud
    limpiarTexto txt2

    ciclo:
        cmp di, bx
        je salir
        mov dl, txt1[di]
        mov txt2[di], dl
        inc di
        jmp ciclo
    
    salir:
        ; print ln
        ; print userAux
endm

guardarCambiosUsuario macro
    abrirArchivo
    escribirEnArchivo2 contenidoUsuarios
    cerrarArchivo
endm

verificarUsuarioModificar macro userComparar, longUserComparar
    LOCAL salir, obtenerUsuariosLoop, obtenerPass, limpiar, limpiar1, limpiar2, verificar, obtenerUsuariosLoop2, iguales, continuar, comparar, noIgual, verificar2, obtenerTipo, obtenerBloqueo, antesSalir, verificar4, verificar5, comparar1, pre_iguales

    xor di, di
    xor si, si
    mov usuarioEncontrado, 0
    limpiarTexto user1
    limpiarTexto pass1

    obtenerUsuariosLoop:
        cmp contenidoUsuarios[si], ','
        je limpiar
        cmp contenidoUsuarios[si], '$'
        je antesSalir
        mov dh, contenidoUsuarios[si]
        mov user1[di], dh
        inc di
        inc si
        jmp obtenerUsuariosLoop
    
    limpiar:
        xor di, di
        inc si
        limpiarTexto pass1
        jmp obtenerPass

    obtenerPass:
        cmp contenidoUsuarios[si], ','
        je limpiar1
        cmp contenidoUsuarios[si], '$'
        je antesSalir
        mov dh, contenidoUsuarios[si]
        mov pass1[di], dh
        inc di
        inc si
        jmp obtenerPass
    
    limpiar1:
        xor di, di
        inc si
        jmp obtenerTipo
    
    obtenerTipo:
        cmp contenidoUsuarios[si], ','
        je limpiar2
        cmp contenidoUsuarios[si], '$'
        je antesSalir
        mov dh, contenidoUsuarios[si]
        mov tipo1[di], dh
        mov posTipo, si
        inc di
        inc si
        jmp obtenerTipo
    
    limpiar2:
        xor di, di
        inc si
        jmp obtenerBloqueo
    
    obtenerBloqueo:
        cmp contenidoUsuarios[si], 13
        je verificar
        cmp contenidoUsuarios[si], '$'
        je antesSalir
        mov dh, contenidoUsuarios[si]
        mov bloqueado1[di], dh
        mov posBloqueado, si
        inc di
        inc si
        jmp obtenerBloqueo
    
    verificar:
        xor di, di
        xor bx, bx
        jmp verificar2
    
    verificar2:
        mov dh, userComparar[di]
        cmp user1[di], dh
        je comparar
        jmp continuar
    
    comparar:
        mov bh, longUserComparar
        dec bh
        cmp bl, bh
        je pre_iguales
        inc di
        inc bl
        jmp verificar2

    antesSalir:
        jmp verificar4

    verificar4:
        xor di, di
        xor bx, bx
        jmp verificar5
    
    verificar5:
        mov dh, userComparar[di]
        cmp user1[di], dh
        je comparar1
        jmp salir
    
    comparar1:
        mov bh, longUserComparar
        dec bh
        cmp bl, bh
        je pre_iguales
        inc di
        inc bl
        jmp verificar5

    continuar:
        ; print user
        ; print ln
        ; print pass
        ; print ln
        ; print tipo
        ; print ln 
        ; print bloqueado
        ; getch
        xor di, di
        inc si
        inc si
        limpiarTexto user1
        limpiarTexto pass1
        limpiarTexto tipo1
        limpiarTexto bloqueado1
        cmp contenidoUsuarios[si], '$'
        je salir
        limpiarTexto user1
        jmp obtenerUsuariosLoop
    
    pre_iguales:
        inc di
        cmp user1[di], '$'
        je iguales
        jmp continuar

    iguales:
        ; print ln
        ; print msgEncontrado
        mov usuarioEncontrado, 1
        ; print ln
        jmp salir

    salir:
        ; print user
        ; print ln
        ; print pass
        ; print ln
        ; print tipo
        ; print ln 
        ; print bloqueado

endm

modoVideo macro
    xor ax, ax
    mov ax, 13h
    int 10h
    mov ax, 0A000h
    mov es, ax
endm

dibujarFila Macro x,y,z,color
    Local L1

    mov AH, 0CH
    mov AL, color
    mov CX, y
    mov DX, x

    L1: 
        int 10h
        inc CX
        cmp CX, z
        jl L1
EndM

dibujarColumna Macro x,y,z,color
    Local L2

    MOV AH, 0CH
    MOV AL, color
    MOV CX, x
    MOV DX, y

    L2: 
        INT 10h
        INC DX
        CMP DX, z
        JL L2
    EndM

imprimirTexto Macro txt,row,column
    Pushear

    mov ah, 02h
    mov dh, column
    mov dl, row
    int 10h
    mov dx, offset txt
    mov ah, 09h
    int 21h

    Popear
EndM

videoModeOFF macro
    push dx
    MOV dx,@data
    MOV ds,dx
    pop dx
    mov ah,00h
    mov al,3h
    int 10h
endm

Pushear macro
        push ax
        push bx
        push cx
        push dx
        push si
        push di
endm

Popear macro                    
        pop di
        pop si
        pop dx
        pop cx
        pop bx
        pop ax
endm

generarReporteOrdenamiento macro
    abrirArchivo2 nombreArchRep, handler3
    escribirEnArchivo4 encabezado1, handler3
    escribirEnArchivo4 encabezado2, handler3
    escribirEnArchivo4 encabezado3, handler3
    escribirEnArchivo4 encabezado4, handler3
    escribirEnArchivo4 encabezado5, handler3
    escribirEnArchivo4 encabezado8, handler3
    escribirEnArchivo4 encabezado6, handler3
    escribirEnArchivo4 encabezado7, handler3
    escribirEnArchivo4 encabezado8, handler3
    escribirEnArchivo4 encabezado9, handler3
    generarTipoOrdenamiento
    escribirEnArchivo4 encabezado10, handler3
    generarSentidoOrdenamiento
    escribirEnArchivo4 encabezado11, handler3
    generarFecha
    escribirEnArchivo4 dia, handler3
    escribirEnArchivo4 mes, handler3
    escribirEnArchivo4 encabezado12, handler3
    generarHora
    escribirEnArchivo4 hora, handler3
    escribirEnArchivo4 minuto, handler3
    escribirEnArchivo4 segundo, handler3
    escribirEnArchivo4 encabezado8, handler3
    escribirEnArchivo4 encabezado8, handler3
    escribirEnArchivo4 encabezado13, handler3
    cerrarArchivo2 handler3
endm

generarTipoOrdenamiento macro
    LOCAL l1, l2, l3, salir
    cmp varTipoOrdenamiento, 1
    je l1
    cmp varTipoOrdenamiento, 2
    je l2
    cmp varTipoOrdenamiento, 3
    je l3

    l1:
        escribirEnArchivo4 txtBubleSort, handler3
        jmp salir
    
    l2:
        escribirEnArchivo4 txtHeapSort, handler3
        jmp salir
    
    l3:
        escribirEnArchivo4 txtQuickSort, handler3
        jmp salir

    salir:
endm

generarSentidoOrdenamiento macro
    LOCAL l1, l2, salir
    cmp varSentido, 1
    je l1
    cmp varSentido, 2
    je l2

    l1:
        escribirEnArchivo4 txtAscendente, handler3
        jmp salir
    
    l2:
        escribirEnArchivo4 txtDescendente, handler3
        jmp salir

    salir:
endm

abrirArchivo2 macro nameFile, hand
    LOCAL error, salir

    mov ah, 3dh
    mov al, 10b
    mov dx, offset nameFile
    int 21h
    jc error
    mov hand, ax
    jmp salir

    error:
        print MError
    
    salir:
endm

cerrarArchivo2 macro hand
    mov ah,3eh
    mov hand, bx
    int 21h
endm

escribirEnArchivo4 macro texto, hand
    mov ah, 40h
    mov bx, hand
    mov cx, sizeof texto
    mov dx, offset texto
    int 21h
endm

generarFecha macro
    xor ax, ax
    xor bx, bx
    mov ah, 2ah             
    int 21h
    mov di,0
    mov al,dl
    convertirACadena dia
    inc di           
    mov al, dh
    convertirACadena mes
endm

generarHora macro
    xor     ax, ax
    xor     bx, bx
    mov     ah, 2ch
    int     21h
    mov     di,0
    mov     al, ch
    convertirACadena hora
    inc     di  
    mov     al, cl
    convertirACadena minuto
    inc     di
    mov     al, dh
    convertirACadena segundo
endm

lnHorizontal macro xbloque, ybloque
    push bx
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 72
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 2h
    sub ybloque, 17
    mov bx, ybloque
    mov ybloqueAux, bx
    mov bx, xbloque
    mov xlinea, bx
    add ybloqueAux, 18
    add xlinea, 18
    dibujarColumna xlinea, ybloque, ybloqueAux, 0h
    add xlinea, 18
    dibujarColumna xlinea, ybloque, ybloqueAux, 0h
    add xlinea, 18
    dibujarColumna xlinea, ybloque, ybloqueAux, 0h
    pop bx
endm

T_Invertida macro xbloque, ybloque
    add xbloque, 18
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 17
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    sub xbloque, 18
    
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 54
    inc ybloque
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h

    sub ybloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    mov bx, xbloque
    mov xlinea, bx
    add ybloqueAux, 19
    add xlinea, 17
    dibujarColumna xlinea, ybloque, ybloqueAux, 0h
    add xlinea, 18
    dibujarColumna xlinea, ybloque, ybloqueAux, 0h
    sub ybloque, 18
endm

Cuadrado macro xbloque, ybloque
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 36
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    
    inc ybloque
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 4h
    
    sub ybloque, 36
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 37
    mov bx, xbloque
    mov xlinea, bx
    add xlinea, 17
    dibujarColumna xlinea, ybloque, ybloqueAux, 0h
endm

Zeta macro xbloque, ybloque
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 36
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    
    inc ybloque
    inc ybloque
    add xbloque, 18
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 36
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h

    sub ybloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 19
    mov bx, xbloque
    mov xlinea, bx
    add xlinea, 18
    dibujarColumna xlinea, ybloque, ybloqueAux, 0h
    sub ybloque, 18
    sub xbloque, 18
    mov bx, xbloque
    mov xlinea, bx
    add xlinea, 17
    dibujarColumna xlinea, ybloque, ybloqueAux, 0h
endm

ZetaEspejo macro xbloque, ybloque
    add xbloque, 18
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 37
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h

    sub xbloque, 18
    inc ybloque
    inc ybloque
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 36
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h

    sub ybloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 19
    mov bx, xbloque
    mov xlinea, bx
    add xlinea, 17
    dibujarColumna xlinea, ybloque, ybloqueAux, 0h

    add xbloque, 18
    mov bx, xbloque
    mov xlinea, bx
    add xlinea, 18
    sub ybloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 19
    dibujarColumna xlinea, ybloque, ybloqueAux, 0h
    sub xbloque, 18
endm

L_Invertida1 macro xbloque, ybloque
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 36
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    sub ybloque, 17

    add xbloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 0
    
    add ybloque, 19
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 35

    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    sub ybloque, 19
    sub xbloque, 17

    add ybloque, 36
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 18

    dibujarFila ybloque, xbloque, xbloqueAux, 0
    sub ybloque, 36
    sub xbloque, 18
endm

L_Invertida2 macro xbloque, ybloque
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 36
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    sub ybloque, 17

    add xbloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 0
    
    add ybloque, 19
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 35

    sub xbloque, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    sub ybloque, 19
    sub xbloque, 17

    add ybloque, 36
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 18

    dibujarFila ybloque, xbloque, xbloqueAux, 0
    sub ybloque, 36
endm

PiezaEspecial macro xbloque, ybloque
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 18
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 43
    sub ybloque, 17
endm

obtenerAnchoPieza macro
LOCAL pieza0, pieza1, pieza2, pieza3, pieza4, pieza5, pieza6, pieza7, pieza10, pieza11, pieza12, pieza13, pieza14, pieza15, pieza16, pieza17, pieza18, pieza19, pieza20, pieza21, salir
    mov dx, posX
    mov anchoPieza, dx

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
    jmp salir

    pieza0:
        add anchoPieza, 90
        jmp salir
    
    pieza1:
        add anchoPieza,72
        jmp salir
    
    pieza2:
        add anchoPieza, 54
        jmp salir
    
    pieza3:
        add anchoPieza, 72
        jmp salir
    
    pieza4:
        add anchoPieza, 72
        jmp salir
    
    pieza5:
        add anchoPieza, 54
        jmp salir
    
    pieza6:
        add anchoPieza, 54
        jmp salir
    
    pieza7:
        add anchoPieza, 32
        jmp salir
    
    pieza10:
        add anchoPieza, 32
        jmp salir
    
    pieza11:
        add anchoPieza, 54
        jmp salir
    
    pieza12:
        add anchoPieza, 72
        jmp salir
    
    pieza13:
        add anchoPieza, 54
        jmp salir
    
    pieza14:
        add anchoPieza, 54
        jmp salir
    
    pieza15:
        add anchoPieza, 54
        jmp salir
    
    pieza16:
        add anchoPieza, 72
        jmp salir
    
    pieza17:
        add anchoPieza, 54
        jmp salir
    
    pieza18:
        add anchoPieza, 72
        jmp salir

    pieza19:
        add anchoPieza, 72
        jmp salir
    
    pieza20:
        add anchoPieza, 54
        jmp salir
    
    pieza21:
        add anchoPieza, 72
        jmp salir

    salir:
endm

obtenerAltoPieza macro
LOCAL pieza0, pieza1, pieza2, pieza3, pieza4, pieza5, pieza6, pieza7, pieza10, pieza11, pieza12, pieza13, pieza14, pieza15, pieza16, pieza17, pieza18, pieza19, pieza20, pieza21, salir
    mov dx, posY
    mov altoPieza, dx

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
    jmp salir

    pieza0:
        add altoPieza, 18
        jmp salir
    
    pieza1:
        add altoPieza, 36
        jmp salir
    
    pieza2:
        add altoPieza, 36
        jmp salir
    
    pieza3:
        add altoPieza, 36
        jmp salir
    
    pieza4:
        add altoPieza, 36
        jmp salir
    
    pieza5:
        add altoPieza, 54
        jmp salir
    
    pieza6:
        add altoPieza, 54
        jmp salir
    
    pieza7:
        add altoPieza, 18
        jmp salir
    
    pieza10:
        add altoPieza, 72
        jmp salir
    
    pieza11:
        add altoPieza, 54
        jmp salir
    
    pieza12:
        add altoPieza, 36
        jmp salir
    
    pieza13:
        add altoPieza, 54
        jmp salir
    
    pieza14:
        add altoPieza, 54
        jmp salir
    
    pieza15:
        add altoPieza, 54
        jmp salir
    
    pieza16:
        add altoPieza, 36
        jmp salir
    
    pieza17:
        add altoPieza, 54
        jmp salir
    
    pieza18:
        add altoPieza, 36
        jmp salir
    
    pieza19:
        add altoPieza, 36
        jmp salir
    
    pieza20:
        add altoPieza, 54
        jmp salir
    
    pieza21:
        add altoPieza, 36
        jmp salir

    salir:
endm

cambioPieza macro
    push dx
    mov dl, tipoPiezaSiguiente
    mov tipoPiezaActual, dl
    call random
    pop dx
endm

convertirACadenaV2 macro buffer, n, pos0, pos1
    push ax
    push si
    xor ax, ax
    mov ax, 0
    mov al, n
    div baux

    mov si, pos0
    mov buffer[si], al
    mov si, pos1
    mov buffer[si], ah
    
    mov si, pos0
    add buffer[si], 48
    mov si, pos1
    add buffer[si], 48
    pop si
    pop ax
endm

convertirACadenaV3 macro buffer, n, pos0
    push ax
    push si
    xor ax, ax
    mov ax, 0
    mov al, n
    div baux

    mov si, pos0
    mov buffer[si], ah
    add buffer[si], 48
    pop si
    pop ax
endm

controlScore macro
    LOCAL salir, nivel1, nivel2, nivel3
    push dx
    cmp nivelJuego, 1
    je nivel1
    cmp nivelJuego, 2
    je nivel2
    cmp nivelJuego, 3
    je nivel3

    nivel1:
        mov incPoints, 1
        mov dl, incPoints
        add points, dl
        add pointsAux, dl
        jmp salir
    
    nivel2:
        mov incPoints, 5
        mov dl, incPoints
        add points, dl
        add pointsAux, dl
        jmp salir
    
    nivel3:
        mov incPoints, 10
        mov dl, incPoints
        add points, dl
        add pointsAux, dl
        jmp salir
    
    salir:
        convertirACadenaV2 score, points, 8, 9
        pop dx
endm

controlNivel macro
    LOCAL salir, nivel2, nivel3, finalizarJuego
    cmp pointsAux, 5
    je nivel2
    cmp pointsAux, 41
    je nivel3
    cmp pointsAux, 102
    je finalizarJuego
    jmp salir

    nivel2:
        mov nivelJuego, 2
        convertirACadenaV3 nivel, nivelJuego, 7
        inc pointsAux
        mov velocidadPieza, 4
        jmp PANTALLA_NIVEL
    
    nivel3:
        mov nivelJuego, 3
        convertirACadenaV3 nivel, nivelJuego, 7
        inc pointsAux
        mov velocidadPieza, 8
        jmp PANTALLA_NIVEL
    
    finalizarJuego:
        jmp PANTALLA_GAME_OVER

    salir:
        convertirACadenaV3 nivel, nivelJuego, 7
endm

lnVertical macro xbloque, ybloque
    push bx
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 72
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 2h
    sub xbloque, 17

    add ybloque, 18
    mov bx, xbloque
    mov xlinea, bx
    add xlinea, 18
    dibujarFila ybloque, xbloque, xlinea, 0h
    add ybloque, 18
    dibujarFila ybloque, xbloque, xlinea, 0h
    add ybloque, 18
    dibujarFila ybloque, xbloque, xlinea, 0h
    sub ybloque, 54
    pop bx
endm

Zeta1 macro xbloque, ybloque
    add xbloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    sub xbloque, 35

    add ybloque, 19
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 36
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 6h
    sub ybloque, 18

    mov bx, xbloque
    mov xlinea, bx
    add xlinea, 17

    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 19

    dibujarColumna xlinea, ybloque, ybloqueAux, 0h

    add ybloque, 20
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 6h

    sub xbloque, 16

    sub ybloque, 38
endm

ZetaEspejo1 macro xbloque, ybloque
    ; add xbloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    sub xbloque, 16

    add ybloque, 19
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 36
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 5h
    sub ybloque, 18

    mov bx, xbloque
    mov xlinea, bx
    add xlinea, 17

    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 19

    dibujarColumna xlinea, ybloque, ybloqueAux, 0h

    add xbloque, 18
    add ybloque, 20
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 5h

    sub xbloque, 35

    sub ybloque, 38
endm

T_Invertida1 macro xbloque, ybloque
    ; add xbloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    sub xbloque, 16

    add ybloque, 19
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 36
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    sub ybloque, 18

    mov bx, xbloque
    mov xlinea, bx
    add xlinea, 17

    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 19

    dibujarColumna xlinea, ybloque, ybloqueAux, 0h

    add ybloque, 20
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h

    sub xbloque, 16

    sub ybloque, 38
endm

T_Invertida3 macro xbloque, ybloque
    add xbloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    sub xbloque, 35

    add ybloque, 19
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 36
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    sub ybloque, 18

    mov bx, xbloque
    mov xlinea, bx
    add xlinea, 17

    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 19

    dibujarColumna xlinea, ybloque, ybloqueAux, 0h

    add ybloque, 20
    add xbloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 3h

    sub xbloque, 35

    sub ybloque, 38
endm

T_Invertida2 macro xbloque, ybloque

    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 54
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h

    sub ybloque, 17
    mov bx, ybloque
    mov ybloqueAux, bx
    mov bx, xbloque
    mov xlinea, bx
    add ybloqueAux, 19
    add xlinea, 17
    dibujarColumna xlinea, ybloque, ybloqueAux, 0h
    add xlinea, 18
    dibujarColumna xlinea, ybloque, ybloqueAux, 0h
    
    add ybloque, 19
    add xbloque, 18
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 17
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 3h
    sub xbloque, 18
    sub ybloque, 36
endm

rotarFiguraActual macro
    LOCAL salir, p0, p1, p3, p4, p5, p6, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21
    cmp tipoPiezaActual, 0
    je p10
    cmp tipoPiezaActual, 1
    je p11
    cmp tipoPiezaActual, 10
    je p0
    cmp tipoPiezaActual, 11
    je p12
    cmp tipoPiezaActual, 12
    je p13
    cmp tipoPiezaActual, 13
    je p1
    cmp tipoPiezaActual, 3
    je p14
    cmp tipoPiezaActual, 14
    je p3
    cmp tipoPiezaActual, 4
    je p15
    cmp tipoPiezaActual, 15
    je p4
    cmp tipoPiezaActual, 5
    je p16
    cmp tipoPiezaActual, 16
    je p17
    cmp tipoPiezaActual, 17
    je p18
    cmp tipoPiezaActual, 18
    je p5
    cmp tipoPiezaActual, 6
    je p19
    cmp tipoPiezaActual, 19
    je p20
    cmp tipoPiezaActual, 20
    je p21
    cmp tipoPiezaActual, 21
    je p6
    jmp salir

    p0:
        mov tipoPiezaActual, 0
        jmp salir
    
    p1:
        mov tipoPiezaActual, 1
        jmp salir
    
    p3:
        mov tipoPiezaActual, 3
        jmp salir
    
    p4:
        mov tipoPiezaActual, 4
        jmp salir
    
    p5:
        mov tipoPiezaActual, 5
        jmp salir
    
    p6:
        mov tipoPiezaActual, 6
        jmp salir

    p10:
        mov tipoPiezaActual, 10
        jmp salir
    
    p11:
        mov tipoPiezaActual, 11
        jmp salir
    
    p12:
        mov tipoPiezaActual, 12
        jmp salir
    
    p13:
        mov tipoPiezaActual, 13
        jmp salir
    
    p14:
        mov tipoPiezaActual, 14
        jmp salir
    
    p15:
        mov tipoPiezaActual, 15
        jmp salir
    
    p16:
        mov tipoPiezaActual, 16
        jmp salir
    
    p17:
        mov tipoPiezaActual, 17
        jmp salir
    
    p18:
        mov tipoPiezaActual, 18
        jmp salir
    
    p19:
        mov tipoPiezaActual, 19
        jmp salir
    
    p20:
        mov tipoPiezaActual, 20
        jmp salir
    
    p21:
        mov tipoPiezaActual, 21
        jmp salir

    salir:

endm

L_Invertida1_3 macro xbloque, ybloque
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 54
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45

    sub ybloque, 17

    add xbloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 0h
    add xbloque, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 0h
    sub xbloque, 36

    add ybloque, 19
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 18
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    sub ybloque, 36
endm

L_Invertida2_1 macro xbloque, ybloque
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 54
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56

    sub ybloque, 17

    add xbloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 0h
    add xbloque, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 0h
    sub xbloque, 36

    add ybloque, 19
    add xbloque, 37
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 17
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    sub ybloque, 36
    sub xbloque, 37
endm

L_Invertida2_3 macro xbloque, ybloque
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 18
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56

    inc ybloque
    inc ybloque

    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 54
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    sub ybloque, 17

    add xbloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 0h
    add xbloque, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 0h
    sub xbloque, 36
    
    sub ybloque, 19
endm

L_Invertida1_1 macro xbloque, ybloque
    add xbloque, 37
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 17
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    sub xbloque, 37

    inc ybloque
    inc ybloque

    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 54
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    sub ybloque, 17

    add xbloque, 18
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 0h
    add xbloque, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 0h
    sub xbloque, 36
    
    sub ybloque, 19
endm

L_Invertida1_2 macro xbloque, ybloque
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 36
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 45
    sub xbloque, 17

    add ybloque, 18
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 18
    dibujarFila ybloque, xbloque, xbloqueAux, 0h

    add ybloque, 19
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 36
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 45
    sub ybloque, 17

    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    add xbloque, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 0h
    sub xbloque, 18
    sub ybloque, 37
endm

L_Invertida2_2 macro xbloque, ybloque
    add xbloque, 19
    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 36
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    inc xbloque
    dibujarColumna xbloque, ybloque, ybloqueAux, 56
    sub xbloque, 17

    add ybloque, 18
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 18
    dibujarFila ybloque, xbloque, xbloqueAux, 0h

    sub xbloque, 18

    add ybloque, 19
    mov bx, xbloque
    mov xbloqueAux, bx
    add xbloqueAux, 36
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    inc ybloque
    dibujarFila ybloque, xbloque, xbloqueAux, 56
    sub ybloque, 17

    mov bx, ybloque
    mov ybloqueAux, bx
    add ybloqueAux, 18
    add xbloque, 18
    dibujarColumna xbloque, ybloque, ybloqueAux, 0h
    sub xbloque, 18
    sub ybloque, 37
endm

leerScore macro rruta, contenidoArchivo, longitudArchivo
    LOCAL abrir, error, leer, salir

    xor di, di
    ; Verificar en el futuro si es necesario limpiar el contenido del archivo

    abrir:
        mov ah, 3dh
        mov al, 0
        mov dx, offset rruta
        int 21h
        jc error
        mov handler4, ax

    leer:
        mov ah, 3fh
        mov bx, handler4
        mov dx, offset buffer4
        mov cx, 1
        int 21h
        jc error
        cmp ax, 0
        jz salir
        mov ch, buffer4
        mov contenidoArchivo[di], ch
        inc di
        jmp leer

    error:
        print Merror

    salir:
        dec di
        mov longitudArchivo, di
        mov ah, 3eh
        mov bx, handler4
        int 21h
        
endm

guardarScore macro
    abrirArchivo2 nombrePunt, handler4
    escribirEnArchivo8 score[7], 2, handler4
    escribirEnArchivo8 lnnn, 1, handler4
    mov cl, longLogin
    mov cambioTam, cx
    dec cambioTam
    escribirEnArchivo8 user, cambioTam, handler4
    escribirEnArchivo8 lnn, 1, handler4
    escribirEnArchivo8 contenidoScore, lengthScore, handler4
    cerrarArchivo2 handler4
endm

escribirEnArchivo8 macro texto, long, hand
    mov ah, 40h
    mov bx, hand
    mov cx, long
    inc cx
    mov dx, offset texto
    int 21h
endm