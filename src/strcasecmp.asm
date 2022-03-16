BITS 64
section .text
global strcasecmp

;int strcasecmp(const char *s1, const char *s2);

strcasecmp: ; just checking for error handling if they give us an empty string
    cmp rdi, 0
    je return
    cmp rsi, 0
    je return

return:
    mov rax, 0
    ret