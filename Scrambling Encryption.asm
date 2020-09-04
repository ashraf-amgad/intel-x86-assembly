 
include emu8086.inc
org 100h

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                        
print "please enter your plain_text length (4,8,16,32....):-> "  
    
call scan_num          ; scan_num is a function which take number from user and store it in cx

mov j,cl
mov dx,0               ; j is plain text length

mov al,j
mov dl,2               ; we divide j by 2 to know the bit we want to reverse from (last bit)
div dl  
mov x,al               ; x is the last bit that we will reverse from

mov dx,0
mov dl,j
sub dx,2              ; f  is variable to return last bit to zero    (note:--> after reversing it will be the first bit)
mov f,dl

     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

putc 0ah
putc 0dh
print "please enter your plain_text :-> "

mov cx,0
mov cl,j           ; we move j to cx as j is length of plain text to take plain text
mov di,0

M:
mov ah,1
int 21h          ; two lines to take plain text from user 
mov [di],al
inc di           ; two lines to store plain text in address start from 0
loop M 

mov cx,0
mov cl,j
mov ax,0        ; we move j to cx to reverse plain text address 
mov di,0
mov si,0 
mov bx,0  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

again:
    mov rev,0        ;  rev = 0
    mov i,di         ;  i is address of orignal plain text i=00,01,02,03.....
    mov n,di         ; n is a variable we use in our algorithm 
    
    mov bx,n          
    cmp bl,x         ; i did that because i want to be sure that the last bit is 1 so if last bit is 1 we will reverse directly if not we will put 1 in it and after reversing we will get it back to zero by making and      
    jb s               
    
    
start:           ; starting of our algorithm

    
    mov ax,n      ; from algorithm if (n>1) reverse n if not return rev 
    cmp ax,0
    jb stop
    
lop:
     shl rev,1    ; from algorithm shift-left by 1
     
     mov dx,n
     and dx,1     ; from algorithm  if (n and 1 == 1) then do next instructions (rev = rev xor 1) if not go to lable r
     cmp dx,1   
     jne r
  
     mov ax,0
     mov al,rev   ; from algorithm    rev = rev xor 1
     xor al,1
     mov rev,al
      
r:    
     shr n,1       ;from algorithm shift-right n by 1
    
     
    mov ax,n
    cmp ax,0      ; from algorithm these instructions to check if we end the reversing or not
    jbe stop
    ja lop        
   
       ; when we go to stop label that's mean we end our reversing
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

stop:
    
    mov ax,i
    cmp al,x     ; we compare between i , x to see if we put 0 in the last bit or not if yes we make and if not we don't make it and jump to k label
    jae k
    
    mov ax,0
    mov al,f      ; instructions  to return bit that we put 1 in it to 0
    and rev,al 
    
    
k:
    mov ax,0
    mov dx,0
    mov si,0
    
    mov dl,rev
    mov si,dx        ; instructions to store our data in reversing address that start from 0100h
    add si,100h
     
    
    mov al,[di]      ; mov the orignal data to al 
    mov [si],al      ; mov the orignal data to the reversing address
    
     
    inc di
    
    
     
loop  again
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

putc 0ah
putc 0dh
print "your output :-> "


mov di,0100h
mov cx,0               ; we move plain text length to cx to print our reversing data
mov cl,j
b:
   mov dx,[di]
   mov ah,2            ; we print reversing plain text which is stored in address start from 0100
   int 21h 
   inc di
loop b

hlt
 
s:

mov ax,0
mov al,x  
xor n,ax         ; these instructions to put 1 in the bit that we want to reverse from 
jmp start

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

define_scan_num

rev db 0     ; variable to declare reverse address 
i dw ?       ; it's an variable to point at the address of orignal plain text
n dw ?       ; variable we use in our algorithm
x db ?       ; variable to declare the bit we want to reverse from
j db ?       ; variable to declare plain text length
f db ?       ; variable we will use to return bit that we set because of xor function to zero
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;