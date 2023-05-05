.386
.model flat, stdcall

option casemap :none

include c:\masm32\include\windows.inc
include c:\masm32\include\kernel32.inc
include c:\masm32\include\masm32.inc

includelib c:\masm32\lib\kernel32.lib
includelib c:\masm32\lib\masm32.lib


.data
    HelloWorld db "Hello World", 0
    pause_str db "pause" , 0

.code
    start:

        invoke StdOut, addr HelloWorld
        
        invoke StdIn , addr pause_str , 1
    
        invoke ExitProcess, 0
        
    end start