;ASCII码转化为十六进制


DSEG SEGMENT
	DATA	DB	? ;十六进制数
	ASCII	DB	'a' ;ASCII码
DSEG ENDS


SSEG SEGMENT STACK

SSEG ENDS

CSEG SEGMENT
	ASSUME CS:CSEG, DS:DSEG, SS:SSEG
START:
	MOV AX, DSEG
	MOV DS, AX 
	
	MOV AX, SSEG
	MOV SS, AX 
	
	MOV AL, ASCII 
	OR	AL,	20H		;将大写变小写，因为数字的第六位一直是1，所以0~9没有变化
					;用AH存放结果，AL存放原数值
	CMP AL, '0'
	JB	ERR
	MOV AH, AL
	SUB AH, '0'		;先减，小于直接结束程序
	CMP AL, '9'
	JBE	EXIT
	
	CMP AL, 'a'
	JB	ERR
	MOV AH, AL
	SUB AH,	'a'-10
	CMP AL, 'f'
	JBE	EXIT
	
ERR:	
	MOV AH, -1
EXIT:
	MOV DATA, AH
	
	MOV AX, 4C00H
	INT 21H

CSEG ENDS
END START