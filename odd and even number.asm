
;number is odd or even

.model small 
.stack 100h
.data  
    
    msg1 db 0dh, 0ah, "Enter the number: $" 
    msg2 db 0dh, 0ah, "It is an even number. $" 
    msg3 db 0dh, 0ah, "It is an odd number. $" 
.code
main proc 
	    mov ax, @data 
	    mov ds, ax
	 
    	mov ah, 9
        lea dx, msg1
        int 21h 

	    mov ah, 01h 
	    int 21h 
	    sub al, 30h 

	    mov bl, 02 
	    div bl 
	    cmp ah, 00 
	    jz s2

        mov ah, 9
        lea dx, msg3
        int 21h
        jmp l4 
	
	s2:
       mov ah, 9
       lea dx, msg2
       int 21h

	l4:
	   mov ah, 4ch 
	   int 21h
main endp 
end main
