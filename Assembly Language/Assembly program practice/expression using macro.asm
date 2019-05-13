
;Write an assembly language program to calculate the following expression using macro
;(M - N) ? P if X > Y 
;M / N + P if X <= Y 

.model small
.stack

print macro msg 
		lea dx, msg 
		mov ah, 09h 
		int 21h 
endm ; end of macro 

.data 
		msg1 db 0dh, 0ah, "M = $" 
		msg2 db 0dh, 0ah, "N = $" 
		msg3 db 0dh, 0ah, "P = $" 
		msg4 db 0dh, 0ah, "X = $" 
		msg5 db 0dh, 0ah, "Y = $"
		msg6 db 0dh, 0ah, "Z = (M - N)P = $"	; if x > y 
		msg7 db 0dh, 0ah, "Z = (M / N) + P = $" ; if x <= y
.code
main proc
		mov ax, @data 
		mov ds, ax

		print msg1 
		mov ah, 01h 
		int 21h 
		sub al, 30h 
		push ax

		print msg2 
		mov ah, 01h 
		int 21h 
		sub al, 30h 
		push ax

		print msg3 
		mov ah, 01h 
		int 21h 
		sub al, 30h 
		push ax 

		print msg4 
		mov ah, 01h 
		int 21h 
		sub al, 30h 
		mov bl, al

		print msg5 
		mov ah, 01h 
		int 21h 
		sub al, 30h 
		cmp bl, al 
		jle step1 

		pop cx 
		pop bx 
		pop ax

		sub al, bl 
		mul cl 
		jmp step3
	step1:
 		pop cx 
		pop bx 
		pop ax 
		mov ah, 00 
		div bl 
		add al, cl
	step2:
 		push ax 
		print msg7 
		pop ax

		mov dl, al 
		add dl, 30h 
		mov ah, 02h 
		int 21h 
		jmp L4 
	step3: 
		push ax 
		print msg6

		pop ax 
		mov dl, al
		add dl, 30h 
		mov ah, 02h 
		int 21h 
	L4: 
		mov ah, 4ch 
		int 21h
main endp 
end main 
