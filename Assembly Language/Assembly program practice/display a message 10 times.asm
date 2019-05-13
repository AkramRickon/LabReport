.model small 
.stack 
.data 
A db "Welcome to assembly language programming", 0dh, 0ah, "$" 
.code 
Main proc 
	Mov ax, @data 
	Mov ds, ax 
	Mov bx, 10 
Sm: 
	Lea dx, a 
	Mov ah, 09h 
	Int 21h
	Inc dl 
	Dec bx 
	Jnz sm 
	Mov ah, 4ch 
	Int 21h 
Main endp 
End main
