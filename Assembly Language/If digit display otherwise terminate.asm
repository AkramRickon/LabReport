.model small
.data 
msg db 10,13,"Wrong $"
.code 
main proc    
    mov ah,01h
    int 21h
    
    cmp al,30h
    jl exit
    cmp al,39h
    ja exit
    jmp display
    
exit:
    mov ax,@data
    mov ds,ax
    
    lea dx,msg
    mov ah,09h
    int 21h
    
    mov ah,4ch
    int 21h
    
display: 
        mov ah,02
        mov dl,al
        int 21h
        main endp
end main 