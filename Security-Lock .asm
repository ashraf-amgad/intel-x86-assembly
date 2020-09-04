;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include emu8086.inc
org 100h


;;;;;;;;;;;;;;;;;;;;;;;;;;;;

main:
;=====

call clear_screen

    lea dx, msg14
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
    
    lea dx, msg14
    mov ah,9
    int 21h

;;;;;;;;;;;;;;;;;;;;;;;

     mov dx,offset msg1       ;  "Please Enter Card Num:-->"
     mov ah,9
     int 21h     
 

    mov di,00
    mov cx,6
    mov ax,0          ; loop to store our card numbers in address DS: DI [0700:0000]
    
card_num:    
    mov ah,1
        int 21h
    stosb
   ;;;;;;
    cmp al, '0'
       jb stop
                     ; Instructions to make sure that the inputs is only digits  
    cmp al, '9'
       ja stop
  ;;;;;;
loop card_num

;;;;;;;;;;;;;;; 

mov dx,offset msg2
mov ah,9                    ; "Please Enter You Key:-->"
int 21h

    mov di,06
    mov cx,4
    mov ax,0
    
card_key:                  ; loop to store our card key in address DS: DI [0700:0006]
    mov ah,1
        int 21h
    stosb
  ;;;;;;
    cmp al, '0'
       jb stop
                     ; Instructions to make sure that the inputs is only digits  
    cmp al, '9'
       ja stop
  ;;;;;; 
loop card_key

;###############################################################
    lea si,user_1
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
u1:
   mov al,[si]
   mov dl,[di]
   inc si
   inc di
   cmp al,dl    
jne u2
loop u1 
;;;;;;;;;
k1:
    lea si,key_1
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
  k11:
         mov al,[si]
         mov dl,[di]
         inc si
         inc di
         cmp al,dl    
   jne n
   loop k11
       
jmp y
;*************************************
u2:
    lea si,user_2
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u21:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u3
  loop u21 
;;;;;;;;;
k2:
    lea si,key_2
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k21:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k21    

jmp y
;***************************************** 
u3:
    lea si,user_3
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u31:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u4
  loop u31 
;;;;;;;;;
k3:
    lea si,key_3
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k31:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k31    

jmp y
;*****************************************
u4:
    lea si,user_4
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u41:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u5
  loop u41 
;;;;;;;;;
k4:
    lea si,key_4
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k41:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k41    

jmp y
;*****************************************
u5:
    lea si,user_5
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u51:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u6
  loop u51 
;;;;;;;;;
k5:
    lea si,key_5
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k51:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k51    

jmp y
;*****************************************
u6:
    lea si,user_6
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u61:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u7
  loop u61 
;;;;;;;;;
k6:
    lea si,key_6
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k61:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k61    

jmp y
;*****************************************
u7:
    lea si,user_7
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u71:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u8
  loop u71 
;;;;;;;;;
k7:
    lea si,key_7
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k71:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k71    

jmp y
;*****************************************
u8:
    lea si,user_8
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u81:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u9
  loop u81 
;;;;;;;;;
k8:
    lea si,key_8
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k81:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k81    

jmp y
;*****************************************
u9:
    lea si,user_9
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u91:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u10
  loop u91 
;;;;;;;;;
k9:
    lea si,key_9
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k91:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k91    

jmp y
;*****************************************
u10:
    lea si,user_10
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u101:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u11
  loop u101 
;;;;;;;;;
k10:
    lea si,key_10
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k101:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k101    

jmp y
;*****************************************
u11:
    lea si,user_11
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u111:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u12
  loop u111 
;;;;;;;;;
k011:
    lea si,key_11
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k111:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k111    

jmp y
;*****************************************
u12:
    lea si,user_12
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u121:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u13
  loop u121 
;;;;;;;;;
k12:
    lea si,key_12
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k121:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k121    

jmp y
;*****************************************
u13:
    lea si,user_13
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u131:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u14
  loop u131 
;;;;;;;;;
k13:
    lea si,key_13
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k131:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k131    

jmp y
;*****************************************
u14:
    lea si,user_14
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u141:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u15
  loop u141 
;;;;;;;;;
k14:
    lea si,key_14
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k141:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k141    

jmp y
;*****************************************
u15:
    lea si,user_15
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u151:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u16
  loop u151 
;;;;;;;;;
k15:
    lea si,key_15
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k151:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k151    

jmp y
;*****************************************
u16:
    lea si,user_16
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u161:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u17
  loop u161 
;;;;;;;;;
k16:
    lea si,key_16
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k161:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k161    

jmp y
;*****************************************
u17:
    lea si,user_17
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u171:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u18
  loop u171 
;;;;;;;;;
k17:
    lea si,key_17
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k171:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k171    

jmp y
;*****************************************
u18:
    lea si,user_18
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u181:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u19
  loop u181 
;;;;;;;;;
k18:
    lea si,key_18
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k181:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k181    

jmp y
;*****************************************
u19:
    lea si,user_19
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u191:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne u20
  loop u191 
;;;;;;;;;
k19:
    lea si,key_19
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k191:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k191    

