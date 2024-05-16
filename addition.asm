section .text
global addition
extern exception_handling

addition:
    enter 0,0
    fld qword [ebp + 8]
    fld qword [ebp + 16]
    faddp st1
    call exception_handling
    leave
    ret