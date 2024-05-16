section .text
global set_round

set_round:
    enter 0,0
    mov eax, [ebp + 8]
    pushf
	cmp eax, '0'
	je .nearest
	cmp eax, '1'
	je .up
	cmp eax, '2'
	je .down
	cmp eax, '3'
	je .zero

	.nearest
    sub esp, 2
    mov word [esp], 0x033F
    fldcw [esp]
    add esp, 2
    jmp .end

    .up
    sub esp, 2
    mov word [esp], 0x0B3F
    fldcw [esp]
    add esp, 2
    jmp .end

    .down
    sub esp, 2
    mov word [esp], 0x073F
    fldcw [esp]
    add esp, 2
    jmp .end

    .zero
    sub esp, 2
    mov word [esp], 0x0F3F
    fldcw [esp]
    add esp, 2
    jmp .end

    .end
    popf
    leave
    ret