section .data
	msg: db "hello world assembly", 10	 ; variable msg = string with '\n' <= 10;
	len: equ $- msg 	 	 ; length of variale msg 
	

; main start point like main function in c/c++
section .text
	global _start


_start :
	; syscall like function syscall(eax , ebx , ecx , edx)
	mov eax, 4 		; syscall for write	
	mov ebx, 1		; argument for syscall
	mov ecx, msg 	; arguemnt msg 
	mov edx, len	; argument msg length

	int 80h 		; call the kernel & execute all above instruction 

	mov eax,1 		; syscall for exit
	mov ebx,0 		; exit with code 0 => "return 0"
	
	int 80h			; execute agian


