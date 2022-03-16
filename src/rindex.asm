BITS 64
section .text
global rindex
;char *rindex(const char *s, int c);
;rdi = jujubee
;sil = u
;rindex return bee ?

rindex:
    mov     rdx, rdi ; keep track of my pointer
    cmp     rdi, 0
    je      return_zero

go_end:
    cmp     BYTE [rdi], 0 ; advance rdi until end of string
    je      loop
    inc     rdi
    jmp     go_end

loop:
    cmp     BYTE [rdi], sil
    je      return
    cmp     rdi, rdx ;reached the beginning of the string again? If yes, return NULL
    je      return_zero
    dec     rdi     ;go backward
    jmp     loop

return:
    mov     rax, rdi
    ret

return_zero:
    mov     rax, 0
    ret