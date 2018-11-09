# os_dev

**Note:** For detailed read on implementation and concepts please check my blog: https://bvbasavaraju.blogspot.com/

**Status            -   Tasks**

* Completed         -   Creating Boot Block
* Completed         -   Creating Boot Secotr with HELLO msg printed on screen (using 0x10 ISR - VEDIO Service interrupt in Teletype mode)
* Completed (Blog)  -   The BIOS Interrupt call and how to use ISR - 0x10 (VIDEO service interrupt) to print anything on screen
* Completed         -   Using Lables in assembly code and loadeding the data using memory offset!
* Completed (Blog)  -   Why 0x7C00 (32KB - 1KB) and Memory Layout. What is assembly keyword "org" means and how to use?
* Completed         -   Print string using Stack, Function Calls, *.asm file inclution in assembly and boot sector
* ToStart   (Blog)  -   Stack, Function Calls and *.asm file inclusion(using org, push, pop, pusha, popa, call, ret, %include, cmp, jump instructions)
* Completed         -   Print in Hex format
* Completed	        -   Segments
* Completed	        -   Reading Disk
* ToStart   (Blog)  -   Segments (cs, ds, ss, es), Disk Read, What is CYLINDER, HEAD, SECTOR, DRIVE, PLATTER?
* ToStart   (Blog)  -   32-bit Protcted Mode
* Completed         -   Print Data using Video Memory - Yet to Test
* ToStart   (Blog)  -   GDT (Global Descriptor Table)
* Completed         -   GDT Descriptor Default Implementation for 32 bit systems - Yet to Test
* ToStart           -   Switching to Protected mode using GDT Descriptor

-------------------------------------------------------------------------------------------------------------------------

Theoritical knowledge is good, but getting hands durty to get practicle knowledge is always Better!

This repository is to create an operating system from scratch. Its not an easy task and it cannot be completed in few days. It might take year(s) together to even have something working. 

I have more than 10 years of IT experience and I do know the operating system and its functionality. Till now its theoritcal knowedge now, I am trying to understand it by writing one.

I believe in **Reinventing Wheel** to learn something!

If anyone like to contribute, thank you in advance. I am not sure from when anybody can contribute, If you wish to please mail me on which module you would like to contribute.
If you find any bug, please do report!

To start with, I am planning to write using assembly, C and C++! As I am familiar with these, it only makes sense to use these languages. And C is the most preferred language for writing OS! I will use C only where it is necessary, otherwise I will try to keep it C++.
