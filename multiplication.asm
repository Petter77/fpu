section .text
global multiplication

multiplication:
    enter 0,0
    fld qword [ebp + 8]
    fld qword [ebp + 16]
    fmulp st1
    leave
    ret