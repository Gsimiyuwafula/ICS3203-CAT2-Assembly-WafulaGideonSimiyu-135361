section .data
    array db 10, 25, 36, 49, 8, 14, 3, 6   ; Define an array
    n equ 8                                ; Number of elements in the array
    msg db "Largest number: ", 0           ; Message to display before the number
    newline db 10                          ; Newline character

section .bss
    num resb 5                             ; Space to store the number as a string (increased to 5)

section .text
    global _start

_start:
    ; Initialize pointers and counters
    mov rcx, n            ; Counter (number of elements)
    lea rsi, [array]       ; Pointer to the start of the array
    mov al, [rsi]          ; Load the first element into AL (accumulator)
    
loop_start:
    dec rcx                ; Decrement the counter
    jz store_result        ; If counter is zero, exit the loop

    inc rsi                ; Point to the next element
    cmp al, [rsi]          ; Compare AL with the current array element
    jae loop_start         ; If AL is greater or equal, skip to the next iteration
    mov al, [rsi]          ; Otherwise, update AL with the current element
    jmp loop_start         ; Repeat the loop

store_result:
    movzx rax, al          ; Move the largest number into RAX
    call convert_to_ascii  ; Convert the number to ASCII and store in `num`

    ; Print the message
    mov rax, 1             ; syscall: write
    mov rdi, 1             ; file descriptor: stdout
    lea rsi, [msg]         ; Pointer to the message
    mov rdx, 16            ; Length of the message
    syscall

    ; Print the number
    mov rax, 1             ; syscall: write
    mov rdi, 1             ; file descriptor: stdout
    lea rsi, [num]         ; Pointer to the ASCII number
    mov rdx, 4             ; Maximum 4 characters (including null terminator)
    syscall

    ; Print a newline
    mov rax, 1             ; syscall: write
    mov rdi, 1             ; file descriptor: stdout
    lea rsi, [newline]     ; Pointer to the newline character
    mov rdx, 1             ; Length of the newline
    syscall

    ; Exit the program
    mov rax, 60            ; syscall: exit
    xor rdi, rdi           ; exit code 0
    syscall

convert_to_ascii:
    ; Convert the number in RAX to its ASCII representation
    mov rdi, num + 4       ; Point to the end of the buffer
    mov byte [rdi], 0      ; Null-terminate the string

convert_loop:
    xor rdx, rdx           ; Clear RDX for remainder
    mov rbx, 10            ; Divisor
    div rbx                ; Divide RAX by 10, RAX=quotient, RDX=remainder
    add dl, '0'            ; Convert remainder to ASCII
    dec rdi                ; Move buffer pointer backward
    mov [rdi], dl          ; Store ASCII character in buffer
    test rax, rax          ; Check if quotient is zero
    jnz convert_loop       ; If not, repeat

    ret