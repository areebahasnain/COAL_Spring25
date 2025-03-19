INCLUDE Irvine32.inc

.data
    prompt_name BYTE "Enter your name: ", 0
    prompt_genre BYTE "Enter your preferred genre of books: ", 0

    username BYTE 30 DUP(0)
    genre BYTE 30 DUP(0)
    cardNumber DWORD 0
    message BYTE "Library Card Number: ", 0

.code
main proc
    mov edx, OFFSET prompt_name
    call WriteString
    mov edx, OFFSET username
    mov ecx, 30
    call ReadString

    mov edx, OFFSET prompt_genre
    call WriteString
    mov edx, OFFSET genre
    mov ecx, 30
    call ReadString

    call Randomize
    mov eax, 10000 ; set range
    call RandomRange
    add eax, 10000
    mov cardNumber, eax

    mov edx, OFFSET message
    call WriteString
    call WriteDec

    exit
main ENDP
END main
