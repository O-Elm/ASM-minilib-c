BITS 64
section .text
global strchr

;rdi string 1
;sil, char from string 2

strchr:
    mov dl, BYTE[rdi]
    cmp sil, dl
    je return_position
    cmp dl, 0 ;no need compare rdi cus the \0 can be inside dl
    je return
    inc rdi
    jmp strchr

return:
    mov rax, 0
    ret

return_position:
    mov rax, rdi
    ret