jmp y
;*****************************************
u20:
    lea si,user_20
    mov di,u
    mov cx,6
    mov ax,0
    mov dx,0
      
 u201:
       mov al,[si]
       mov dl,[di]
       inc si
       inc di
       cmp al,dl    
  jne n
  loop u201 
;;;;;;;;;
k20:
    lea si,key_20
    mov di,k
    mov cx,4
    mov ax,0
    mov dx,0
          
 k201:
      mov al,[si]
      mov dl,[di]
      inc si
      inc di
      cmp al,dl    
  jne n
  loop k201    

jmp y
;###############################################################

   
user_1 db '111111'
key_1 db '1111'
user_2 db '222222'
key_2 db '2222'
user_3 db '333333'
key_3 db '3333'
user_4 db '444444'
key_4 db '4444'
user_5 db '555555'
key_5 db '5555'
user_6 db '666666'
key_6 db '6666'
user_7 db '777777'
key_7 db '7777'
user_8 db '888888'
key_8 db '8888'
user_9 db '999999'
key_9 db '9999'
user_10 db '101010'
key_10 db '1010'
user_11 db '011111'
key_11 db '1111'
user_12 db '121212'
key_12 db '1212'
user_13 db '131313'
key_13 db '1313'
user_14 db '141414'
key_14 db '1414'
user_15 db '151515'
key_15 db '1515'
user_16 db '161616'
key_16 db '1616'
user_17 db '171717'
key_17 db '1717'
user_18 db '181818'
key_18 db '1818'
user_19 db '191919'
key_19 db '1919'
user_20 db '202020'
key_20 db '2020'

u dw 00               ; variable to store address of card_num
k dw 06h              ; variable to store address of card_key 

msg1 db 0ah,0dh,0ah,0dh,"Please Enter Card Num:--> $"
msg2 db 0ah,0dh,0ah,0dh,"Please Enter You Key:--> $"
msg3 db 0ah,0dh,"Welcome Sir (-_-)$"
msg4 db 0ah,0dh,0ah,0dh,"Do you want to cntinue? (y,n) --> $"
msg5 db 0ah,0dh,"!!! Wrong User !!! $"
msg6 db 0ah,0dh,"Wrong input! $"
msg7 db 0ah,0dh,"--------------------> $"

msg8 db 0ah,0dh,"--",09h,09h,"  Security Lock",09h,09h,09h,09h,09h,09,"--$"
msg9 db 0ah,0dh,"--",09h,"  Ashraf Amgad | Abo El_hassan Khairy",09h,09h,09h,09h,"--$"
msg10 db 0ah,0dh,"--",09h,09h,"  59   |    11",09h,09h,09h,09h,09h,09h,"--$"
msg11 db 0ah,0dh,"--",09h,09h,"-------|--------",09h,09h,09h,09h,09h,09h,"--$"
msg12 db 0ah,0dh,"--",09h,"Alex Univ Faculty of engineering.",09h,09h,09h,09h,"--$"
msg13 db 0ah,0dh,"-- 3rd Year Electrical Engineering Communication Department.",09h,09h,"--$"
msg14 db 0ah,0dh,"------------------------------------------------------------ $"

define_clear_screen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
y:  

call clear_screen     
    
    mov dx,offset msg7           ; "--------------------> $"
    mov ah,9
    int 21h
    
    mov dx,offset msg3           ; "Welcome Sir (-_-)$"
    mov ah,9
    int 21h
    
    mov dx,offset msg7
    mov ah,9                    ; "--------------------> $"
    int 21h
    
    mov dx,offset msg4          ; "Do you want to cntinue? (y,n) --> $"
    mov ah,9
    int 21h     
                mov ah,1
                int 21h
            mov cl,"y"
            cmp al,cl
        je main
            mov cl,"n"
            cmp al,cl
        je exit
      jne stop
;;;;;;;;;;    
n:
 
call clear_screen 
    
    mov dx,offset msg7          ; "--------------------> $"
    mov ah,9
    int 21h
    
    mov dx,offset msg5         ; "!!! Wrong User !!! $"
    mov ah,9
    int 21h
    
    mov dx,offset msg7         ; "--------------------> $"
    mov ah,9
    int 21h
                               
    mov dx,offset msg4         ; "Do you want to cntinue? (y,n) --> $"
    mov ah,9
    int 21h 
     
        mov ah,1
        int 21h
            mov cl,"y"
            cmp al,cl
        je main
            mov cl,"n"
            cmp al,cl
        je exit
        
;;;;;;;;;;
stop: 

call clear_screen
    
    mov dx,offset msg7           ; ; "--------------------> $"
    mov ah,9
    int 21h
    
    mov dx,offset msg6           ; "Wrong input! $"
    mov ah,9
    int 21h
    
    mov dx,offset msg7           ; "--------------------> $"
    mov ah,9
    int 21h
    
    mov dx,offset msg4
    mov ah,9                     ; "Do you want to cntinue? (y,n) --> $"
    int 21h
    
     mov ah,1
     int 21h
            mov cl,"y"
            cmp al,cl
        je main
        mov cl,"n"
            cmp al,cl
        jne stop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
exit:
    hlt


