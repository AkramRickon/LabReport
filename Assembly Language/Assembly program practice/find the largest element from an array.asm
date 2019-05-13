.model small
.stack
.data 
	msg1 db 0dh, 0ah, "largest element is: $" 
	array db 5, 9, 6, 7, 1, 3 
	largest db ?  
.code 
 
main proc 
	mov ax, @data 
	mov ds, ax 
	lea di, array 

	mov cx, 5 
	mov al, [di] ; memory location 
	mov largest, al 

	step: 
		inc di 
		mov bl, [di] 

		cmp largest, bl 
		jge l1 
	
		mov largest, bl 
	l1: 
		loop step 
		add largest, 30h 

		lea dx, msg1 
		mov ah, 09h 

		int 21h 

		mov dl, largest 
		mov ah, 02h 

		int 21h 

		mov ah, 4ch 
		int 21h 
main endp
end main
