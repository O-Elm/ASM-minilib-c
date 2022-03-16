BITS 64
section .text
global memmove

;rdi is the address of memory u writing to
;rsi, the source one
;rdx, number of bytes to cpy

;entry point from cpu
memmove:
    cmp rdi, rsi
    ja reverse;jump if above, *b (rdi) > *a (rsi)

;memcpy basicly
forward:
    cmp rdx, 0; compare size to 0
    je return
    mov cl, BYTE[rsi] ; char rcx , then went to rsi address and shoved a byte from there inside rcx
    mov BYTE[rdi], cl ; byte = i wan access it as a byte, [] = mean i m accessig memory
    inc rsi ;
    inc rdi
    dec rdx
    jmp forward

reverse:
    add rdi, rdx; modified destination pointer, to point to the end of the array
    add rsi, rdx

reverse_loop:
    cmp rdx, 0
    je return
    dec rdi
    dec rsi
    dec rdx
    mov cl, BYTE[rsi] ; char rcx , then went to rsi address and shoved a byte from there inside rcx
    mov BYTE[rdi], cl
    jmp reverse_loop

return:
    ret
