[Main Page](../README.md)

## Modes
- Real Mode
- Protected Mode
- Virtual Real Mode

### Real Mode
The original IBM PC could only address 1 MB of system memory, and the original versions of DOS created to work on it were designed with this in mind. 
DOS is by its nature a single-tasking operating system, meaning it can only handle one program running at a time. The decisions made in these early days have carried forward until now, and in each new processor, care had to be taken to be able to put the processor in a mode that would be compatible with the original Intel 8088 chip. This is called real mode.
When a processor is running in real mode, it acts like an "8088 on steroids".
What this means is that it has the advantage of speed, but it otherwise accesses memory with the same restrictions of the original 8088: a limit of 1 MB of addressable RAM, and slow memory access that doesn't take advantage of the full 32-bit processing of modern CPUs. All processors have this real mode available, and in fact the computer normally starts up in real mode.

> 1mb = 1024kb = 1.048.576 byte = 0x100000

### Protected Mode

Starting with the 80286 chip in the IBM AT, a new processor mode was introduced called protected mode. This is a much more powerful mode of operation than real mode, and is used in all modern multitasking operating systems. The advantages of protected mode (compared to real mode) are:

- Full access to all of the system's memory. There is no 1 MB limit in protected mode.
- Ability to multitask, meaning having the operating system manage the execution of multiple programs simultaneously.
- Support for virtual memory, which allows the system to use the hard disk to emulate additional system memory when needed.
- Faster (32-bit) access to memory, and faster 32-bit drivers to do I/O transfers.

The name of this mode comes from its primary use, which is by multitasking operating systems. Each program that is running has its own assigned memory locations, which are protected from conflict with other programs. If a program tries to use a memory address that it isn't allowed to, a "protection fault" is generated.


### Virtual Real Mode
The third mode of processor operation is actually an additional capability, an enhancement, of protected mode. Protected mode is normally used to run graphical multitasking operating systems such as the various flavors of Windows. There is often a desire to be able to run DOS programs under Windows, but DOS programs need to be run in real mode, not protected mode.

Virtual real mode was created to solve this problem. In essence, it emulates real mode from within protected mode, allowing DOS programs to run. A protected mode operating system such as Windows can in fact create multiple virtual real mode machines, each of which appear to the software running them as if they are the only software running on the machine. Each virtual machine gets its own 1 MB address space, an image of the real hardware BIOS routines, everything.

Virtual real mode is what is used when you use a DOS box or run a DOS game in Windows 95. When you start a DOS application, Windows 95 creates a virtual DOS machine for it to run under. Virtual real mode was introduced starting with the 386 family of processors.

## Links
[wiki.osdev.org](https://wiki.osdev.org/Protected_Mode)

