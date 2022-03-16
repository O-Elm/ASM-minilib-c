BITS 64
section .text
global strpbrk

;const char * strpbrk ( const char * str1, const char * str2 );
;char str[] = "This is a sample string"; << rdi
;char str2[] = "aei"; << rsi
; those > i i a a e i need to be found on that str

strpbrk:
	mov     rcx, 0

loop:
	mov     dl, BYTE [rdi + rcx] ; rcx is inndice to walk through string
	cmp     dl, 0
	je      return_zero
	inc     rcx
	mov     r9, 0

second_loop:
	mov     r8b, BYTE [rsi + r9] ; r9 is also indice being incremented only when the comparison fail
	cmp     r8b, 0
	je	    loop
	cmp	    dl, r8b
	je	    return
	inc	    r9
	jmp	    second_loop

return:
	sub	    rcx, 1
	add	    rdi, rcx
	mov	    rax, rdi
	ret

return_zero:
	mov	    rax, 0
	ret