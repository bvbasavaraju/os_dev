;
; This is a simple function which will Help us to jump to Protected Mode
;
; In this example, we are loading the GDT defined by global_descriptor_table.asm
; We are setting the Stack address at 0x90000
; We are setting all registers and segments with DATA_SEGMENT address
;
; This can be upadted to load any other GDT 

[bits 16]

switch_to_pm:
  
  cli                       ; Switch OFF all interrupts of Real mode, so that we can define the Interrupt vertor in Protected
                            ; Mode and then switch it ON, other wise RealMode interrupts may lead to crash in protected mode
  lgdt  [gdt_descriptor]    ; Load th GDT descriptor table we have defined!
  
  mov eax, cr0              ; Set the Control Register 1st bit to 0, so that we can switch to Protcted mode!
  or eax, 0x01
  mov cr0, eax
  
  jmp CODE_SEGMENT:init_pm  ; Jump to protected mode code
  
[bits 32]

init_pm:                    ; Initialse all the registers and segments with Protected mode our Data Segment defined in our GDT
  
  mov ax, DATA_SEGMENT
  mov ds, ax
  mov ss, ax
  mov es, ax
  mov fs, ax
  mov gs, ax
  
  mov ebp, 0x90000          ; Set the Stack's Base pointer and Stack pointer to 0x90000
  mov esp, ebp
