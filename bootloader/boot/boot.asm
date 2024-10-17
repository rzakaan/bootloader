org 0x7C00
bits 16

main:
    ; dx start address data segment
    ; es extra segment
    ; ss stack pointer

    ; print message
    mov ax, 0
    mov dx, ax
    mov es, ax
    mov ss, ax

    ;
    mov sp, 0x7c00

    ; print message
    mov si, message
    call print
    
    hlt
halt:
    jmp halt

;
; print character to the display
; args
;   - si : chars to be printed
print:
    push ax
    push bx
    push si
print_loop:
    lodsb          ; load byte at ds:[si] into al and increment si
    or al, al      ; if zero then done
    jz print_done
    
    mov ah, 0x0e    ; print a character
    mov bh, 0       ; page number
    int 0x10
    jmp print_loop
print_done:
    pop si
    pop bx
    pop ax
    ret

;
message: db 'Hello World', 0x0d, 0x0a, 0

times 510 - ($-$$) db 0
dw 0xaa55