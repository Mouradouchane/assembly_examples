
default :
	@ echo "make file need arguments"

build:

ifeq ($(sys),windows)
	@ echo "build for ${sys} in progress"

	# compile
	ml /c /Zd /coff "$file_name.asm"

	# link
	link "$file_name.obj" /subsystem:console

	# run
	
endif

ifeq ($(sys),linux)
	@ echo "build for ${sys} in progress"

	# compile
	nasm -f elf $1/$1.asm

	# link
	ld -s $1/$1.o -o $1/$1 

	# run

endif

clean:
	@ echo "cleaning build"
	@ rm -rf output/*

rebuild : build clean
	
help : 
	@ echo "commands :: "
	@ echo "*example*:: make build sys=windows example=hello_world"
	@ echo
	@ echo "- build   : to compile and link assembly example"
	@ echo "- rebuild : to clean all and build assembly example"
	@ echo "- clean   : to clean build file from pre-builded examples"

define func
# end of function defintion
endef 



