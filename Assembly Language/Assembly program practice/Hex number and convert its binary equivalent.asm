;Write an assembly language program to read a Hex number and convert its binary equivalent. 

 
.model small
.stack

print macro msg 
		lea dx, msg 
		mov ah, 09h 
		int 21h
	endm
.data
		msg1 db 0dh, 0ah, "Enter two digit Hex no: $" 
		msg2 db 0dh, 0ah, "The binary Number is: $"
.code 
main proc
		mov ax, @data 
		mov ds, ax

		print msg1 

		xor bx, bx ; clear BX 
		mov cl, 4 ; counter for 4 shifts 
		mov ah, 01h ; input character function 
		int 21h ; input a character 
	while_: 
		cmp al, 0dh ; charcter? 
		je end_while ; yes, exit 
		cmp al, 39h ; a digit? 
		jg letter ; no, a letter
		jmp shift ; go to insert in BX 
	letter: 
		sub al, 37h ; convert letter to binary value 
	shift: 
		shl bl, cl ; make room for new value 
		and al, 0fh 
		or bl, al ; put value into low 4 bits of BX 
		int 21h ; input a character 
		jmp while_ ; loop until character 

	end_while: 
		print msg2 
		mov ah, bl 
		mov cx, 8
	L1: 
		shl ah, 1 
		mov dl, '0' 
		jnc L2 
		mov dl, '1' 
	L2: 
		push ax 
		mov ah, 2 
		int 21h 
		pop ax 
		loop L1

		mov ah, 4ch 
		int 21h 
main endp
end main

