BITS 64
section .text
global memcpy

; char *juju = can be size of 1 or 2354114 but in either case pointer to the first one, so it doesnt matter
; char rsi = * juju = will always get the first char even if it s an array, unless i increment it.

memcpy:
    cmp rdx, 0; compare size to 0
    je return
    mov cl, BYTE[rsi] ; char rcx , then went to rsi address and shoved a byte from there inside rcx
    mov BYTE[rdi], cl ; byte = i wan access it as a byte, [] = mean i m accessig memory
    inc rsi ;
    inc rdi
    dec rdx
    jmp memcpy

return:
    ret