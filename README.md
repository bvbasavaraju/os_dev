# os_dev

**Note:** For detailed read on implementation and concepts please check my blog: https://bvbasavaraju.blogspot.com/

Theoritical knowledge is good, but getting hands durty to get practicle knowledge is always Better!

This repository is to create an operating system from scratch. Its not an easy task and it cannot be completed in few days. It might take year(s) together to even have something working. 

I have more than 10 years of IT experience and I do know the operating system and its functionality. Till now its theoritcal knowedge now, I am trying to understand it by writing one.

I believe in **Reinventing Wheel** to learn something!

If anyone like to contribute, thank you in advance. I am not sure from when anybody can contribute, If you wish to please mail me on which module you would like to contribute.
If you find any bug, please do report!

To start with, I am planning to write using assembly, C and C++! As I am familiar with these, it only makes sense to use these languages. And C is the most preferred language for writing OS! I will use C only where it is necessary, otherwise I will try to keep it C++.

-------------------------------------------------------------------------------------------------------------------------

# Tasks

**InProgress**
* (Theory/Understandinng) - Kernel development

**ToStart**
* Writing, Building and Loading Kernel

* (Blog) Stack, Function Calls and <filename>.asm file inclusion(using org, push, pop, pusha, popa, call, ret, %include, cmp, jump instructions)
* (Blog) Segments (cs, ds, ss, es), Disk Read, What is CYLINDER, HEAD, SECTOR, DRIVE, PLATTER?
* (Blog) 32-bit Protcted Mode
* (Blog) GDT (Global Descriptor Table)

**Completed**
* Creating Boot Block
* Creating Boot Secotr with HELLO msg printed on screen (using 0x10 ISR - VEDIO Service interrupt in Teletype mode)
* Using Lables in assembly code and loadeding the data using memory offset!
* Print string using Stack, Function Calls, <filename>.asm file inclution in assembly and boot sector
* Print in Hex format
* Segments
* Reading Disk
* Print Data using Video Memory - Yet to Test
* GDT Descriptor Default Implementation for 32 bit systems - Yet to Test
* Switching to Protected mode using GDT Descriptor

* (Blog) The BIOS Interrupt call and how to use ISR - 0x10 (VIDEO service interrupt) to print anything on screen
* (Blog)  -   Why 0x7C00 (32KB - 1KB) and Memory Layout. What is assembly keyword "org" means and how to use?
