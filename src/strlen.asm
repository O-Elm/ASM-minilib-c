BITS 64
section .text
global strlen

strlen:
    mov     rax, 0 ;set the return/result value to 0

loop:
    cmp     BYTE [rdi], 0 ; bit to the pointer is pointing to and compare it to 0
    je      return ; je = jump if equal / if it s 0 we return otherwise continue
    inc     rdi ; increment rdi = 1st argument;
    inc     rax ; increment result rax=return++
    jmp     loop ; go back to loop

return:
    ret