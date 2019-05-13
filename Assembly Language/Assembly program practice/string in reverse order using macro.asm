
;display the string in reverse order using macro 

print macro msg
		lea dx, msg 
		mov ah, 09h 
		int 21h 
	endm 

.model small
.stack 100h 
.data
	msg1 db 0dh, 0ah, "String reverse program $" 
	msg2 db 0dh, 0ah, "Enter a string: $"	
	msg3 db 0dh, 0ah, "Reverse string is: $" 
.code 

main proc 
		mov ax, @data 
		mov ds, ax 

		print msg1 
		print msg2 

		mov cx, 00 
		mov ah, 01h 
		int 21h 

	again: 
		cmp al, 0dh 
		je end_again

		push ax 
		inc cx 
		int 21h 
		jmp again
	end_again: 
 		print msg3 
		mov ah, 02h
	top: 
		pop dx 
		int 21h 
		loop top

	mov ah, 4ch 
	int 21h
main endp 
end main

