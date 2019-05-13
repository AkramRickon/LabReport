.model small
.data 
array db 2,3,5,1,9
.code
main proc
    mov ax,@data 
    mov ds,ax
    
    mov cx,5
    mov DI,0
    mov al,1
    
compare: 
        cmp al,array[DI]
        JL next 
        mov al,array[DI]
next:
    inc DI
    loop compare 
    
    mov ah,02
    add al,30h
    mov dl,al
    int 21h
    
    end main
main endp        
           