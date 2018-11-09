;
; This is a Boot secotr code which switches from Real mode to Protected mode
;
; First print data in Real Mode
; then print data In Protected Mode using Video Memory
;

[org 0x7C00]

  mov bp, 0x9000   ;  update the base pointer and stack pointer 
  mov sp, bp
  
  mov bx, MSG_REAL_MODE ; print message in Real mode
  call print_data
  
  call switch_to_pm     ; switch to Protected mode
  jmp begin_pm          ; jump to protected mode code
  
  loop_rm:
    jmp loop_rm         ; infinite loop
    
  %include "./../boot_block/6_print_data_from_address_in_bx_reg.asm"
  %include "1_print_data_using_video_memory.asm"
  %include "2_global_descriptor_table.asm"
  %include "3_switch_to_protected_mode.asm"
  
  ; Demo code for protected mode
  [bits 32]
  
  begin_pm:
    mov ebx, MSG_PROTECTED_MODE   ; message to be printed in protected mode
    call print_data_pm            ; call function to print data in protected mode
    
    loop_pm:
      jmp loop_pm                 ; infinite loop
      
  MSG_REAL_MODE db "Message in Real Mode", 0
  MSG_PROTECTED_MODE db "Message in Protected Mode after switch", 0
  
  times 510 - ($ - $$) db 0   ; load all other bytes with 0
  dw 0xAA55                   ; Boot Sector MAGIC Key
