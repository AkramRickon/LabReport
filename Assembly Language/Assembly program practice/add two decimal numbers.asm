.model small 
.stack 
.data 
    val1 db 89 
    val2 db 10 
    msg db 'Sum of 2 number: $'
.code 

main proc 
    mov ax, @data 
    mov ds,ax 
    mov ax,0 
    mov al,val1 
    add al,val2 
    aam 
    add ax,3030h 
    push ax 
    lea dx,msg 
    
    mov ah,09h 
    int 21h 
    pop ax 
    mov dl,ah 
    mov dh,al 
    mov ah,02h 
    int 21h 
    mov dl,dh 
    mov ah,02h 
    int 21h 
    mov ax,4c00h 
    int 21h

main endp
end main
