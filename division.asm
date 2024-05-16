section .text
global division

division:
    enter 0,0
    fld qword [ebp + 8]
    fld qword [ebp + 16]
    fdivp st1
    leave
    ret
