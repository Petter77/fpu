section .text
global round_to_nearest

round_to_nearest:
    sub esp, 2
    mov word [esp], 0x027F
    fldcw [esp]
    add esp, 2
    ret