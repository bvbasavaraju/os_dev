;
; This is a simple function which will print the data 'dx' register in HEX format!
; it demonstrate the use of following assembly instructions
; + and
; + shr
; + add
; + jg
; + call
; + ret
; + mov
; 

print_hex:

  pusha             ; back up all registers data

  mov ah, 0x0e      ;	VIDEO SERVICE mode - Teletype mode. print character and move the cursor to next position in screen
  mov al, '0'       ; print "0x" prior to printing the hex value, so that it is more readable!
  int 0x10
  mov al, 'x'
  int 0x10

  mov al, dh        ; load the higher byte and print
  call print_nibble
  mov al, dl        ; load the lower byte and print
  call print_nibble
  
  popa          ; retrive all the register values before returning to caller
  ret

;
; function to print the upper and lower nibble in the al register
; here the register values are not pushed and poped back, 
; as we need to make sure that value of 'al' register modified in this function should be retained  
;

print_nibble:
  mov cl, al                ; backup content of 'al' register for lower nibble print
  and al, 0xF0	            ; extract higher nibble
  shr al, 0x04              ; right shift the value
  call convert_to_readable  ; call function to make human redable
  int 0x10  

  mov al, cl                ; get the backed up value
  and al, 0x0F              ; extract the lower nibble
  call convert_to_readable  ; call function to make human redable
  int 0x10  
  ret
  
;  
; function to convert the nibble to a human readable value in 'al' register
; here the register values are not pushed and poped back, 
; as we need to make sure that value of 'al' register modified in this function should be retained
; if the value in al register is greater than 9, then the value is in A to F range.
;

convert_to_readable:
  cmp al, 9             ; compare with 9
  jg A_to_F_conversion  ; if value is greater than 9 then value to be printed is A to F
  add al, '0'           ; add '0' or ASCII equivalent 0x30 
  ret                   ; return to the caller
  
A_to_F_conversion:
  sub al, 10            ; if value is within A to F, subtract decimal 10, or ASCII equivalent 0x0A
  add al, 'A'           ; add 'A' or ASCII equivalent 0x41 
  ret                   ; return to the caller
