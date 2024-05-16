section .data
section .data
invalid_operation db 'Warning: Invalid operation', 10, 0
denormal_operand db 'Warning: Denormal operand', 10, 0
divide_by_zero db 'Warning: Divide by zero', 10, 0
numeric_overflow db 'Warning: Numeric overflow', 10, 0
numeric_underflow db 'Warning: Numeric underflow', 10, 0
inexact_result db 'Warning: Inexact result (Precision)', 10, 0

section .text
extern printf
global exception_handling


exception_handling:
    enter 0,0
    ;fstsw ax
    ;and ax, 111111b

        .invalid_operation:
        fstsw ax
        and ax, 000001b
        cmp ax, 1
        jne .denormal_operand
        push invalid_operation
        call printf
        add esp, 4
        push 1

        .denormal_operand:
        fstsw ax
        and ax, 000010b
        cmp ax, 2
        jne .divide_by_zero
        push denormal_operand
        call printf
        add esp, 4
        push 1

        .divide_by_zero:
        fstsw ax
        and ax, 000100b
        cmp ax, 4
        jne .numeric_overflow
        push divide_by_zero
        call printf
        add esp, 4
        push 1

        .numeric_overflow:
        fstsw ax
        and ax, 001000b
        cmp ax, 8
        jne .numeric_underflow
        push numeric_overflow
        call printf
        add esp, 4
        push 1


        .numeric_underflow:
        fstsw ax
        and ax, 010000b
        cmp ax, 16
        jne .inexact_result
        push numeric_underflow
        call printf
        add esp, 4
        push 1


        .inexact_result:
        fstsw ax
        and ax, 100000b
        cmp ax, 32
        jne .exit
        push inexact_result
        call printf
        add esp, 1
        push 1

        .exit:
        leave
        ret
