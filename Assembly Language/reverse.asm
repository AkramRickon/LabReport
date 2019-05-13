.model small
.stack 100h
.data
    msg1 DB "Enter string :$"
    msg2 DB 0dh,0ah,"Reverse string :$"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,09
    int 21h
    
    mov cx,00
    mov ah,01h
    int 21h
pushin:
       cmp al,0dh
       JE end
       push ax
       inc cx
       int 21h
       JMP pushin
end:
        lea dx,msg2
        mov ah,09
        int 21h
        
        mov ah,02h
popout:
       pop dx
       int 21h
       loop popout
end main
main endp     