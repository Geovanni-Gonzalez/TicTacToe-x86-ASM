
.MODEL SMALL


.DATA 
     
    DEV DB "--DESARROLLADORES--$"
    NOMBRE1 DB "JIMENA MENDEZ MORALES$"
    NOMBRE2 DB "GEOVANNI GONZALEZ AGUILAR$"                 
    CONTINUAR DB "PRESIONE CUALQUIER TECLA PARA CONTINUAR...$"
    LINEA DB "--------------------------------------------------------------------------------$"
  
    BIENVENIDA DB "BIENVENIDO AL JUEGO DE GATO$"
                                                
    ;NUMERO DE CELDAS
    C1 DB '1$' 
    C2 DB '2$'
    C3 DB '3$'
    C4 DB '4$'
    C5 DB '5$'
    C6 DB '6$'
    C7 DB '7$'
    C8 DB '8$'
    C9 DB '9$' 
    
    ;MARCADORES 
    MAR1 DB ' (X)$'
    MAR2 DB ' (O)$' 
     
    ENTRADA_CELDA DB 32, ' MARCAR CELDA NUMERO:    $'
    OCUPADA DB 'LA CELDA YA HA SIDO MARCADA           $' 
    
    JUGADOR DB 50, '$' 
    MOVIMIENTOS DB 0
    TERMINADO DB 0
    ES_EMPATE DB 0    
    
    FINALIZADO DB "EL JUEGO HA FINALIZADO!$"
   
    
    ;MENSAJES FINALES
    JUGADOR_MSG DB 'JUGADOR $'
    GANO_MSG DB ' GANO EL JUEGO!$'
    EMP DB '        EMPATE!$' 
    
    ; MARCADOR ACTUAL (X/O)
    MARCADOR_ACTUAL DB 88   ;88= X , 
    
    
  
    ENTRADA_INCORRECTA DB  32, 32, 32, 'INVALIDO! PRESIONE CUALQUIER TECLA...   $'   
                                        
    
    LINEA1 DB "   |   |  $"
    LINEA2 DB "---+---+---$" 
    LINEA3 DB " | $"
           
        

ENDS 
        

        
.CODE             
MAIN PROC   
    
    MOV AX, @DATA
    MOV DS, AX 
    

INICIO:     

    ;SE POSICIONA EL CURSOR
    MOV AH, 2
    MOV BH, 0
    MOV DH, 2
    MOV DL, 0
    INT 10H  
    
    ;SE IMPRIME LO INGRESADO A DX
    LEA DX, LINEA
    MOV AH, 9
    INT 21H 
    
    ;SE POSICIONA EL CURSOR
    MOV AH, 2
    MOV DH, 3
    MOV DL, 25
    INT 10H  
    
    ;SE IMPRIME LO INGRESADO A DX
    LEA DX, BIENVENIDA
    MOV AH, 9
    INT 21H   
    
    ;SE POSICIONA EL CURSOR
    MOV AH, 2
    MOV DH, 4
    MOV DL, 0
    INT 10H  
    
    ;SE IMPRIME LO INGRESADO A DX
    LEA DX, LINEA
    MOV AH, 9
    INT 21H     
    
    ;SE POSICIONA EL CURSOR
    MOV AH, 2
    MOV DH, 6
    MOV DL, 28
    INT 10H  
            
    ;SE IMPRIME LO INGRESADO A DX
    LEA DX, DEV
    MOV AH, 9
    INT 21H 
    
    ;SE POSICIONA EL CURSOR
    MOV AH, 2
    MOV DH, 8
    MOV DL, 27
    INT 10H  
            
    ;SE IMPRIME LO INGRESADO A DX
    LEA DX, NOMBRE1
    MOV AH, 9
    INT 21H     
    
   ;SE POSICIONA EL CURSOR
    MOV AH, 2
    MOV DH, 10
    MOV DL, 25
    INT 10H  
            
    ;SE IMPRIME LO INGRESADO A DX
    LEA DX, NOMBRE2
    MOV AH, 9
    INT 21H  
    
    ;SE POSICIONA EL CURSOR
    MOV AH, 2
    MOV DH, 15
    MOV DL, 20
    INT 10H   
    
    ;SE IMPRIME LO INGRESADO A DX
    LEA DX, CONTINUAR
    MOV AH, 9
    INT 21H
                
    MOV AH, 7    ; PRESIONAR UNA TECLA
    INT 21H    
     
    ;SE LIMPIA LA PANTALLA
    CALL LIMPIAR_PANTALLA
              
    
    
       
