INCLUDE Irvine32.inc

.data
    week1 DWORD 10, 20, 7, 9, 30
    week2 DWORD 7, 10, 15, 5, 20
    total_sales DWORD 5 DUP(?)

.code
main proc
    mov esi, OFFSET week1
    mov edi, OFFSET week2
    mov ebx, OFFSET total_sales
    mov eax, [esi]
    add eax, [edi]
    mov [ebx], eax

    add esi, TYPE week1
    add edi, TYPE week2
    add ebx, TYPE total_sales
    mov eax, [esi]
    add eax, [edi]
    mov [ebx], eax

    add esi, TYPE week1
    add edi, TYPE week2
    add ebx, TYPE total_sales
    mov eax, [esi]
    add eax, [edi]
    mov [ebx], eax

    add esi, TYPE week1
    add edi, TYPE week2
    add ebx, TYPE total_sales
    mov eax, [esi]
    add eax, [edi]
    mov [ebx], eax

    add esi, TYPE week1
    add edi, TYPE week2
    add ebx, TYPE total_sales
    mov eax, [esi]
    add eax, [edi]
    mov [ebx], eax

    mov esi, OFFSET total_sales
    mov ecx, 5

print:
    mov eax, [esi]
    call WriteDec
    mov eax, 32
    call WriteChar
    add esi, 4

    loop print    

    exit
main ENDP
END main
