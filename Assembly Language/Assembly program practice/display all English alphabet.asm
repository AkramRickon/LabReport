

;display all alphabet characters 

.model small 
.stack 
.data
    message db "All alphabet: $"
.code 

main proc   
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 9 
    lea dx, message
    int 21h 
    
    
    mov dl, 10  
    mov ah, 2
    int 21h
    mov dl, 13  
    mov ah, 2
    int 21h
    
    
	mov cx, 26 
	mov ah, 02h 
	mov dl, 'A' 

	L1: 
		int 21h 
		inc dl 
		loop L1 

	main endp 
end main
