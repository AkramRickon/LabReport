.model small
.stack
.data
	A db 0dh, 0ah, "ENTER an INPUT...", 0dh, 0ah, "$" 
	B db 0dh, 0ah, "The OUTPUT is...", 0dh, 0ah, "$" 
.code 
 main proc 
	mov ax, @data 
	mov ds, ax 

	lea dx, a 
	mov ah, 09h 
	int 21h 

	mov ah, 01h 
	int 21h 
	sub al, 20h 
	mov bl, al 

	lea dx, B 
	mov ah, 09h 
	int 21h 

	mov dl, bl 
	mov ah, 02h 
	int 21h 

	mov ah, 4ch 
	int 21h 
main endp 
end main
 
