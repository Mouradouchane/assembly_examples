<h1> assembly_examples </h1>

<h3> 
    hi there 😄, here is some examples of assembly 
    code with a little bit of explanation 👽 , 
    you can use those examples as you want 
</h3>

<br>

<h2> Requirements : </h2>
<p> Windows + MASM || Linux + NASM </p>


<h2> Note : </h2>
<p> 
    in this repo you gonna find <b>tow folders</b> one 
    for windows other or linux , each of them <b>contain 
    the same examples</b> .
</p>

<h2> Build : </h2>
<p>
    - you can build any example in this repo using <b>Makefile</b> .
</p>
<p>
    - use <b>sys=OS</b> to define to make wich OS you building for .
</p>
<p>
    - use <b>example=example_name</b> to define wich code_example you want to build .
</p>
<p>
    - if you using <b>windows</b> you <b>need Cygwin</b> to be abel to use that Makefile to build any example . 
</p>
<p> 
    - example :
</p>
   
```bash
    make build sys=windows example=helloworld
```
    
<p>
    - then if the build process is successed , you gonna find 
    the binary file in that example folder 
</p>

<br>
<h3> HelloWorld Example :</h3>
<p> 
    this is a simple helloworld example for MASM with 
    using StdOut StdIn .
</p>

```assembly

    .386
    .model flat, stdcall

    option casemap :none

    ; include a few files we need in this program

    include c:\masm32\include\windows.inc
    include c:\masm32\include\kernel32.inc
    include c:\masm32\include\masm32.inc

    includelib c:\masm32\lib\kernel32.lib
    includelib c:\masm32\lib\masm32.lib

    ; define tow variable strings in data section
    .data
        HelloWorld db "Hello World", 0
        pause_str db "pause" , 0

    .code
        ; program start at start like main C/C++
        start:

            ; using StdOut for log/write to console
            ; pass address of our variable HelloWorld string
            invoke StdOut, addr HelloWorld
            
            ; using StdIn for get/read inputs from console
            ; in that case were just using it to stop program from exit
            invoke StdIn , addr pause_str , 1
        
            ; last thing is to exit with 0 and that mean everything is ok 
            invoke ExitProcess, 0
            
        end start
``` 
