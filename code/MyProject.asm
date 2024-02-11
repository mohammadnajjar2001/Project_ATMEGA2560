
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;MyProject.c,100 :: 		void main()
;MyProject.c,102 :: 		DDRA = 255;
	LDI        R27, 255
	OUT        DDRA+0, R27
;MyProject.c,103 :: 		DDRC = 255;
	LDI        R27, 255
	OUT        DDRC+0, R27
;MyProject.c,104 :: 		while (1)
L_main0:
;MyProject.c,106 :: 		for (c = 0; c < 8; c++)
	LDI        R27, 0
	STS        _c+0, R27
L_main2:
	LDS        R16, _c+0
	CPI        R16, 8
	BRLT       L__main9
	JMP        L_main3
L__main9:
;MyProject.c,108 :: 		PORTC = column[c];
	LDI        R17, #lo_addr(_column+0)
	LDI        R18, hi_addr(_column+0)
	LDS        R16, _c+0
	MOV        R30, R16
	LDI        R31, 0
	SBRC       R16, 7
	LDI        R31, 255
	ADD        R30, R17
	ADC        R31, R18
	LD         R16, Z
	OUT        PORTC+0, R16
;MyProject.c,109 :: 		PORTA = mohammed[EightStepInRowsArray + c];
	LDS        R17, _EightStepInRowsArray+0
	LDS        R16, _c+0
	MOV        R18, R17
	ADD        R18, R16
	LDI        R19, 0
	SBRC       R17, 7
	LDI        R19, 255
	LDI        R27, 0
	SBRC       R16, 7
	LDI        R27, 255
	ADC        R19, R27
	LDI        R16, #lo_addr(_mohammed+0)
	LDI        R17, hi_addr(_mohammed+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	OUT        PORTA+0, R16
;MyProject.c,110 :: 		delay_ms(1);
	LDI        R17, 2
	LDI        R16, 75
L_main5:
	DEC        R16
	BRNE       L_main5
	DEC        R17
	BRNE       L_main5
	NOP
	NOP
;MyProject.c,106 :: 		for (c = 0; c < 8; c++)
	LDS        R16, _c+0
	SUBI       R16, 255
	STS        _c+0, R16
;MyProject.c,111 :: 		}
	JMP        L_main2
L_main3:
;MyProject.c,112 :: 		Repeat_cycles++;
	LDS        R16, _Repeat_cycles+0
	LDS        R17, _Repeat_cycles+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _Repeat_cycles+0, R16
	STS        _Repeat_cycles+1, R17
;MyProject.c,113 :: 		if (Repeat_cycles == 200)
	CPI        R17, 0
	BRNE       L__main10
	CPI        R16, 200
L__main10:
	BREQ       L__main11
	JMP        L_main7
L__main11:
;MyProject.c,115 :: 		Repeat_cycles = 0;
	LDI        R27, 0
	STS        _Repeat_cycles+0, R27
	STS        _Repeat_cycles+1, R27
;MyProject.c,116 :: 		EightStepInRowsArray = (EightStepInRowsArray + 8) % 64;
	LDS        R16, _EightStepInRowsArray+0
	LDI        R17, 0
	SBRC       R16, 7
	LDI        R17, 255
	SUBI       R16, 248
	SBCI       R17, 255
	LDI        R20, 64
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _EightStepInRowsArray+0, R16
;MyProject.c,117 :: 		}
L_main7:
;MyProject.c,118 :: 		}
	JMP        L_main0
;MyProject.c,120 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
