;
; This is a boot block. BIOS will look for this as the first thing!
;
; This demonstrates 
; + making use of the STACK
;
; BP and SP are the pointer used with the STACK. BP (Base Pointer/stack Base Pointer) and SP (Stack Pointer)
;

;[org 0x7C00]

mov ah, 0x0e	;	VIDEO SERVICE mode - Teletype mode. print character and move the cursor to next position in screen

mov bp, 0x8000  ; starting pointer of the stack. stack will grow upwards. (i.e. 0x8000, 0x7FFF, 0x7FFE ...)
mov sp, bp

; Any push will result in pusing 16 bit value (2 bytes)
push 'T'  ; here along with 'T' another 8 bits of empty data will be pushed.
push 'A'
push 'B'

; when we pop it will pop from last to first. here T will be popped first.
pop bx
mov al, bl
int 0x10
mov al, bh  ; nothing will be present in the bh, As we have pushed only letter T (8 bits)
int 0x10

; Here A will be popped second.
pop bx
mov al, bl
int 0x10
mov al, bh  ; nothing will be present in the bh
int 0x10

; Here B will be popped second.
pop bx
mov al, bl
int 0x10
mov al, bh  ; nothing will be present in the bh
int 0x10

; infinte loop
loop:
  jmp loop

times 510-($-$$) db 0
dw 0xaa55
