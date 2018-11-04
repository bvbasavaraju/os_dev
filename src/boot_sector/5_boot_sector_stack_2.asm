;
; This is a boot block. BIOS will look for this as the first thing!
;
; This demonstrates 
; + making use of the STACK, lables and jump statements
;
; BP and SP are the pointer used with the STACK. BP (Base Pointer/stack Base Pointer) and SP (Stack Pointer)
; 
; tried to print "* BAT BUG *" data in console. So, it has been stored in the reverse order so that Data can be pushed and popped out of stack.
; reslting output is " * BAT BUG * "

[org 0x7C00]

mov ah, 0x0e	;	VIDEO SERVICE mode - Teletype mode. print character and move the cursor to next position in screen

mov bp, 0x8000  ; starting pointer of the stack. stack will grow upwards. (i.e. 0x8000, 0x7FFF, 0x7FFE ...)
mov sp, bp
 
mov bx, data  ; as program started at 0x7C00 using "org" keyword at the beginning, no need to add 0x7C00 to bx

update_stack:
  mov cx, [bx]      ; move content of bx to cx 
  push cx           ; push cx to stack
  add bx, 0x0001    ; increament address at bx by 1
  cmp cl, 0         ; check if end of string reached!
  jne update_stack  ; if not continue pushing data to stack

print_stack:
  pop cx            ; pop content of stack to bx
  mov al, cl        ; move the lower nibble to al and print the value
  int 0x10
  cmp cx, 0         ; compare if end of string reached!
  jne print_stack   ; if not continue popping and printing data
  jmp loop          ; jump to infinite loop

data:
  db "* GUB TAB *", 0 ; data to be pushed to stack and popped out

; infinte loop
loop:
  jmp loop

times 510-($-$$) db 0
dw 0xaa55
