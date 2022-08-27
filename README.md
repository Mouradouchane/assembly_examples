## assembly_examples
### - hi there 😄, i put here some **examples of assembly** code as references 👽
### - you can use it too or learn from it as well as you can 
### - note : all examples here right now for **NASM x86 LINUX** later i will add examples for **MASM x86 WINDOWS**

<details open> 

<summary> 
<h2> NASM x86 Example </h2>
</summary> 

note : this is a "hello world" example without explanation => the explanation in bottom of this example .

 ```assembly
section .data

	msg: db "hello world assembly", 10
	len: equ $- msg
	

section .text
	global _start

_start :

	mov eax, 4 		
	mov ebx, 1		
	mov ecx, msg 		
	mov edx, len		

	int 80h			

	mov eax,1 	
	mov ebx,0 	
	
	int 80h	
 ```
</details> 

<details open> 

<summary> 
<h2> NASM x86 Example Explanation </h2>
</summary>

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

```assembly
section .text ; this is text section where we store "code/instructions"
```


```assembly
global _start ; scope where execution should start from , it's basically like main function in C/C++

_start : ; it's scope with name '_start' can contain "code/instructions"
```

note : now we ready to start writing our "code/instruction" and execute them .

```assembly
; this is a small example of call system for write/print operation
; syscall like any function required paramaeters (eax , ebx , ecx , edx)
; you can see all syscall's in linux here : http://faculty.nps.edu/cseagle/assembly/sys_call.html

; what we trying to achive here it's someting like this :
; syscall( 4 , 1 , msg , len );
; in high level programming languages 

mov eax, 4 	; put 4 in register eax , 4 mean "request for write" to syscall	
mov ebx, 1	; put 1 in register ebx , 1 for file descriptor 'standard output'
mov ecx, msg 	; put msg in register ecx , data/string you want to write/print
mov edx, len	; put len in edx , lenght of that msg  

int 80h		; Interrupt with code 80h in hexadecimal , you can take a look at the syscall's above for more details
```

note : now after what we did all we want , we should close/exit our program , to do that it's quite simple .
```assembly
mov eax,1 	; move 1 to eax register , for exit
mov ebx,0 	; move 0 to ebx register , to exit with code 0 like C/C++ "return 0" in main function

int 80h		; Interrupt again with 80h 
```

</details>

<details close>

<summary> 
<h2> MASM x86 Example </h2>
</summary>

note : this is a "hello world" example without explanation => the explanation in bottom of this example .

```assembly
.386
.model flat, stdcall

option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
    HelloWorld db "Hello World!", 0

.code
    start:

    invoke StdOut, addr HelloWorld
    invoke ExitProcess, 0

    end start
```

</details>
