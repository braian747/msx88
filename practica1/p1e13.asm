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