INCLUDE Irvine32.inc

.data
    employee_count = 5
    buffer_size = 20

    ids DWORD employee_count DUP(?)
    names BYTE employee_count * buffer_size DUP(0)
    birth_year DWORD employee_count DUP(?)
    annual_Salary DWORD employee_count DUP(?)

    prompt_id BYTE "Enter Employee ID: ", 0
    prompt_name BYTE "Enter Employee Name: ", 0
    prompt_year BYTE "Enter Year of Birth: ", 0
    prompt_salary BYTE "Enter Annual Salary: ", 0
    prompt_total BYTE "Total Annual Salary: ", 0

.code
read_name proc uses edx ecx edi
	push edx
	push ecx
	push edi

	mov edx, offset names
	mov edi, esi
	imul edi, buffer_size
	add edx, edi
	mov ecx, buffer_size
	call readstring

	pop edi
	pop ecx
	pop edx
	ret
read_name endp

main PROC
    mov ecx, employee_count
    mov esi, 0

input:
    mov edx, offset prompt_id
    call writestring
    call readint
    mov ids[esi * TYPE ids], eax

    mov edx, offset prompt_name
    call writestring
    call read_name

    mov edx, offset prompt_year
    call writestring
    call readint
    mov birth_year[esi * TYPE birth_year], eax

    mov edx, offset prompt_salary
    call writestring
    call readint
    mov annual_Salary[esi * TYPE annual_Salary], eax

    inc esi
    loop input

    mov ecx, employee_count
    mov esi, 0
    mov eax, 0
    
total:
    add eax, annual_Salary[esi * TYPE annual_Salary]
    inc esi
    loop total

    call crlf
    mov edx, offset prompt_total
    call writestring
    call writeDec

    exit
main ENDP
END main
