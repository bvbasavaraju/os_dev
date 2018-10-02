;
; This is a boot block. BIOS will look for this as the first thing!
;
; This demonstrates 
; + Memory and where the first boot secotr(Master Boot Record - MRB) is located
; + How to access the memory and 
; + How labeling can be used in Assembly programming
; + using "org" assmebly keyword to select the MBR at 0x7C00 (32KB - 1KB) 
;
; Let us try to print vaue in lable (or memory offset) my_data
;

mov ah, 0x0e	;	VIDEO SERVICE mode - Teletype mode. print character and move the cursor to next position in screen

; Attempt 1 - move my_data - Failed
mov al, my_data   
int 0x10

; Attempt 2 - move content of my_data - Failed
mov al, [my_data]
int 0x10

; Attempt 3 - add the offset my-data to 0x7C00 - SUCCESS
mov bx, my_data
add bx, 0x7C00
mov al, [bx]
int 0x10

; Attempt 4 - Directly load content from location 0x7C1D - SUCCESS
mov al, [0x7C1D]
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
