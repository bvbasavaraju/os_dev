;
; This is a simple function which will print the data in address 
; bx register
;

print_data:

  pusha         ; back up all registers data

  mov ah, 0x0e  ;	VIDEO SERVICE mode - Teletype mode. print character and move the cursor to next position in screen
  
print_in_loop:  
  mov cx, [bx]  ; move the content of the address in bx register
  mov al, cl
  int 0x10
  add bx, 0x0001
  cmp cl, 0     ; check if the end of the string
  jne print_in_loop

  popa          ; retrive all the regster values before returning to caller
  ret

;
; Function to print new line
;

print_new_line:
  
  pusha
  
  mov ah, 0x0e
  mov al, 0x0a    ; new line character
  int 0x10
  mov al, 0x0d    ; carriage return
  int 0x10
  
  popa
  ret