INICIALIZAR: 
           
    ;INICIALIZAR  VARIABLES
    MOV JUGADOR, 50     
    MOV MOVIMIENTOS, 0  
    MOV TERMINADO, 0
    MOV ES_EMPATE, 0 
            
    MOV C1, 49    ;1
    MOV C2, 50    ;2
    MOV C3, 51    ;3
    MOV C4, 52    ;4
    MOV C5, 53    ;5
    MOV C6, 54    ;6
    MOV C7, 55    ;7
    MOV C8, 56    ;8
    MOV C9, 57    ;9
                                                  
    JMP CAMBIO_DE_JUGADOR 
      
    ;IMPRIME EN PANTALLA EL JUGADOR QUE GANO 
    GANAR:        
        
        ;IMPRIME LOS DATOS DEL JUGADOR 
        LEA DX, JUGADOR_MSG
        MOV AH, 9
        INT 21H
            
        LEA DX, JUGADOR
        MOV AH, 9
        INT 21H
            
        LEA DX, GANO_MSG
        MOV AH, 9
        INT 21H
            
        ; POSICIONAR CURSOR 
         MOV AH, 2
         MOV DH, 19
         MOV DL, 24
         INT 10H  
         
         ;IMPRIME JUEGO FINALIZADO       
         LEA DX, FINALIZADO  
         
         MOV AH, 9
         INT 21H
            
            
         ;SE DETIENE EL PROGRAMA 
         JMP TERMINAR_JUEGO 
            
            

    ;IMPRIME EL MENSAJE DE EMPATE
    EMPATE:
        
        ;SE IMPRIME EL MENSAJE DE EMPATE 
        LEA DX, EMP
        MOV AH, 9
        INT 21H 
            
            
            
        ; POSICIONAR CURSOR 
        MOV AH, 2
        MOV DH, 19
        MOV DL, 24 
        INT 10H
        ;SE IMPRIME EL MENSAJE DE FINALIZADO        
        LEA DX, FINALIZADO 
        MOV AH, 9
        INT 21H
        
        ;SE DETIENE EL PROGRAMA               
        JMP TERMINAR_JUEGO                      




    ;VERIFICA LOS POSIBLES GANES EN EL TABLERO
    VERIFICAR:   ; HAY 8 POSIBLES RESULTADOS 
        
        VERIFICAR1:  ; VERIFICAR 1, 2, 3 
            
            MOV AL, C1
            MOV BL, C2 
            MOV CL, C3
            
            CMP AL, BL
            JNZ VERIFICAR2
            
            CMP BL, CL
            JNZ VERIFICAR2
            
            MOV TERMINADO, 1
            JMP TABLERO
            
        VERIFICAR2:  ; VERIFICAR 4, 5, 6 
            
            MOV AL, C4
            MOV BL, C5 
            MOV CL, C6
            
            CMP AL, BL
            JNZ VERIFICAR3
            
            CMP BL, CL
            JNZ VERIFICAR3
            
          
            MOV TERMINADO, 1
            JMP TABLERO
            
           
        VERIFICAR3:  ; VERIFICAR 7, 8, 9
            
            MOV AL, C4
            MOV BL, C5 
            MOV CL, C6
            
            CMP AL, BL
            JNZ VERIFICAR4
            
            CMP BL, CL
            JNZ VERIFICAR4 
            
            MOV TERMINADO, 1
            JMP TABLERO
            
             
       VERIFICAR4:   ; VERIFICAR 1, 4, 7
            
            MOV AL, C1
            MOV BL, C4 
            MOV CL, C7
            
            CMP AL, BL
            JNZ VERIFICAR5
            
            CMP BL, CL
            JNZ VERIFICAR5
        
            MOV TERMINADO, 1
            JMP TABLERO
        
       
       VERIFICAR5:   ; VERIFICAR 2, 5, 8
            
            MOV AL, C2
            MOV BL, C5 
            MOV CL, C8
            
            CMP AL, BL
            JNZ VERIFICAR6
            
            CMP BL, CL
            JNZ VERIFICAR6
        
            MOV TERMINADO, 1
            JMP TABLERO
            
       
       VERIFICAR6:   ; VERIFICAR 3, 6, 9
            
            MOV AL, C3
            MOV BL, C6 
            MOV CL, C9
            
            CMP AL, BL
            JNZ VERIFICAR7
            
            CMP BL, CL
            JNZ VERIFICAR7
        
            MOV TERMINADO, 1
            JMP TABLERO
            
        
        VERIFICAR7:   ; VERIFICAR 1, 5, 9
            
            MOV AL, C1
            MOV BL, C5 
            MOV CL, C9
            
            CMP AL, BL
            JNZ VERIFICAR8
            
            CMP BL, CL
            JNZ VERIFICAR8
        
            MOV TERMINADO, 1
            JMP TABLERO  
            
        
        VERIFICAR8:   ; VERIFICAR 3, 5, 7
            MOV AL, C3
            MOV BL, C5 
            MOV CL, C7
            
            CMP AL, BL
            JNZ VERIFICAR_EMPATE
            
            CMP BL, CL
            JNZ VERIFICAR_EMPATE
            
            MOV TERMINADO, 1
            JMP TABLERO
       
       ;SE VERIFICA SI HAY UN EMPATE EN EL TABLERO    
       VERIFICAR_EMPATE:
            
            MOV AL, MOVIMIENTOS
            CMP AL, 9
            JB CAMBIO_DE_JUGADOR  ;SI HA SIDO MENOR QUE 9
            
            MOV ES_EMPATE, 1
            JMP TABLERO
            
            JMP TERMINAR_JUEGO
                   
                   
    CAMBIO_DE_JUGADOR:
                         
        CMP JUGADOR, 49 ;COMPARA SI EL VALOR DE JUGADOR ES 49 (1)
        JZ J2 ;SI ES, VA A LA FUNCION DE J2  
        CMP JUGADOR, 50 ; COMPARA SI EL VALOR DEL JUGADOR ES 50  (2)
        JZ J1 ;SI ES, VA A LA FUNCION DE J1
        
        J1:
            MOV JUGADOR, 49  ; CAMBIA EL VALOR DE JUGADOR PARA EL JUGADOR 2
            MOV MARCADOR_ACTUAL, 88    ; CAMBIA EL  MARCADOR A 88 (X EN DECIMAL)
            JMP TABLERO ; BRINCA A LA FUNCION TABLERO
             
        J2:
            MOV JUGADOR, 50  ; CAMBIA EL VALOR DE JUGADOR PARA EL JUGADOR 1
            MOV MARCADOR_ACTUAL, 79  ;CAMBIA EL MARCADOR A 79 (O EN DECIMAL)
            JMP TABLERO ;BRINCA A LA FUNCION TABLERO
    
    
    ;ESTA FUNCION IMPRIME EL TABLERO EN PANTALLA
    TABLERO:  
    
        ;LIMPIA LA PANTALLA
        CALL LIMPIAR_PANTALLA
     
     
    ;--------SE IMPRIME LA PRIMERA FILA DEL TABLERO-------------
        
        ;POSICIONAR CURSOR
        MOV AH, 2
        MOV BH, 0
        MOV DH, 6
        MOV DL, 30
        INT 10H   
        
        ;IMPRIMIR LA PRIMERA LINEA DEL TABLERO
        LEA DX, LINEA1
        MOV AH, 9
        INT 21H 
     
        ;POSICIONAR CURSOR 
        MOV AH, 2
        MOV DH, 7
        MOV DL, 30 
        INT 10H    
        
        ;CREA UN ESPACIO
        MOV AH, 2
        MOV DL, 32
        INT 21H 
       
        ; IMPRIME LA CELDA 1
        LEA DX, C1
        MOV AH, 9
        INT 21H 
        
        ; IMPRIME EL "|"
        LEA DX, LINEA3
        MOV AH, 9
        INT 21H  
        
        
        
        ;IMPRIME LA CELDA 2   
        LEA DX, C2
        MOV AH, 9
        INT 21H  
        
        ; IMPRIME EL "|"
        LEA DX, LINEA3
        MOV AH, 9
        INT 21H
    
        ;IMPRIME LA CELDA 3
        LEA DX, C3
        MOV AH, 9
        INT 21H
    
     ;----------SE IMPRIME LA SEGUNDA FILA DEL TABLERO---------------------    
    

        ; POSICIONAR CURSOR
        MOV AH, 2
        MOV DH, 8  ;FILA
        MOV DL, 30   ;COLUMNA
        INT 10H 
     
        ;SE IMPRIME LA LINEA 2
        LEA DX, LINEA2
        MOV AH, 9
        INT 21H 
    

        ; POSICIONAR CURSOR
        MOV AH, 2
        MOV DH, 9    ;FILA
        MOV DL, 30    ;COLUMNA
        INT 10H
        ;SE IMPRIME LA LINEA 1
        LEA DX, LINEA1
        MOV AH, 9
        INT 21H 
    
        ; POSICIONAR CURSOR
        MOV AH, 2
        MOV DH, 10  ;FILA
        MOV DL, 30  ;COLUMNA
        INT 10H
        
        ;SE CREA UN ESPACIO
        MOV AH, 2
        MOV DL, 32 ;COLUMNA
        INT 21H
                                          
        ; IMPRIME LA CELDA 4 
        LEA DX, C4
        MOV AH, 9
        INT 21H              
        
        ; IMPRIME EL "|"
        LEA DX, LINEA3
        MOV AH, 9
        INT 21H
    
        ;IMPRIME LA CELDA 5
        LEA DX, C5
        MOV AH, 9
        INT 21H            
        
        ; IMPRIME EL "|"   
        LEA DX, LINEA3
        MOV AH, 9
        INT 21H
    
        ;IMPRIME LA CELDA 6    
        LEA DX, C6
        MOV AH, 9
        INT 21H  
        
   
   ;-----------------SE IMPRIME LA TERCERA FILA DEL TABLERO--------------------
   
        ;POSICIONAR CURSOR
        MOV AH, 2
        MOV DH, 11 ;FILA
        MOV DL, 30 ;COLUMNA
        INT 10H
        
        ;SE IMPRIME LA LINEA 1
        LEA DX, LINEA1
        MOV AH, 9
        INT 21H 
 
        ;POSICIONAR CURSOR
        MOV AH, 2
        MOV DH, 12  ;FILA
        MOV DL, 30  ;COLUMNA
        INT 10H 
     
        ;SE IMPRIME LA LINEA2 
        LEA DX, LINEA2
        MOV AH, 9
        INT 21H 
    

        ; POSICIONAR CURSOR
        MOV AH, 2
        MOV DH, 13 ;FILA
        MOV DL, 30 ;COLUMNA
        INT 10H
        
        ;SE IMPRIME LA LINEA1
        LEA DX, LINEA1
        MOV AH, 9
        INT 21H 
    

        ;POSICIONAR CURSOR
        MOV AH, 2
        MOV DH, 14  ;FILA
        MOV DL, 30  ;COLUMNA
        INT 10H 
        
        ;SE CREA UN ESPACIO
        MOV AH, 2                                       
        MOV DL, 32 ;COLUMNA
        INT 21H   
    
           
        ; SE IMPRIME LA CELDA 7 
    
        LEA DX, C7
        MOV AH, 9
        INT 21H 
        
        ;SE IMPRIME "|"
        
        LEA DX, LINEA3
        MOV AH, 9
        INT 21H
    
        ;SE IMPRIME LA CELDA 8
    
        LEA DX, C8
        MOV AH, 9
        INT 21H        
        
        ;SE IMPRIME "|"
        
        LEA DX, LINEA3
        MOV AH, 9
        INT 21H
    
        ;SE IMPRIME LA CELDA 9
    
        LEA DX, C9
        MOV AH, 9
        INT 21H
    
