section .data
section .data
invalid_operation db 'Invalid operation', 10, 0
divide_by_zero db 'Divide-by-zero', 10, 0
denormal_operand db 'Denormal operand', 10, 0
numeric_overflow db 'Numeric overflow', 10, 0
numeric_underflow db 'Numeric underflow', 10, 0
inexact_result db 'Inexact result (Precision)', 10, 0

section .text
global exception_handling

exception_handling:
    enter 0,0
    ;fstsw ax
    ;and ax, 111111b

    .invalid_operation:
        fstsw ax
        and ax, 000001b


    leave
    ret