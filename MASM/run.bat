@echo off

::  %1 : first parameter should be a vaild file name
set file_name=%1

echo:

if not defined %1 ( echo "missing file name" 
) else (

    ::  after check start compiling
    echo [compile] %file_name%.asm ... 
    echo:

    ::  after compiling start linking
    echo [link] %file_name%.obj ... 
    echo:


    ::  after compiling and linking exe file should be ready to open
    echo [execute] %file_name%.exe ...
    echo:

)