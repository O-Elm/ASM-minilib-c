BITS 64
section .text
global strncmp

;rdi string 1
;rsi, string 2
;rdx number of byte to check
;r8b and cl(str1) to compare char

strncmp:
    cmp rdx, 0; my counter to check how many byte i need to compare
    je return_equal
    mov cl, BYTE[rdi]; first av
    mov r8b, BYTE[rsi]; second av
    cmp cl, r8b ;comparing the first byte of each av
    ja return_bigger
    jb return_smaller
    cmp cl, 0; no need r8b cus they are same anyway
    je return_equal
    inc rdi
    inc rsi
    dec rdx
    jmp strncmp;repeat until end or in this case until rdx is 0

return_equal:
    mov rax, 0
    ret

return_smaller:
    mov rax, -1
    ret

return_bigger:
    mov rax, 1
    ret