;
; This is a boot block. Boot loader will look for this as the first thing!
;
; Here it is just an infinite loop
;
;
loop:
      jmp loop
;
; Any sector is of size 512 bytes.
; for any Boot loader to identify the boot block, sector should end with MAGIC_NUMBER
; that MAGIC_NUMBER is 0xaa55
;
times 510-($-$$) db 0
dw 0xaa55
