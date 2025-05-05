``` asm
INCLUDE Irvine32.inc

.data
array DWORD 1,2,3,4,5,6,7,8,9,10
multiplier DWORD 10

.code
main PROC
    cld
    mov esi, OFFSET array   ; Source pointer (read from array[i])
    mov edi, esi            ; Destination pointer (write to array[i])
    mov ecx, LENGTHOF array

    L1:
    lodsd                   ; load [ESI] into EAX
    mul multiplier          ; multiply by eax
    stosd                   ; stor eax into [EDI]
    loop L1

    exit
main ENDP

END main
```
