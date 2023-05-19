
winfolder="WIN-MASM"
lnxfolder="LNX-NASM"

default :
	@ echo "make file need arguments"

build :

ifeq ($(sys),windows)
	@ echo "build for ${sys} in progress"

	@ echo compile :
	ml /c /Zd /coff ${winfolder}/${example}/${example}.asm

	@ echo link :
	link /subsystem:console ${winfolder}/${example}/${example}.obj 

	@ echo "build for ${sys} succeeded"

	@ echo run :
	./${winfolder}/${example}/${example}.exe

endif

ifeq ($(sys),linux)

	@ echo "build for ${sys} in progress" 

	@ echo compile :
	nasm -f elf "${lnxfolder}/${example}/${example}.asm" 

	@ echo link :
	ld -s "${lnxfolder}/${example}/${example}.o" -o "${lnxfolder}/${example}/${example}" 

	@ echo "build for ${sys} succeeded" 

	@ echo :
	./${lnxfolder}/${example}/${example} 


endif


clean :
	@ echo "cleaning ${example}"
ifeq (${sys},windows) 
	@ rm -rf ${winfolder}/${example}/${example}.exe
	@ rm -rf ${winfolder}/${example}/${example}.obj
endif
ifeq (${sys},linux) 
	@ rm -rf ${lnxfolder}/${example}/${example}.exe
	@ rm -rf ${lnxfolder}/${example}/${example}.obj
endif
	@ echo "cleaning done"


help : 
	@ echo "commands :"
	@ echo "build  : to compile and link assembly example"
	@ echo "clean  : to clean build file from pre-builded examples"
	@ echo 
	@ echo "examples :"
	@ echo "make build sys=windows example=helloworld"
	@ echo "make clean sys=linux example=helloworld"


