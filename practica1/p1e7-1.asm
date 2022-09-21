;  Multiplicación de números sin signo, sin hacer llamados a subrutinas, resolviendo el problema desde el programa principal
	ORG 1000H
NUM1 	DB 5H
NUM2 	DB 3H

	ORG 2000H
	MOV DX, 0 ; en DX se almacenara el resultado final
	MOV AH, 0 ; AH se inicializa en 0 para que no tenga basura, ya que se trabajara con el registro completo AX
	MOV AL, NUM1
	CMP AL, 0 
	JZ FIN ; ; si NUM1 (AL) es 0 la multiplicacion es 0
	MOV CL, NUM2 
LOOP:	CMP CL, 0 
	JZ FIN ; si NUM2(CL) es 0 la multiplicacion es 0, caso contrario el programa terminara cuando NUM2=0
	ADD DX, AX ; se realiza la suma de NUM1 (AX) y se guarda en DX 
	DEC CL 
	JMP LOOP ; el bucle se repite tantas veces segun el valor de NUM2 (CL)
FIN:	HLT
	END


