
 ;convert an uppercase letter to a lowercase letter

.model small
.stack
.data
 	msg1 db 0dh, 0ah, "Enter an uppercase letter: $" 
	msg2 db 0dh, 0ah, "The output is lowercase letter: $" 
.code 

 main proc 
	mov ax, @data 
	mov ds, ax 

	lea dx, msg1  
	mov ah, 09h 
	int 21h 

	mov ah, 01h 
	int 21h 
	add al, 20h 
	mov bl, al 

	lea dx, msg2 
	mov ah, 09h 
	int 21h 

	
	mov ah, 02h
	mov dl, bl  
	int 21h 
 
main endp 
end main
