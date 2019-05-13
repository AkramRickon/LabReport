;Write an assembly language program to Compute 
;?_(i=1)^n?(x_i  y_i )  

 
.model small
.stack 100h

print macro msg
		lea dx, msg 
		mov ah, 09h 
		int 21h
endm

.data
		msg1 db "Result = $" 
		X db 2, 3, 4
		Y db 3, 2, 4
		S dw ? 
.code
main proc
		mov ax, @data 
		mov ds, ax
		mov cx, 3 ; loop count 3 times
		lea si, X ; assign address of x to si 
		lea di, y ; assign address of y to di
	A1: 
		mov al, [si] ; value of si is placed into al 
		mov bl, [di] ; value of di is placed into 	bl
 		mul bl
		add S, ax

		mov ax, 0000h 
		add si, 1
		add di, 1 
		loop A1

	print msg1 
	mov ax, s 
	call int2asc 
	mov ah, 4ch 
	int 21h 
main endp

int2asc proc 
		mov cx, 00 
		mov bx, 0ah ; 0ah = 10 
	rpt: 
		mov dx, 00h 
		div bx 
		add dl, 30h 
		inc cx 
		push dx 
		cmp ax, 0ah 
		jge rpt

	add al, 30h 
	inc cx 
	push ax 
	mov ah, 02h

	print_loop: 
		pop dx 
		int 21h 
		loop print_loop

	ret ; return to main function 
int2asc endp 
end main

