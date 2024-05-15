all:
	#operations
	nasm -f elf32 -g -o addition addition.asm
	nasm -f elf32 -g -o subtraction subtraction.asm
	nasm -f elf32 -g -o multiplication multiplication.asm
	nasm -f elf32 -g -o division division.asm
	#roundings
	nasm -f elf32 -g -o round_to_nearest round_to_nearest.asm
	nasm -f elf32 -g -o round_toward_zero round_toward_zero.asm
	nasm -f elf32 -g -o round_toward_negative_infinity round_toward_negative_infinity.asm
	nasm -f elf32 -g -o round_toward_positive_infinity round_toward_positive_infinity.asm
	#main
	gcc -m32 -o main main.c addition subtraction multiplication division round_to_nearest round_toward_zero round_toward_negative_infinity round_toward_positive_infinity

	gdb -x ttt main

	#testing
	#./main 1 / 9
	#./main 1 / 9 0
	#./main 1 / 9 1
	#./main 1 / 9 3
	#./main 1 / 9 2
