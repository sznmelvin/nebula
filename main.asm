org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A ; End of line character

start:
    jmp main

; Prints strings to a screen
; Params: 	\- ds:si points to string

puts:
    ; save registers
    push si
    push ax

.loop:
    lodsb ; loads next character in al
    or al, al ; verify if next character is 0 (null terminator)
    jz .done ; 
    jmp .loop

    mov ah, 0x0e ; call bios interrupt
    mov bh, 0x00 ; set page number to 0
    int 0x10 ; invoke interrupt

.done:
    pop ax
    pop si
    ret


main:
    ; setup data segments
    mov ax, 0
    mov ds, ax
    mov es, ax

    ; setup stack
    mov ss, ax
    mov sp, 0x7C00

    ; print statement
    mov si, msg_hello
    call puts

.halt:
    jmp .halt

msg_hello: db 'Hello world!', ENDL, 0

times 510 - ($ - $$) db 0
dw 0xAA55  ; Boot signature 
