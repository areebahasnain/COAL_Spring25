INCLUDE Irvine32.inc

.data
    sizeMsg BYTE "Enter the size of the array: ", 0
    elementMsg BYTE "Enter array elements: ", 0
    resultMsg BYTE "Result (1 = All Odd, 0 = Not All Odd): ", 0
    array DWORD 10 DUP(?)  
    arrSize DWORD ?         

.code
main PROC
    ; Prompt for size
    mov edx, OFFSET sizeMsg
    call WriteString
    call ReadInt
    mov arrSize, eax  

    ; Prompt for elements
    mov edx, OFFSET elementMsg
    call WriteString

    mov ecx, eax  ; Set loop counter to array size
    mov esi, OFFSET array  ; Point to the array

inputLoop:
    call ReadInt    ; Read integer input
    mov [esi], eax  ; Store input in array
    add esi, 4      ; Move to the next DWORD space
    loop inputLoop  ; Repeat until all elements are entered

    exit
main ENDP
END main
