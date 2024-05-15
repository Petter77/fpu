section .text
global subtraction

subtraction:
    enter 0,0
    fld qword [ebp + 8]
    fld qword [ebp + 16]
    fsubp st1
    leave
    ret