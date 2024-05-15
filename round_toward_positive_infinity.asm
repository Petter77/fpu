section .text
global round_toward_positive_infinity

round_toward_positive_infinity:
    sub esp, 2
    mov word [esp], 0x087F
    fldcw [esp]
    add esp, 2
    ret