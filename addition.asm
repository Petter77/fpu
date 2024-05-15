section .text
global addition

addition:
    enter 0,0
    fld qword [ebp + 8]
    fld qword [ebp + 16]
    faddp st1
    leave
    ret