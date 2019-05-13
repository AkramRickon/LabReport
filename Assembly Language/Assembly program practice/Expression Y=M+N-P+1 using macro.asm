
; calculate the following expression	
; Y = M + N - P + 1


print macro msg
		lea dx, msg 
		mov ah, 09h 
		int 21h 
	endm 

.model small
.stack 100h 
.data
    msg  db 0dh, 0ah, "Calculate ExpressionY = M + N - P + 1= $"
	msg1 db 0dh, 0ah, "M = $" 
	msg2 db 0dh, 0ah, "N = $"	
	msg3 db 0dh, 0ah, "P = $"
	msg4 db 0dh, 0ah, "Y = M + N - P + 1= $"
	 
.code 

main proc 
		mov ax, @data 
		mov ds, ax 
		
		print msg 
		mov ah, 09h 
		int 21h

		print msg1 
		mov ah, 01h 
		int 21h   
        
        sub al,30h
        push ax
        
        print msg2
        mov ah, 01h 
		int 21h
		  
		sub al,30h
		push ax
		
		print msg3 
		mov ah, 01h 
		int 21h
		   
		sub al,30h
		
		push ax
		pop cx
		pop ax
		pop ax
		
		mov ah,00
		
		add al,bl
		sub al,cl
		add al,cl
		      
		push ax
		
		print msg4
		
		pop ax
		mov dl,al
		add dl,30h
		mov ah,02h
		int 21h
		mov ah,4ch
		int 21h
		
endp		
		
        
		
        
	