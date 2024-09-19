# Nebula

An operating system made for research purposes written in assembly and c.

## Prerequisites

I recommend understanding assembly and c syntax and how a program runs(fetch from memory, decode and execute). It would really help you understand the codebase better. I also recommend reading _Operating Systems 3 Easy Steps by Remzi H.Arpaci-Dusseau and Andrea C.Arpaci-Dusseau_. It's the book I use while making this.

## How a computer starts up

- _BIOS_ (Basic Input/Output System) is the first software that runs when a computer is turned on. They are copied from the ROM to the RAM. The BIOS then starts executing code such as initializing the hardware and running system checks(i.e. POST - Power-On Self-Test).
- After the BIOS is done executing the code, it checks for a bootable device (i.e. a hard drive, or USB drive) and loads the bootloader from that device into the memory. The _bootloader_ is simply a device for loading the operating system into the memory.
- The BIOS then loads and starts the operating system. The operating system then takes control of the computer and initializes the rest of the system. The operating system is the main software that runs on the computer and provides the user interface and the ability to run applications.

## How the BIOS finds an OS

### There are 2 methods:

- _Legacy Booting:_ This is where the BIOS loads the first sector of the bootable device into memory and looks for a specific signature. When this signature is found, it executes the code in that sector. This is the most common method of booting and is supported by all BIOSes. The signature is `0x55AA` and is located at the end of the sector.
- _EFI:_ The BIOS look into special EFI partitions. The os must also be compiled as an EFI program.
