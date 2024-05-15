section .text
global round_toward_zero

round_toward_zero:
    sub esp, 2
    mov word [esp], 0x0F7F
    fldcw [esp]
    add esp, 2
    ret