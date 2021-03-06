PRINTSTRING MACRO MSG
MOV AH,09H
LEA DX,OFFSET MSG
INT 21H
ENDM

.MODEL SMALL

.DATA

M1 DB 'ENTER FILENAME TO BE CREATED ','$'
M2 DB 'ENTER FILENAME TO BE DELETED ','$'
M3 DB 10,13,'FILE NOT FOUND','$'

FILENAME DB 80 DUP(0)
FILENAME1 DB 80 DUP(0)

.CODE

MOV AX,@DATA
MOV DS,AX
PRINTSTRING M1
MOV SI,OFFSET FILENAME1

RD:
MOV AH,01H
INT 21H
CMP AL,0DH
JE SKIP2
MOV [SI],AL
INC SI
JMP RD

SKIP2:

MOV AH,3CH
MOV CX,00
MOV DX,OFFSET FILENAME1
INT 21H
PRINTSTRING M2
MOV SI,OFFSET FILENAME

RD1:
MOV AH,01H
INT 21H
CMP AL,0DH
JE SKIP1
MOV [SI],AL
INC SI
JMP RD1

SKIP1:
MOV AH,41H
mov dx,offset filename
INT 21H
JNC SUCC
PRINTSTRING M3

SUCC:
MOV AH,4CH
INT 21H
END
