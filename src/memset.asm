BITS 64
section .text
global memset

;rdi is the address of memory u writing to
;rsi, the int shit u writing inside
;rdx, number of bytes to fill with rsi

memset:
    mov rax, rdi

loop:
    cmp rdx, 0; compare size to 0
    je return
    mov BYTE[rdi], sil
    inc rdi
    dec rdx
    jmp loop

return:
    ret
