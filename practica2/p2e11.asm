PIC	EQU 20H
F10	EQU 10
	
	ORG 40
DIR_F10	DW RUT_F10

	ORG 1000H
LETRA 	DB 41H


	ORG 3000H
RUT_F10:PUSH AX
	PUSH BX
	MOV LETRA, AH
	MOV BX, OFFSET LETRA
	MOV AL, 1
	INT 7
	MOV AL, 20H
	OUT PIC, AL
	POP BX
	POP AX
	IRET

	ORG 2000H
	CLI
	MOV AL, 11111110B
	OUT PIC+1,AL
	MOV AL, F10
	OUT PIC+4,AL
	STI
	MOV AH, LETRA
LOOP:	CMP AH, 5BH
	JNZ SIG
	MOV AH, 41H
	JMP LOOP
SIG:	INC AH
	JMP LOOP
	HLT
	END
