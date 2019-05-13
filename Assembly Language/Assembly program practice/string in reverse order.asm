;display the string in reverse order  
.model small
.stack 100h 
.data
	msg2 db , "Enter a string: $"	
	msg3 db 0dh, 0ah, "Reverse string is: $" 
.code 
main proc 
		mov ax, @data 
		mov ds, ax
		 
        lea dx, msg2
        mov ah, 9
        int 21h
         
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
        lea dx, msg3
        mov ah, 9
        int 21h
	    mov ah, 02h
	top: 
		pop dx 
		int 21h 
		loop top

main endp 
end main

