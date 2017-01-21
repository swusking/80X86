;三个数排序，从大到小

DSEG SEGMENT
	BUFFER DB 87, 234, 123
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
	
	MOV AL, BUFFER
	CMP AL, BUFFER+1
	JA	NEXT1
	XCHG AL, BUFFER+1 
	
NEXT1:
	CMP AL, BUFFER+2
	JA NEXT2
	XCHG AL, BUFFER+2
	
NEXT2:
	MOV BUFFER, AL

	MOV AL, BUFFER+1
	CMP AL, BUFFER+2
	JA	NEXT3
	XCHG AL, BUFFER+2
	
NEXT3:
	MOV BUFFER+1, AL
	
	MOV AX, 4C00H
	INT 21H

CSEG ENDS
END START