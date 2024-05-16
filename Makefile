all:
	#operations
	nasm -f elf32 -g -o addition addition.asm
	nasm -f elf32 -g -o subtraction subtraction.asm
	nasm -f elf32 -g -o multiplication multiplication.asm
	nasm -f elf32 -g -o division division.asm
	#roundings
	nasm -f elf32 -g -o set_round set_round.asm
	#exception handling
	nasm -f elf32 -g -o exception_handling exception_handling.asm
	#main
	gcc -m32 -o main main.c addition subtraction multiplication division set_round exception_handling
	#testing
	./main 1.23 x 3.445
	./main 1.23 x 3.445 0
	./main 1.23 x 3.445 1
	./main 1.23 x 3.445 2
	./main 1.23 x 3.445 3

