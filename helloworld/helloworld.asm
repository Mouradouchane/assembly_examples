section .data
	msg: db "hello assembly my name is mourad ;)", 10	 ; string msg = "a message" + '\n';
	len: equ $- msg 	 	 ; len = msg.length
	
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
