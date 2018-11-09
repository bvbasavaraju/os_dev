;
; This is a simple code snippet degining the Gobal Descriptor Table (GDT)
; 
; GDT is the crutial part of any OS to switch from REAL mode to PROTECTED MODE
; It will be very useful for memory management
; 
; It is a 8 bytes (64 bits) long, with below mentioned parts
; + Base Address (32 bits)
; + Segment Limit (20 bits)
; + Flags (characterizing the properties of the Segment)
;
; GDT (8 bytes) Representation in 32 bit systems:
; 
; 31         24 23    22  21  20  19       16 15  14 13 12  11   8 7          0
; +------------+---+-----+---+---+-----------+---+-----+---+------+------------+
; + BA (31:24) + G + D/B + L +AVL+ SL(19:16) + P + DPL + S + Type + BA (23:16) +  4
; +------------+---+-----+---+---+-----------+---+-----+---+------+------------+
;
; +-----------------------------------+----------------------------------------+
; +     Base Address (BA) (15:0)      +       Segment Limit (SL) (15:0)        +  0
; +----------------------------------------------------------------------------+
;
; Flag - Size   - Remarks
; G    - 1 bit  - Granularity - Access in unit of bytes (2 ^ 20) or Access in the unit of 4096 bytes Pages (2^32)
; D/B  - 1 bit  - Default operation size (0 -> 16 bit, 1 -> 32 bit segment)
; L    - 1 bit  - 64 bit Code segment (default value is 0)
; AVL  - 1 bit  - Available for the use of system software
; P    - 1 bit  - Segment Present
; DPL  - 2 bits - Descriptor Previlege Level
; S    - 1 bit  - Descriptor Type (1 -> Code/Data, 0 -> System)
; Type - 4 bits - Segment Type
;               - Code/Data (11th bit), Confirming (10th bit), Readble (9th bit), Accessed (8th bit)
;               - Code/Data (11th bit), Expand Down (10th bit), Writable (9th bit), Accessed (8th bit)
; BA   - 32 bits- Base Address
; SL   - 20 bits- Segment Limit  
;
; Note: 1. CPU will be given with GDT Descriptor which describes the GDS having 2 things
;           + GDT Size (16 bits)
;           + GDT Start Address (32 bits)
;       2. CPU needs first entry of the GDT to be invalid or NULL DESCRIPTOR (8 bytes of 0s)
;          To catch any mistakes

gdt_start:

; NULL DESCRIPTOR, 8 bytes of 0s
gdt_null: 
  dd 0    ; dd -> data double -> 4bytes in Size
  dd 0  

; Code Segment Description in 8 bytes  
gdt_code:
          ; BA -> 0, SL -> 0xFFFFF
          ; Bits 23 - 20 => G -> 1, D/B -> 1, L -> 0, AVL -> 0                            => 1100b (in Binary)
          ; Bits 15 - 12 => P -> 1, DPL -> 00, S -> 1                                     => 1001b
          ; Bits 11 - 8  => Code/Data -> 1, Confirming -> 0, Readble -> 1, Accessed -> 0  => 1010b
          
  dw 0xFFFF       ; SL (15:0)
  dw 0x0000       ; BA (15:0)
  db 0x00         ; BA (23:16)
  db 10011010b    ; Flags (15:8)
  db 11001111b    ; Flags (23:20) and SL (19:16)
  db 0x00         ; BA (31:24)
  
; Data Segment Description in 8 bytes
gdt_data:
          ; BA -> 0, SL -> 0xFFFFF
          ; Bits 23 - 20 => G -> 1, D/B -> 1, L -> 0, AVL -> 0                              => 1100b (in Binary)
          ; Bits 15 - 12 => P -> 1, DPL -> 00, S -> 1                                       => 1001b
          ; Bits 11 - 8  => Code/Data -> 0, Expand Down -> 0, Writable -> 1, Accessed -> 0  => 0010b
          
  dw 0xFFFF       ; SL (15:0)
  dw 0x0000       ; BA (15:0)
  db 0x00         ; BA (23:16)
  db 10010010b    ; Flags (15:8)
  db 11001111b    ; Flags (23:20) and SL (19:16)
  db 0x00         ; BA (31:24)
  
gdt_end:    ; For easy calculation of Size of GDT

;GDT Descriptor
gdt_descriptor:
  dw gdt_end - gdt_start - 1  ; GDT SIZE (16 bits)
  dd gdt_start                ; GDT Start Address (32 bits)
  

; Some Handy Constants for Protected mode. In our GDT Descriptor when DS is set with value 0x10 in protected mode it means it is Data Segment
; As Base Address is 0 in our GDT Descriptor example, When DS is set with, 
;    DS = 0x00 -> NULL Descriptor or 
;    DS = 0x08 -> Code segment or 
;    DS = 0x10 -> Data Segment

CODE_SEGMENT equ gdt_code - gdt_start
DATA_SEGMENT equ gdt_data - gdt_start
