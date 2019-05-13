
;find the smallest element from an array 

.model small
.stack
.data
	msg1 db 0dh, 0ah, "Smallest element is: $" 
	array db 5, 9, 7, 2, 3 
	smallest db ? 
.code

main proc
	mov ax, @data 
	mov ds, ax 
	lea di, array 

	mov cx, 5 ; 5 times count 
	mov al, [di]	; memory location send 'di' register ar data 'al' 
	mov smallest, al 

	step: 	;level 
		inc di 
		mov bl, [di] 

		cmp smallest, bl
		jle l1	; jge = jump grather than equal , 

		mov smallest, bl 
	l1: 
		loop step 
		add smallest, 30h ; integer to character (add 30 for asii value) 

		lea dx, msg1 
        mov ah, 09h 
		int 21h 

		mov dl, smallest 
		mov ah, 02h
		int 21h 
 
main endp
end main

