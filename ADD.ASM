;addition of two 8 bit numbers


.model small

.data

a1 db 10h
a2 db 05h
s db 00h

.code

mov ax,@data
mov ds,ax
mov al,a1
mov bl,a2
add al,bl
aam
add ax,3030h
mov bx,ax
mov dl,bh
mov ah,02
int 21h

mov dl,bl
mov ah,02
int 21h

mov ah,4ch
int 21h
end
