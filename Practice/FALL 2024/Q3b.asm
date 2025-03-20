INCLUDE Irvine32.inc
.data
    subject1 DWORD 70, 45, 60, 55, 80    ; Marks of 5 students in subject 1
    subject2 DWORD 65, 55, 80, 50, 70    ; Marks of 5 students in subject 2
    subject3 DWORD 80, 65, 50, 60, 90    ; Marks of 5 students in subject 3
    passCount DWORD 0                    ; Counter for students who passed all subjects
    resultMsg BYTE "Number of students who passed all subjects: ", 0
    
.code
main PROC
    mov ecx, 5                ; Loop counter for 5 students
    mov esi, 0                ; Index to access student marks
    mov ebx, 0                ; Will hold the pass count
    
checkStudents:
    mov eax, 1                ; Flag to track if current student passed all subjects (1=passed, 0=failed)
    
    ; Check Subject 1
    mov edx, subject1[esi]
    cmp edx, 50
    jae checkSubject2         ; Jump if mark >= 50 (passed)
    mov eax, 0                ; Set flag to 0 (failed) if mark < 50
    jmp nextStudent           ; No need to check other subjects
    
checkSubject2:
    ; Check Subject 2
    mov edx, subject2[esi]
    cmp edx, 50
    jae checkSubject3         ; Jump if mark >= 50 (passed)
    mov eax, 0                ; Set flag to 0 (failed) if mark < 50
    jmp nextStudent           ; No need to check other subjects
    
checkSubject3:
    ; Check Subject 3
    mov edx, subject3[esi]
    cmp edx, 50
    jae studentPassed         ; Jump if mark >= 50 (passed)
    mov eax, 0                ; Set flag to 0 (failed) if mark < 50
    jmp nextStudent           ; Continue to next student
    
studentPassed:
    ; If we reach here, student passed all subjects
    add ebx, 1                ; Increment pass count
    
nextStudent:
    add esi, 4                ; Move to next student (4 bytes per DWORD)
    loop checkStudents        ; Continue for all students
    
    ; Display result
    mov edx, OFFSET resultMsg
    call WriteString
    mov eax, ebx              ; Move pass count to eax for display
    call WriteDec
    call Crlf
    
    exit
main ENDP
END main
