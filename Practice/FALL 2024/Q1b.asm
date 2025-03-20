INCLUDE Irvine32.inc

.data
    rollNumber BYTE "23K-0059", 0  
    length DWORD 8                
    alphaCount DWORD 0             
.code
main PROC
    mov ecx, length                ; Loop counter = length of roll number
    mov esi, OFFSET rollNumber     ; Point to the roll number array
    mov eax, 0                     ; Clear counter

checkChar:
    mov dl, [esi]                  ; Load current character
    cmp dl, 'A'                    ; Check if >= 'A'
    jl notAlpha                    ; If less, not an alphabet
    cmp dl, 'Z'                    ; Check if <= 'Z'
    jle isAlpha                    ; If within range, it's an alphabet
    cmp dl, 'a'                    ; Check if >= 'a'
    jl notAlpha                    ; If less, not an alphabet
    cmp dl, 'z'                    ; Check if <= 'z'
    jg notAlpha                    ; If greater, not an alphabet

isAlpha:
    inc eax                         ; Increment alphabet count

notAlpha:
    inc esi                         ; Move to next character
    loop checkChar                  ; Repeat for all characters

    mov alphaCount, eax             ; Store count in variable

    call Clrscr
    mov eax, alphaCount
    call WriteDec                 
    call Crlf

    exit
main ENDP
END main
