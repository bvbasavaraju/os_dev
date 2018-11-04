;
; This program demonstrates the function call and .ams file include 
; 

[org 0x7C00]            ; Start of the program

mov bx, start_data      ; Move the start_data address to register bx
call print_data         ; call method to print data

mov bx, end_data        ; Move the end_data address to register bx
call print_data         ; call method to print data

; infinte loop
loop:
  jmp loop
  
%include "6_print_data_from_address_in_bx_reg.asm"  ; include the file where print_data function available
  
start_data:
  db "* BAT BUG *", 0
  
end_data:
  db "* FUCK OFF *", 0

times 510-($-$$) db 0
dw 0xaa55
