section .text
global subtraction
extern exception_handling

subtraction:
    enter 0,0
    fld qword [ebp + 8]
    fld qword [ebp + 16]
    fsubp st1
    call exception_handling
    leave
    ret