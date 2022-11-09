	ORG 1000H
MSJ 	DB "INGRESE UN NUMERO:"
FIN 	DB ?
MSJ2	DB "CARACTER NO VALIDO"
FIN2	DB ?

	ORG 1500H
NUM 	DB ?

	ORG 3000H
ES_NUM:	MOV CH,00H
	MOV AL,39H
	CMP AL,[BX]
	JS NO_VALIDO 		;SI EL CARACTER ES >39H(39H-CAR DA NEGATIVO) NO ES UN NUMERO
	MOV AL, 30H
	CMP AL,[BX] 		
	JZ VALIDO		;SI EL CARACTER ES =30H ES EL CERO(NUMERO VALIDO)
	JNS NO_VALIDO		;SI EL CARACTER ES >30H Y (30H-CAR DA NEGATIVO) NO ES UN NUMERO
VALIDO:	MOV CH,0FFH
NO_VALIDO:RET


	ORG 2000H
	MOV BX, OFFSET MSJ
	MOV AL, OFFSET FIN-OFFSET MSJ
	INT 7
	MOV BX, OFFSET NUM
	INT 6
	MOV AL, 1
	INT 7
	CALL ES_NUM
	CMP CH,0FFH
	JZ FINAL			;SI EL CARACTER ES UN NUMERO NO MOSTRAR NADA
	MOV BX, OFFSET MSJ2
	MOV AL, OFFSET FIN2-OFFSET MSJ2
	INT 7 				;SI EL CARACTER NO ES UN NUMERO IMPRIMIR EL MENSAJE
FINAL:	INT 0
	END
