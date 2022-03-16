BITS 64
section .text
global strcspn

;size_t strcspn ( const char * str1, const char * str2 );
;Get span until character in string
;Scans str1 for the first occurrence of any of the characters that are part of str2, returning the number
;of characters of str1 read before this first occurrence.

strcspn:
	mov     rbx, 0
	jmp     loop

first_indice:
	inc     rbx

loop:
	mov     r8b, BYTE [rdi+rbx]
	cmp     r8b, 0
	je      return
	mov     rcx, 0
	jmp     second_loop

second_indice:
	inc     rcx

second_loop:
	mov     dl, BYTE [rsi+rcx]
	cmp     dl, 0
	je      first_indice
	cmp     r8b, dl
	je      return
	jmp     second_indice

return:
	mov     rax, rbx
	ret