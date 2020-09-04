;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
 
include emu8086.inc
org 100h

;;;;;;;;;;   
    
    
    lea dx, msg13
    mov ah,9
    int 21h

    lea dx, msg7
    mov ah,9
    int 21h

    lea dx, msg8
    mov ah,9
    int 21h

    lea dx, msg9
    mov ah,9
    int 21h

    lea dx, msg10
    mov ah,9
    int 21h

    lea dx, msg11
    mov ah,9
    int 21h
    
    lea dx, msg12
    mov ah,9
    int 21h
    
    lea dx, msg13
    mov ah,9
    int 21h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


     mov ah,9
     lea dx,msg1       ;print 'Please Enter Your Key:- '
     int 21h                                               


;==============================   
    
    mov cx,5
    mov di,sec_key_start
key:
    mov ah,1   
      int 21h       
    
    mov [di],al
    inc di     
loop key    
       
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;      
;         mov ah,9
;         lea dx,msg2       ; print 'check memory "01h"'
;         int 21h                             
;      
;        
;    mov ah,1             
;      int 21h
             
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
    mov cx,10
    mov di,06h       
    mov dx,0

s_array:
;-----------=
    mov dl,i
    mov [di],dl  ;
    inc i
    inc di
     
loop s_array

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        
      mov ah,9
      lea dx,msg3       ; print "S[i] Done!"
      int 21h                      
      putc 09h
      
       mov cx,10     
        mov dx,0      
        mov di,06
     lp:  
        mov dl,[di]      
        add dl,30h
        mov ah,2
        int 21h
        inc di
        putc 09h      
     loop lp
      

;      mov ah,9
;      lea dx,msg4      ; print 'check memory "06h"'             
;      int 21h
;      
;     mov ah,1                                     
;       int 21h
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov cx,10
mov dx,0
mov i,0                
;===============================================

  Ksa:
;<---->            
;                  =========
;                   J+S(i)

    mov bx,sec_key_start
    mov ax,0
    mov si,S_start
         
    mov dl,i           
    add si,dx           
    mov dl,j   
    add dl,[si]         
         
    push dx          
    
;====================================================
;                   (i / key_length)


    mov al,i
    mov dl,k           ; now we get (i/k) 
    div dl
                       
    mov rem,ah         
      
;==============================================================
;           J + S(i) + key( i / key_length)

                       
    mov ax,0                           
    pop dx          ; we get back " j + S(i) "
    
    add bl,rem                             
    add dl,[bx]        ; --> we  get now " J + S(i) + key( i / key_length) "

;==========================================================
;       J = [J + S(i) + key( i / key_length)]/S_size
    

    mov al,dl
    mov dl,S_size
    div dl             ; --> we  get now " J + S(i) + key( i / key_length) / S_size"
    
    mov j,ah           ;we get our equation --> J = [J+S(i)+key( i / key_length)] / S_size
         
         
;=======================================================
;            swap values of s(i) , S(j) 

                      
    mov si,S_start    
    mov di,S_start     
    
    
    mov ax,0
    mov al,j          
    add si,ax         
    mov al,[si]       
    mov x_swap,al     
    
    mov ax,0
    mov al,i          
    add di,ax         
    mov al,[di]       
    mov [si],al       
    mov al,x_swap     
    mov [di],al       
    
         
    inc i   
               
loop Ksa

;;;;;;;;;;;;;;;;;;;;;;;;
        
        mov ah,9
        lea dx,msg5
        int 21h           ; print "KSA Done"
        putc 09h
              
        mov cx,10     
        mov dx,0      
        mov di,06
     lop:  
        mov dl,[di]      
        add dl,30h
        mov ah,2
        int 21h
        inc di
        putc 09h      
     loop lop
                
;    mov ah,1
;     int 21h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




mov cx,0
mov cl,counter
mov i,0    ;i=j=0             
mov j,0    ;i=j=0            


PRGA:
;=========
      mov dx,0 
      mov ax,0
      
   inc i                  ; i = i+1
   mov al,i                
   mov dl,S_size          
   div dl                 ; (i+1) / S_size
   
   mov i,ah
   mov dl,ah              ; we put i value in dl
   
   
   mov si,S_start
                          
   add si,dx              ; we get addrss S(i) from begging of " S " and offset of " i "
   mov dl,[si]            ; now we move value of S(i) to dl
   add dl,j               ; J + S(i) and the result is in dl
   
   mov ax,0
   mov al,dl 
   mov dl,S_size          ; [J+S(i)] / S_size
   div dl
   
   mov j,ah               ; J = [J+S(i)] / S_size
   
;===============
;;;;;;; swap 

mov si,S_start    
mov di,S_start     
    
    
    mov ax,0
    mov al,j          
    add si,ax         
    mov al,[si]      
    mov x_swap,al     
    
    
    mov ax,0
    mov al,i         
    add di,ax         
    mov al,[di]       
    mov [si],al       
    mov al,x_swap     
    mov [di],al       
  
;======================================  
  
    mov ax,0
    mov dx,0
    mov si,S_start
    mov di,S_start
    
    mov dl,i
    add si,dx
    mov dl,[si]
    
    mov al,j
    add di,ax
    mov al,[di]
     
    add al,dl      ; al = s(i)+s(j)
    
    mov dx,0 
    mov dl,S_size   ; [S(i)+S(j)] / 10
    div dl
    
    mov dx,0
    mov dl,ah       ; we move result of [S(i)+S(j)] / 10 to dl
    
    mov si,S_start
    
    add si,dx       ; we did this to get address of  S[ [S(i)+S(j)] / 10 ]
                    
    mov dl,[si]     ; we did this to move value of  S[ [S(i)+S(j)] / 10 ]  to dl
    add dl,30h
    push dx

        mov ah,9
        lea dx,msg6    ; print "Key_stream Done! | check bl |"
        int 21h        
         
         
    pop dx
    mov ah,2     
    int 21h     
                       
;         mov ah,1
;          int 21h
         
loop PRGA 
 
hlt
 
;;;;;;;;;;;;;

msg1 db 0ah,0dh,0ah,0dh,'Please Enter Your Key:-> $'
msg2 db 0ah,0dh,'check memory "01h"$'
msg3 db 0ah,0dh,"S[i] Done!$"
msg4 db 0ah,0dh,'check memory "06h"$'
msg5 db 0ah,0dh,"KSA Done$"
msg6 db 0ah,0dh,"Key_stream Done :->  $"

msg7 db 0ah,0dh,"--",09h,"      RC4-Based Random Generator",09h,09h,09h,09h,09,"--$"
msg8 db 0ah,0dh,"--",09h,"  Ashraf Amgad | Abo El_hassan Khairy",09h,09h,09h,09h,"--$"
msg9 db 0ah,0dh,"--",09h,09h,"  59   |    11",09h,09h,09h,09h,09h,09h,"--$"
msg10 db 0ah,0dh,"--",09h,09h,"-------|---------",09h,09h,09h,09h,09h,09h,"--$"
msg11 db 0ah,0dh,"--",09h,"    Alex Univ Faculty of engineering",09h,09h,09h,09h,"--$"
msg12 db 0ah,0dh,"-- 3rd Year Electrical Engineering Communication Department.",09h,09h,"--$"
msg13 db 0ah,0dh,"------------------------------------------------------------ $"
 
i db 00h
j db 00h
k db 5
sec_key_start dw 01h
S_start dw 0006h
S_size db 10
x_swap db ?
rem db ?
counter db 8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
