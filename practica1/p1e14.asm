	ORG 1000H
CAD	DB "ABECEDARIO"
FIN_CAD	DB ?
CANT	DB ?
	
	ORG 3000H
ES_VOCAL:MOV AH, 0FFH
	CMP AL, 41H ;A
	JZ FIN
	CMP AL,45H ;E
	JZ FIN
	CMP AL,49H ;I
	JZ FIN
	CMP AL,4FH ;O
	JZ FIN 
	CMP AL,55H ;U
	JZ FIN
	MOV AH,00H
FIN:	RET

	ORG 4000H
VOCALES:MOV CL, OFFSET FIN_CAD-OFFSET CAD
	MOV CH,0 ;CH=CANT DE VOCALES
LAZO:	CMP CL,0 ;CL=CANT DE CARACTERES DE LA CADENA
	JZ TERMINA
	MOV AL,[BX]
	CALL ES_VOCAL
	CMP AH, 00H ;AH= FFH SI ES VOCAL, 00H SI NO ES VOCAL
	JZ SIG
	INC CH
SIG:	INC BX
	DEC CL
	JMP LAZO
TERMINA:RET

	ORG 2000H
	MOV BX, OFFSET CAD
	CALL VOCALES
	MOV CANT, CH
	HLT
	END
	
	
	