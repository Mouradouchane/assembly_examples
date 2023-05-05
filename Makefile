
default :
	@ echo "make file need arguments"

build :

ifeq ($(sys),windows)
	@ echo "build for ${sys} in progress"

	# compile
	ml /c /Zd /coff "MASM/${example}/${example}.asm"

	# link
	link "MASM/${example}/${example}.obj" /subsystem:console

	@ echo "build for ${sys} succeeded"

	# run
	./MASM/${example}/${example}.exe

endif

ifeq ($(sys),linux)

	@ echo "build for ${sys} in progress" 

	# compile
	nasm -f elf NASM/${example}/${example}.asm 

	# link
	ld -s NASM/${example}/${example}.o -o NASM/${example}/${example} 

	@ echo "build for ${sys} succeeded" 

	# run
	./NASM/${example}/${example} 


endif


clean :
	@ echo "cleaning ${example}"
ifeq (${sys},windows) 
	@ rm -rf MASM/${example}/${example}.exe
	@ rm -rf MASM/${example}/${example}.obj
endif
ifeq (${sys},linux) 
	@ rm -rf NASM/${example}/${example}.exe
	@ rm -rf NASM/${example}/${example}.obj
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


