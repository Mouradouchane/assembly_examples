.386
.model flat, stdcall

option casemap :none

include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
include C:\masm32\include\masm32.inc

includelib C:\masm32\lib\kernel32.lib
includelib C:\masm32\lib\masm32.lib


.data
    cvar db "pause",0
    n1 db "press something :"

.code 
_start:

    invoke StdOut , addr n1
    
    invoke StdIn , addr cvar , 1

    invoke ExitProcess , 0

end _start