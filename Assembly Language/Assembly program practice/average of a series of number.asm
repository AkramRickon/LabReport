
;calculate the average of a series of number

.model small
.data  
		msg1 db 0ah, 0dh, "Enter how many no u want: $" 	
		msg2 db 0ah, 0dh, "Enter no: $" 
		msg3 db 0ah, 0dh, "Average: $" 
		val1 db ? 
.code
main proc 
		mov ax, @data 
		mov ds,ax

		lea dx, msg1 
		mov ah, 09h 
		int 21h 

		mov ah, 01h 
		int 21h 
		sub al, 30h 

		mov cl, al 
		mov bl, al 
		mov al, 00 
		mov val1, al 

	lbl1:
 		lea dx, msg2 
		mov ah, 09h 
		int 21h 

		mov ah, 01h 
		int 21h 
		sub al, 30h 

		add al, val1 

		mov val1, al 

		loop lbl1 
	lbl2: 
		lea dx, msg3 
		mov ah, 09h 
		int 21h

		mov ax, 00 
		mov al, val1 
		div bl 
		add ax, 3030h 
		mov dx, ax 
		mov ah, 02h 
		int 21h 

		 
main endp 
end main

