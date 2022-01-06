
; === this file about varibales in assembly ===


; when we store/reserve variables
section .data

	; syntax example ==> var_name reserve_type value/values...
			

section .text
	global _start

	; main start point
_start : 
	mov ebx , 1 	; arg for write
	mov ecx , 'M'	; use varbiable
	mov edx , 1 	; length of var
	mov eax , 4 	; syscall write

	int 20h 

	mov eax , 1 	; return 0
	int 20h


