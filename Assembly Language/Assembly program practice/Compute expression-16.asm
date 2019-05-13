.model small
.stack 100

print macro msg
		lea dx, msg 
		mov ah, 09h 
		int 21h 
endm

.data
		msg1 db " result = $" 
x db 6, 3, 2 
y db 4, 7, 5 
z db 7, 8, 10 
s dw ? 

.code 
main proc 
		mov ax, @data 
		mov ds, ax 
		mov cx, 3 
		mov bx, 0000h 
		mov si, 0000h 
	a1: 
		mov al, x [bx] 
		mul y [bx] 
		mov dl, z [bx] 
		mov dh, 0 
		add ax, dx 
		add s, ax 
		mov ax, 0 
		inc bx 
	loop a1 
	mov ax, s 
	push ax 
	print msg1 
	pop ax
	call int2asc 
	mov ah, 4ch 
	int 21h 
main endp

int2asc proc 
		push ax 
		push bx 
		push cx 
		push dx
		mov cx, 0000h 
		mov bx, 0ah
	rpt: 
		mov dx, 00h 
		div bx 
		add dl, '0' 
		inc cx 
		push dx 
		cmp ax, 0ah 
		jge rpt 
		add al, '0' 
		inc cx 
		push ax 
	
	print2: 
		pop dx
		mov ah, 02h 
		int 21h 
		loop print2 
		pop dx 
		pop cx 
		pop bx 
		pop ax
		ret ; return to main 
int2asc endp 
end main
