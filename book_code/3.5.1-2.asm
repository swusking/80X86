;将十六进制数转化为ASCII码
;0~f转化为对应的ASCII码
;0-9: 30H~39H
;A-F: 41H~46H

DSEG SEGMENT
        DATA	DB	4 ;十六进制数
        ASCII	DB	? ;ASCII码
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
        
        MOV AL, DATA
        AND AL, 0FH	;保证DATA为0~F
        
        ADD AL, 30H ;判断之前先加上去，就不用后来跳转两次
        CMP DATA, 39H
        JB EXIT		
        ADD AL, 7H
        
EXIT:
        MOV ASCII, AL
        
        MOV AX, 4C00H
        INT 21H

CSEG ENDS
END START
