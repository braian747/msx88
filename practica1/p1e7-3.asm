;  Multiplicación de números sin signo, llamando a una subrutina MUL, pasando
;  los parámetros por referencia desde el programa principal a través de registros
	ORG 1000H
NUM1 	DB 5H
NUM2 	DB 3H

	ORG 3000H ; Subrutina MUL: recibe la referencia de los parametros en AX y CX, y devuelve el resultado en DX
MUL: 	MOV BX, AX 
	ADD DX, [BX]
	PUSH DX 
	MOV BX, CX 
	MOV DX, [BX] 
	DEC DX 
	MOV [BX], DX
	POP DX
	JNZ MUL
	RET

	ORG 2000H ; Programa principal
	MOV AX, OFFSET NUM1
  	MOV CX, OFFSET NUM2
	MOV DX, 0
	CALL MUL
	HLT
	END
