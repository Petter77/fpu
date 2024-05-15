section .text
global round_toward_negative_infinity

round_toward_negative_infinity:
    sub esp, 2
    mov word [esp], 0x047F
    fldcw [esp]
    add esp, 2
    ret