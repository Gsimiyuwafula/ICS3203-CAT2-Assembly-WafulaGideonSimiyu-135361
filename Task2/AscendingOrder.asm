section .data
    array db 0xEE, 0x56, 0x78, 0x5F, 0x2A, 0x5C, 0x1D, 0x8E, 0x55, 0x8B, 0x6D ; Array of elements
    count db 11    ; Number of elements in the array
    newline db 10  ; Newline character

section .bss
    hex_buffer resb 3  ; Buffer to store hex representation

section .text
    global _start

_start:
    ; Bubble sort
    mov cl, [count]    ; Total number of elements
    dec cl             ; Adjust for zero-based indexing

outer_loop:
    xor rsi, rsi       ; Reset index
    mov al, cl         ; Copy outer loop counter

inner_loop:
    mov bl, [array + rsi]     ; Current element
    mov dl, [array + rsi + 1] ; Next element
    cmp bl, dl
    jbe no_swap        ; Jump if current <= next

    ; Swap elements
    mov [array + rsi], dl
    mov [array + rsi + 1], bl

no_swap:
    inc rsi            ; Move to next element
    dec al             ; Decrement inner loop counter
    jnz inner_loop     ; Continue inner loop

    dec cl             ; Decrement outer loop counter
    jnz outer_loop     ; Continue outer loop if not zero

    ; Print sorted array
    xor rcx, rcx       ; Clear counter

print_loop:
    movzx rax, byte [array + rcx]  ; Get current byte
    call print_hex     ; Print hex representation

    ; Print space
    mov rax, 1
    mov rdi, 1
    mov rsi, hex_buffer
    mov rdx, 2
    syscall

    inc rcx
    cmp cl, [count]
    jl print_loop

    ; Print newline
    mov rax, 1
    mov rdi, 1
    lea rsi, [newline]
    mov rdx, 1
    syscall

    ; Exit
    mov rax, 60
    xor rdi, rdi
    syscall

print_hex:
    ; Convert byte in AL to hex string in hex_buffer
    push rax
    
    ; Upper nibble
    shr al, 4
    call hex_digit
    mov [hex_buffer], al

    ; Lower nibble
    pop rax
    and al, 0x0F
    call hex_digit
    mov [hex_buffer + 1], al

    ret

hex_digit:
    ; Convert 4-bit value to hex character
    add al, '0'
    cmp al, '9'
    jle return
    add al, 7        ; Adjust for A-F
return:
    ret