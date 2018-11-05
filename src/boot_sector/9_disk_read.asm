;
; Disk read function implementation
;
; -------------------------
;   Register      Purpose
; -------------------------
;     al          number of sectors to read / total number of SECTORS read after read operation
;     ch          CYLINDER number to read from
;     cl          starting SECTOR number to read from
;     dh          HEAD number to read from
;     dl          DRIVE to read from (floppy disk (0x00) or CD or hard disk(0x80) or hard disk2(0x81) etc) 
;
; Note: 'dh' is acting as input argument for this function. 'dh' register will hold the number of sector(s) to read
;       Caller should mention number of sectors to read starting from SECTOR mentioned in 'cl' register

disk_read:

  push dx                 ; keep backup of dx register for future use
  
  mov ah, 0x02            ; DISK operation to perform when interrupt 0x13 called (0x02 => READ SECTOR)
  mov al, dh              ; load number of SECTORS to read
  
  mov dh, 0x00            ; HEAD number to read from
  mov ch, 0x00            ; CYLINDER number to read from
  mov cl, 0x02            ; Starting SECTOR number to read from
  
  int 0x13                ; 0x13 interrupt call
  
  jc disk_error           ; if CARRY FLAG is set then, there is an error while reading the secotr
  
  pop dx                  ; get the number of SECTOR count
  cmp dh, al              ; check if the number of SECTORS read is matching with what is supposed to read
  jne sector_error        ; if NOT equal then its error
  ret                     ; return to the caller
  
disk_error:
  mov bx, DISK_ERROR_MSG  ; load error message address to 'bx' register
  call print_data         ; Call print_data function
  call print_new_line
  mov dh, ah              ; ah => Error Code, dl => disk drive
  call print_hex
  ret                     ; return to the caller
  
sector_error:
  mov bx, SECTOR_ERROR_MSG
  call print_data
  ret
  
DISK_ERROR_MSG:
  db "DISK read error", 0 ; Error message
  
SECTOR_ERROR_MSG:
  db "SECTORS count invalid", 0
