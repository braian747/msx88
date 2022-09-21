	ORG 2000H ; se omite la declaracion de variables en memoria y la carga de los mismos 
		  ; en los registros ya que se cargan desde el msx88 
	CMP AL,BL
	JS THEN   ; implementa la condicion "IF A<B"
		  ;JZ THEN: Agregando esta condicion se implementa la condicion "IF A<=B", 
		  ;si se la incluye de manera individual se implementa la condicion "IF A=B" 
ELSE:	MOV CL,BL
	JMP FIN
THEN:	MOV CL,AL
FIN:	HLT
	END