; ---------------------------------     

        ;POSICIONAR CURSOR
        MOV AH, 2
        MOV DH, 15  ;FILA
        MOV DL, 30  ;COLUMNA
        INT 10H 
     
    
        LEA DX, LINEA1
        MOV AH, 9
        INT 21H
     
        ; POSICIONAR CURSOR 
        MOV AH, 2
        MOV DH, 16 ;FILA
        MOV DL, 24 ;COLUMNA
        INT 10H
                
        CMP TERMINADO, 1   ;COMPARA SI EL VALOR DE TERMINADO ES 1
        JZ GANAR ;SI ES, SE EJECUTA LA FUNCION GANAR
    
        CMP ES_EMPATE, 1   ;COMPARA SI EL VALOR DE ES EMPATE ES 1
        JZ EMPATE ;SI ES, SE EJECUTA LA FUNCION EMPATE
  
    
    ;ESTA FUNCION SE UTILIZA PARA INGRESAR EL NUMERO DE CELDA QUE SE DESEA 
    
    ENTRADA:  
             
    ;SE IMPRIME EL JUGADOR ACTUAL
    LEA DX, JUGADOR_MSG
    MOV AH, 9               ;INTERRUPCION IMPRIME CADENA
    INT 21H     
    
    ;SE IMPRIME EL NUMERO DEL JUGADOR
    MOV AH, 2
    MOV DL, JUGADOR       ;INTERRUPCION IMPRIME UN SOLO CARACTER
    INT 21H
    
    
    CMP JUGADOR, 49 ;COMPARA SI EL VALOR DE JUGADOR ES IGUAL A 49 = (1)
    JZ JUG1 ;SI ES VERDADERO SE EJECUTA LA FUNCION JUG1 SINO CONTINUA
     
    ;SE IMPRIME EL MARCADOR 2 (O)
    LEA DX, MAR2
    MOV AH, 9
    INT 21H 
    ;SE EJECUTA LA FUNCION INGRESAR CELDA
    JMP INGRESAR_CELDA
    
        JUG1:   
            ;SE IMPRIME EL MARCADOR 1 (X)
            LEA DX, MAR1
            MOV AH, 9
            INT 21H 
         
         
    
    INGRESAR_CELDA:
        ;SE IMPRIME LA LINEA DE MARCAR LA CELDA
        LEA DX, ENTRADA_CELDA
        MOV AH, 9
        INT 21H
        
        ;SE RECIBE EL NUMERO DE LA CELDA QUE SE DESEA MARCAR DESDE EL TECLADO
        MOV AH, 1
        INT 21H  
        ;LA VARIABLE DE MOVIMIENTOS AUMENTA EN 1
        INC MOVIMIENTOS ; INCREMENTEA 1
        
        MOV BL, AL ;SE PASA EL CONTENIDO DE AL A BL
         
        SUB BL, 48 ;RESTA 48 A AL VALOR ALMACENADO EN BL, PARA OBTENER EL VALOR NUMERICO DE UN VALOR ASCII 
    
        MOV CL, MARCADOR_ACTUAL  ;MUEVE EL CONTENIDO DE MARCADOR_ACTUAL A CL
    
    
    ;VERIFICA SI SE INGRESA UN VALOR DESDE 1 A 9
    
    CMP BL, 1
    JZ  C1U 
    
    CMP BL, 2
    JZ  C2U
    
    CMP BL, 3
    JZ  C3U
    
    CMP BL, 4
    JZ  C4U
    
    CMP BL, 5
    JZ  C5U
    
    CMP BL, 6
    JZ  C6U
    
    CMP BL, 7
    JZ  C7U
    
    CMP BL, 8
    JZ  C8U
    
    CMP BL, 9
    JZ  C9U              
    
    ;---------------------------------
                                       
                                       
    ; SI LA ENTRADA ES INVALIDA
    
    DEC MOVIMIENTOS ; SE RESTA 1 A LOS MOVIMIENTOS
    
    ; POSICIONAR CURSOR 
    MOV AH, 2
    MOV DH, 16
    MOV DL, 20 
    INT 10H 
        
    LEA DX, ENTRADA_INCORRECTA  ; NOTIFICA QUE HA INGRESADO UN DATO INVALIDO
    MOV AH, 9
    INT 21H
    
    MOV AH, 7   
    INT 21H
    
    ; POSICIONAR CURSOR 
    MOV AH, 2
    MOV DH, 16
    MOV DL, 20 
    INT 10H
          
    
    ;POSICIONAR CURSOR 
    MOV AH, 2
    MOV DH, 16
    MOV DL, 20 
    INT 10H
    
    JMP ENTRADA
    
    
    CELDA_MARCADA:  
        
        ;DECREMENTAR LOS MOVIMIENTOS
        DEC MOVIMIENTOS
        
        ;POSICIONAR CURSOR 
        MOV AH, 2
        MOV DH, 16
        MOV DL, 20 
        INT 10H   
            
        LEA DX, OCUPADA ;MOSTRAR QUE LA CELDA ESTA OCUPADA
        MOV AH, 9
        INT 21H  
        
        MOV AH, 7     ; PRESIONAR UNA TECLA PARA CONTINUAR
        INT 21H 
        
        ;POSICIONAR CURSOR 
        MOV AH, 2
        MOV DH, 16
        MOV DL, 20 
        INT 10H
           
        ; POSICIONAR CURSOR 
        MOV AH, 2
        MOV DH, 16
        MOV DL, 20 
        INT 10H
        
        JMP ENTRADA
        
        

        C1U:
            CMP C1, 88  ; VERIFICAR  'X' EN LA CELDA
            JZ CELDA_MARCADA
            CMP C1, 79  ; VERIFICAR 'O' EN LA CELDA
            JZ CELDA_MARCADA 
            
            MOV C1, CL
            JMP VERIFICAR
             
        C2U:
            CMP C2, 88  ; VERIFICAR  'X' EN LA CELDA
            JZ CELDA_MARCADA
            CMP C2, 79  ; VERIFICAR 'O' EN LA CELDA
            JZ CELDA_MARCADA 
            
            MOV C2, CL
            JMP VERIFICAR
        C3U:
            CMP C3, 88  ;VERIFICAR  'X' EN LA CELDA
            JZ CELDA_MARCADA
            CMP C3, 79  ; VERIFICAR 'O' EN LA CELDA
            JZ CELDA_MARCADA 
            
            MOV C3, CL
            JMP VERIFICAR
        C4U: 
            CMP C4, 88  ;VERIFICAR  'X' EN LA CELDA
            JZ CELDA_MARCADA
            CMP C4, 79  ;VERIFICAR 'O' EN LA CELDA
            JZ CELDA_MARCADA 
            
            MOV C4, CL
            
            JMP VERIFICAR 
        C5U: 
            CMP C5, 88  ;VERIFICAR  'X' EN LA CELDA
            JZ CELDA_MARCADA
            CMP C5, 79  ;VERIFICAR 'O' EN LA CELDA
            JZ CELDA_MARCADA 
            
            MOV C5, CL
            JMP VERIFICAR
        C6U:
            CMP C6, 88  ; VERIFICAR  'X' EN LA CELDA
            JZ CELDA_MARCADA
            CMP C6, 79  ;VERIFICAR 'O' EN LA CELDA
            JZ CELDA_MARCADA 
            
            MOV C6, CL
            JMP VERIFICAR
        C7U: 
            CMP C7, 88   ;VERIFICAR  'X' EN LA CELDA
            JZ CELDA_MARCADA
            CMP C7, 79   ; VERIFICAR 'O' EN LA CELDA
            JZ CELDA_MARCADA 
            
            MOV C7, CL
            JMP VERIFICAR 
        C8U: 
            CMP C8, 88   ;VERIFICAR  'X' EN LA CELDA
            JZ CELDA_MARCADA
            CMP C8, 79   ; VERIFICAR 'O' EN LA CELDA
            JZ CELDA_MARCADA 
            
            MOV C8, CL
            JMP VERIFICAR
        C9U:
            CMP C9, 88   ; VERIFICAR  'X' EN LA CELDA
            JZ CELDA_MARCADA
            CMP C9, 79   ; VERIFICAR 'O' EN LA CELDA
            JZ CELDA_MARCADA 
            
            MOV C9, CL
            JMP VERIFICAR
                       

    

    ;FUNCION QUE DA EL FIN AL PROGRAMA
    TERMINAR_JUEGO:
    MOV AH, 4CH
    INT 21H 
       
;FUNCION QUE LIMPIA LA PANTALLA   
LIMPIAR_PANTALLA:

    MOV AX,0600H 
    MOV BH,07H 
    MOV CX,0000H 
    MOV DX,184FH 
    INT 10H   
    
    RET       

MAIN ENDP
END MAIN