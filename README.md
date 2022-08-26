## assembly_examples
### - hi there 😄, i put here some **examples of assembly** code as references 👽
### - you can use it too or learn from it as well as you can 
### - note : all examples here right now for **NASM x86 LINUX** later i will add examples for **MASM x86 WINDOWS**

## NASM example :
note : this is a "hello world" example without explanation , the explanation in bottom .

 ```assembly
section .data

	msg: db "hello world assembly", 10
	len: equ $- msg
	
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

## example explanation

```assembly
section .data ; this is data section where we store "data/variables"
```
 
```assembly
msg: db "hello world assembly", 10
; msg => name of variable
; db  => 'define byte' to reserve 8bit in memory 
; 10  => mean '\n' new line 
	
; note : in assembly there is no 'data-types' unlike other high level programming language like "Python/C/C++/..."
; so basically we reserve places in memory using "db,dw,..." and then we put our 'variables/data' on it 
```

```assembly
len: equ $- msg
; len => "varaible/predefined directive" "without defined size db,dw,..." , just for store length of string in variable msg 
; it's like #define len in C/C++
; note : '$ -' it's a kind of complex operation to you right now as beginner , don't focus on it and keep in mind we using it to get length of something 
```
