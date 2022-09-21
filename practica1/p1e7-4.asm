;  Multiplicaci�n de n�meros sin signo, llamando a una subrutina MUL, pasando los par�metros NUM1 Y NUM2 por valor, y RES por referencia a trav�s de la pila.
	ORG 1000H
NUM1 	DW 5H
NUM2 	DW 3H
RES 	DW ?

	; Subrutina MUL
	ORG 3000H
MUL:	PUSH BX
	MOV BX, SP
	PUSH CX
	PUSH AX
	PUSH DX
	ADD BX, 6
	MOV CX, [BX]
	ADD BX, 2
	MOV AX, [BX]
SUMA:	ADD DX, AX
	DEC CX
	JNZ SUMA
	SUB BX, 4
	MOV AX, [BX]
	MOV BX, AX
	MOV [BX], DX
	POP DX
	POP AX
	POP CX
	POP BX
	RET

	; Programa principal
	ORG 2000H
	MOV AX, NUM1
	PUSH AX
	MOV AX, NUM2
	PUSH AX
	MOV AX, OFFSET RES
	PUSH AX
	MOV DX, 0
	CALL MUL
	POP AX
	POP AX
 	POP AX
 	HLT
	END
