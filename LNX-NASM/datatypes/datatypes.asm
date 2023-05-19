; === assembly varibales example ===


; when we store/reserve variables
section .data

	; syntax : var_name reserve_type value/values...
	mchar: dw 65,10
	len : equ $- mchar		

section .text
	global _start

	; entry point like main in C/C++
_start :
   	mov	eax,4			; 4 -> sys_write
  	mov	ebx,1			; file descriptor (stdout)
   	mov	ecx,mchar		; message to print
	mov	edx,len			; message length

	int 80h				; execute the above

	mov eax , 1			; 1 -> sys_exit
	int 80h				; execute the above


