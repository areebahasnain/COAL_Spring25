INCLUDE Irvine32.inc

.data
    week1 DWORD 10, 4, 12
    week2 DWORD 9, 5, 10
    week3 DWORD 3, 4, 7
    week4 DWORD 7, 6, 11
    total_cakes DWORD 3 DUP(?)

    msg1 BYTE "Total sales for Cake Type 1: ", 0
    msg2 BYTE "Total sales for Cake Type 2: ", 0
    msg3 BYTE "Total sales for Cake Type 3: ", 0

.code
main PROC
    mov eax, week1[0]
    add eax, week2[0]
    add eax, week3[0]
    add eax, week4[0]
    mov total_cakes[0], eax

    mov eax, week1[4]
    add eax, week2[4]
    add eax, week3[4]
    add eax, week4[4]
    mov total_cakes[4], eax

    mov eax, week1[8]
    add eax, week2[8]
    add eax, week3[8]
    add eax, week4[8]
    mov total_cakes[8], eax

    mov edx, OFFSET msg1
    call WriteString
    mov eax, total_cakes[0]
    call WriteDec
    call CrLf    

    mov edx, OFFSET msg2
    call WriteString
    mov eax, total_cakes[4]
    call WriteDec
    call CrLf

    mov edx, OFFSET msg3
    call WriteString
    mov eax, total_cakes[8]
    call WriteDec
    call CrLf

    exit
main ENDP
END main
