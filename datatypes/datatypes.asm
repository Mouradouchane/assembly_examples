; === assembly varibales example ===


; when we store/reserve variables
section .data

	; syntax : var_name reserve_type value/values...
	mchar: dw 65,10
	len : equ $- mchar		

section .text
	global _start

	; main start point
_start :
   	mov	eax,4		  ;system call number (sys_write)
  	mov	ebx,1		  ;file descriptor (stdout)
   	mov	ecx,mchar     ;message to write
	mov	edx,len		  ;message length

	int 80h 

	mov eax , 1 	; return 0
	int 80h


