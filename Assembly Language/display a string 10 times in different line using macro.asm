
;display a string 10 times in different line using macro
    
.model small 
print macro msg 
    lea dx, msg 
    mov ah, 09h 
    int 21h 
    endm 

.data 
    message db 0dh, 0ah, "Model Institute of Science & Technology (MIST) $" 
.code 
main proc  
    mov ax, @data 
    mov ds, ax 
    mov cx, 10 
    
    loop1: 
    dec cx 
    cmp cx, 00  
    print message
    
    ja loop1 
    Jmp exit
    
    exit: 
    mov ah,4ch 
    int 21h 
    main endp 
end main 
