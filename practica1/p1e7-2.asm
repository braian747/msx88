;  Multiplicación de números sin signo, llamando a una subrutina MUL para efectuar la operación, 
;  pasando los parámetros por valor desde el programa principal a través de registros
	ORG 1000H
NUM1 	DB 5H
NUM2 	DB 3H

	ORG 3000H ; Subrutina MUL: recibe los parametros en AL y CL y devuelve el resultado en DX
MUL:	CMP AL, 0
	JZ FIN
	CMP CL, 0
	JZ FIN
	MOV DX, 0 ; inicializa DX en 0 para ir almacenando el resultado de la suma parcial
LAZO:	ADD DX, AX
	DEC CX
	JNZ LAZO
FIN:	RET

	ORG 2000H ; Programa principal
	MOV AL, NUM1
	MOV CL, NUM2
	MOV AH, 0
	CALL MUL
	HLT
	END


