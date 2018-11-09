;
; This is a simple function which will print the data ebx register
; It will make use of the video memory (0xb8000)
; 
; In case of using video memory to print data, every byte need to be attached with the ATTRIBUTE
; this ATTRIBUTE will tell how to print the data (color, size, etc)
; For now we are sticking to 8 bit attribute + 8 bit data to be printed
; So total of 2 bytes required on byte of information while using VIDEO memory
;
; Note: This program will be running in the 32 bit protected mode ONLY.
;       So, cannot be called until we switch to Protected mode.


[bits 32]

VIDEO_MEMORY equ 0xb8000
CHARACTER_PRINT_ATTRIBUTE equ 0x0F  ; White will be color of the text on a Black background

print_data_pm:

  pusha                  ; back up all registers data
  
  mov edx, VIDEO_MEMORY  ; data Rgister is set to start of the video memory
  
print_in_loop_pm:
  mov al, [ebx]                     ; Data to be printed
  mov ah, CHARACTER_PRINT_ATTRIBUTE ; ATTRIBUTE of data to be printed
  
  cmp al, 0                         ; check if it is the end of data
  je return_to_caller             
  
  mov [edx], ax                     ; Load the data to the Video memory
  add ebx, 1                        ; Move to next byte in Data
  add edx, 2                        ; Move to next address in Video Memory
  jmp print_in_loop_pm              ; loop untill end of end
  
return_to_caller:

  popa
  ret

;
; Function to print new line
; Here first we need to find the row number and then move the cusror by 1 row. 
; using formula 0xb8000 + 2 * (row * 80 + col) 
; For New Line => row = current_row + 1, col => 0
;

;print_new_line_pm:
  
;  pusha
  
;  logic goes here
  
;  popa
;  ret
