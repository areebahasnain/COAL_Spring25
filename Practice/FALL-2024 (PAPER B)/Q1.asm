INCLUDE Irvine32.inc

.data
    expenseCategoryA SBYTE 10
    expenseCategoryB SBYTE 20
    totalIncome WORD 150
    totalExpense DWORD 0
    remaining_expense DWORD 0

.code
main proc
    movsx eax, expenseCategoryA
    movsx ebx, expenseCategoryB
    movzx ecx, totalIncome

    add totalExpense, eax
    add totalExpense, ebx

    add eax, 10
    mov expenseCategoryA, al

    xchg eax, ebx

    sub ecx, totalExpense
    mov remaining_expense, ecx
    cmp remaining_expense, 0

    jge output_result ; remaining amount is positive
    neg ecx
    mov remaining_expense, ecx

output_result:
    ; TOTAL EXPENSES
    mov eax, totalExpense
    call writeDec
    call crlf

    ; ADJUSTED EXXPENSES FOR CATEGORY A
    movsx eax, expenseCategoryA
    call writeInt
    call crlf

    ; REMAINING INCOME
    mov eax, remaining_expense
    call writeDec
	    

    exit
main ENDP
END main
