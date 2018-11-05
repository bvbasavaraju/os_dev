;
; This is a boot secotr. to demonstrate Segments
;
; There are 4 segments: cs, ds, ss, es
; cs  => CODE SEGMENT
; ds  => DATA SEGMENT
; ss  => STACK SEGMENT
; es  => EXTRA SEGMENT
;

mov ah, 0x0e	;	VIDEO SERVICE mode - Teletype mode. print character and move the cursor to next position in screen


; Attempt 1 - Failed
mov al, [my_data]   
int 0x10

; Attempt 2 - SUCCESS
mov bx, 0x7C0       
mov ds, bx            ; DS (data segment) is loaded with 0x7C0
mov al, [my_data]     ; Effective address is DS * 16 + my_data => 0x7C0 * 16 + my_data => 0x7C00 + my_data
int 0x10

; Attempt 3 - failed
mov al, [es:my_data]
int 0x10

; Attempt 4 - SUCCESS
mov bx, 0x7C0
mov es, bx            ; ES (extra segment) is loaded with 0x7C0
mov al, [es:my_data]  ; Effective address is ES * 16 + my_data => 0x7C0 * 16 + my_data => 0x7C00 + my_data
int 0x10

; infinte loop
loop:
  jmp loop

; This value to be printed!      
my_data:
  db "B"

;
; Any sector is of size 512 bytes.
; for any BIOS to identify the boot block, sector should end with MAGIC_NUMBER
; that MAGIC_NUMBER is 0xaa55
;
times 510-($-$$) db 0
dw 0xaa55
