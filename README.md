## assembly_examples
### - hi there 😄, i put here some **examples of assembly** code as references 👽
### - you can use it too or learn from it as well as you can 
### - note : all examples here for **NASM & x86 & LINUX**

## example for linux :
 ```assembly
section .data
	msg: db "hello world assembly", 10	; variable msg string with '\n' <= 10 
	len: equ $- msg				; variable len for store length of msg 
	
; main start point like main function in c/c++
section .text
	global _start

_start :
	; small example of call system for write/print 
	; syscall like any function required paramaeters (eax , ebx , ecx , edx)
	; you can see all syscall's in linux here : http://faculty.nps.edu/cseagle/assembly/sys_call.html
  
	mov eax, 4 		; put 4 mean write syscall	
	mov ebx, 1		; file descriptor 1 - standard output
	mov ecx, msg 		; data you want to write
	mov edx, len		; data length

	int 80h			; call the kernel => "interpret/execute" 

	mov eax,1 		; syscall for exit
	mov ebx,0 		; exit with code 0 like C/C++ => "return 0"
	
	int 80h			; call again the kernel => "interpret/execute" 
 ```
