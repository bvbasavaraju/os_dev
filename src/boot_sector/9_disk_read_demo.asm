;
; Boot sector for Disk Read demo
;

[org 0x7C00]            ; Start of the program

mov bp, 0x8000            ; stack starting from 0x8000 address
mov sp, bp

mov bx, 0x0000            ; starting address of the Extra segment
mov es, bx                ; Extra Segment starting at 0x0000
mov bx, 0x9000            ; effective address is: ES * 16 + 0x9000 => (0x0000 * 16) + 0x9000 => 0x09000

mov dh, 2                 ; 2 Sectors to read
;mov dl, [BOOT_DRIVE]     ; If we do not mention the boot drive, the currnet boot drive will be considered
call disk_read            ; disk read function

mov dx, [0x9000]	        ; print the first 2 bytes from the secotr read
call print_hex            ; print the data

call print_new_line       ; print new line

mov dx, [0x9000 + 512]    ; move to next sector and read first 2 bytes
call print_hex

; infinte loop
loop:
  jmp loop
  
%include "9_disk_read.asm"
%include "7_print_hex_data_in_dx_reg.asm"           ; include the file where print_hex function available
%include "6_print_data_from_address_in_bx_reg.asm"

;BOOT_DRIVE:
;  db 0x80      ; hard disk

times 510-($-$$) db 0
dw 0xaa55

; our code in boot sector => secotr 1, cylinder 0, head 0
; next 2 secotrs

times 256 dw 0xBABA   ; sector 2 => 512 bytes
times 256 dw 0xFACE   ; sector 3 => 512 bytes
