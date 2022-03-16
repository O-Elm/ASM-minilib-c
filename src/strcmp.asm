BITS 64
section .text
global strcmp


;rdi string 1
;rsi, string 2
;dl and cl(str1) to compare char

strcmp:
    mov cl, BYTE[rdi]
    mov dl, BYTE[rsi]
    cmp cl, dl
    ja return_bigger
    jb return_smaller
    cmp cl, 0; no need dl cus they are same anyway
    je return_equal
    inc rdi
    inc rsi
    jmp strcmp

return_equal:
    mov rax, 0
    ret

return_smaller:
    mov rax, -1
    ret

return_bigger:
    mov rax, 1
    ret