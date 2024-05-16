section .text
global multiplication
extern exception_handling
multiplication:
    enter 0,0
    fld qword [ebp + 8]
    fld qword [ebp + 16]
    fmulp st1
    call exception_handling
    leave
    ret