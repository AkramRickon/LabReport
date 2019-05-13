  
;add two decimal numbers   

.model small 
.stack 100h  
.data 
    msg db "Add two decimal numbers $"
    msg1 db 0ah, 0dh, "Enter first number: $"
    msg2 db 0ah, 0dh, "Enter second number: $"
    msg3 db 10, 13, "Sum: $"
    val1 db ? 
    val2 db ?
    val3 db ? 
.code 

main proc 
             
     mov ax, @data
     mov ds, ax
     
     lea dx, msg1
     mov ah, 9
     int 21h
      
     mov ah, 1
     int 21h 
     sub al, 30h
     mov val1, al
     
    
     lea dx, msg2
     mov ah, 9
     int 21h
     
     
     mov ah, 1
     int 21h  
     sub al, 30h
     mov val2, al
     
     add al, val1  
     mov ah, 0
     aam 
     
     add al, 30h
     add ah, 30h
     
     mov bx, ax
      
    
     lea dx, msg3
     mov ah, 9
     int 21h
                 
     mov ah,2
     mov dl, bh
     int 21h            
     
     mov ah, 2
     mov dl,bl
     int 21h

main endp
end main
