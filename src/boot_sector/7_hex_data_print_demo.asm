;
; An example to print the 16 bit hex number
; 

[org 0x7C00]            ; Start of the program

mov dx, 0x1A2B	        ; Move the data to print in Hex to dx register
call print_hex          ; call method to print hex

; infinte loop
loop:
  jmp loop
  
%include "7_print_hex_data_in_dx_reg.asm"  ; include the file where print_hex function available

times 510-($-$$) db 0
dw 0xaa55
