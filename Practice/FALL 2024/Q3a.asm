INCLUDE Irvine32.inc
.data
    sizeMsg BYTE "Enter the size of the array: ", 0
    elementMsg BYTE "Enter array elements: ", 0
    resultMsg BYTE "Result (1 = All Odd, 0 = Not All Odd): ", 0
    array DWORD 10 DUP(?)  
    arrSize DWORD ?
    allOdd DWORD 1         ; Flag to track if all numbers are odd (1=true, 0=false)
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
    call Crlf
    
    mov ecx, eax      ; Set loop counter to array size
    mov esi, OFFSET array  ; Point to the array
    
inputLoop:
    call ReadInt      ; Read integer input
    mov [esi], eax    ; Store input in array
    add esi, 4        ; Move to the next DWORD space
    loop inputLoop    ; Repeat until all elements are entered
    
    ; Check if all elements are odd
    mov ecx, arrSize  ; Reset counter to array size
    mov esi, OFFSET array  ; Reset pointer to beginning of array
    
checkLoop:
    mov eax, [esi]    ; Get current element
    test eax, 1       ; Test least significant bit (1 if odd, 0 if even)
    jnz stillOdd      ; Jump if odd (zero flag not set)
    
    ; If we get here, number is even
    mov allOdd, 0     ; Update flag to indicate not all odd
    
stillOdd:
    add esi, 4        ; Move to next element
    loop checkLoop    ; Continue checking until all elements are processed
    
    ; Display result
    mov edx, OFFSET resultMsg
    call WriteString
    mov eax, allOdd
    call WriteDec
    call Crlf
    
    exit
main ENDP
END main
