section .data
divide_by_zero_msg db 'Error: Division by zero',13,10,'$'

section .text
global division
extern printf, exit

division:
    enter 0,0
    fld qword [ebp + 8]
    fld qword [ebp + 16]
    fdivp st1
    fstsw ax
    cmp eax, 3804h
    je .divide_by_zero
    leave
    ret

.divide_by_zero:
    push divide_by_zero_msg
    call printf
    add esp, 4
    push 1
    call exit