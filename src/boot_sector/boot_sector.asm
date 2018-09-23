;
; This is a boot block. BIOS will look for this as the first thing!
;
; Here it is just an infinite loop after printing "HELLO" word
;
;	This demonstrates priting character on a screen using
;	VIDEO SERVICES interpput routine (0x10 - ISR number) 
;	ISR 0x10 uses ax register. we can access 'ax' as a word (2 bytes)
;	or we can use with high and low byte like ah and al
;	
;	for more details read aout "BIOS Interrupt call"
;

mov ah, 0x0e	;	VIDEO SERVICE mode - Teletype mode. print character and move the cursor to next position in screen
mov al, 'H'	;	store ASCII value H in AL
int 0x10	;	raise the interrupt to print data in 'al' with mode in 'ah' register i.e. 0x0e (teletype mode)
mov al, 'E'
int 0x10
mov al, 'L'
int 0x10
int 0x10	;	here the register 'al' already has the value 'L', so just call the interrupt.
mov al, 'O'
int 0x10

loop:
      jmp loop
;
; Any sector is of size 512 bytes.
; for any BIOS to identify the boot block, sector should end with MAGIC_NUMBER
; that MAGIC_NUMBER is 0xaa55
;
times 510-($-$$) db 0
dw 0xaa55
