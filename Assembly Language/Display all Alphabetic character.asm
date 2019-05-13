stack segment
stack ends

data segment
data ends

code segment
assume cs:code, ds:data, ss:stack

  mov ah,02h   
  mov cx,26    
  mov dl,41h   

lop:
  int 21h
  inc dl    
  loop lop

  mov dl,0ah
  mov ah,02h   
  int 21h

  mov dl,0dh
  mov ah,02h   
  int 21h

  mov ah,02h   
  mov cx,26    
  mov dl,'a'   

lop1:
  int 21h
  inc dl 
  loop lop1

  mov ah,4ch
  int 21h

code ends

END
