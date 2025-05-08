```asm
INCLUDE Irvine32.inc

.data
  count = 10
  arr WORD count DUP (?)

.code
main PROC
  push OFFSET arr       ; Push address of array
  push count            ; Push number of elements
  call ArrayFill        ; Call the procedure to fill array
  exit                  ; Exit the program
main ENDP               ; <<< END of main

ArrayFill PROC
  push ebp
  mov ebp, esp
  pushad

  mov esi, [ebp + 12]   ; Get array address from stack
  mov ecx, [ebp + 8]    ; Get count from stack

  cmp ecx, 0
  je L2                 ; If count is 0, skip loop

L1:
  mov eax, 100h         ; Upper limit for RandomRange (256)
  call RandomRange
  mov [esi], ax         ; Store random number in array
  add esi, TYPE WORD    ; Move to next array element
  loop L1               ; Loop until ECX = 0

L2:
  popad
  pop ebp
  ret 8                 ; Clean up parameters (2 × 4 bytes)
ArrayFill ENDP

END main               

```
