;intercambia los valores (8 bits) de los registros AL y BL, al finalizar
;el programa AL=54 Y BL=10	

	ORG 2000H
MOV AL, 10
MOV BL, 54
XOR AL,BL
XOR BL,AL
XOR AL,BL
HLT 
END
