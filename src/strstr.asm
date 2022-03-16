BITS 64
section .text
global strstr

;const char * strstr ( const char * str1, const char * str2 );
;Returns a pointer to the first occurrence of str2 in str1,
;or a null pointer if str2 is not part of str1.
strstr:
    cmp     rdi, 0
    je      return_zero
    cmp     rsi, 0
    je      return_zero
	mov     rbx, 0
	jmp     loop

first_indice:
	inc     rbx

loop:
	mov     r8, rbx
	mov     rcx, 0
	jmp     second_loop

second_indice:
	inc     r8
	inc     rcx

second_loop:
	mov     dl, BYTE [rsi+rcx]
	cmp     dl, 0
	je      return
	mov     r9b, BYTE [rdi+r8]
	cmp     r9b, 0
	je      return_zero
	cmp     r9b, dl
	je      second_indice
	jmp     first_indice

return:
	mov     rax, rdi
	add     rax, rbx
	ret

return_zero:
	mov     rax, 0
	ret