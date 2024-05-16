section .text
global division
extern exception_handling

division:
    enter 0,0
    fld qword [ebp + 8]
    fld qword [ebp + 16]
    fdivp st1
    fstsw ax
    sahf
    call exception_handling
    leave
    ret
