%include 'in_out.asm'
section .data
    msg_x db 'Введите x: ', 0h
    msg_a db 'Введите a: ', 0h
    msg_result db 'Результат f(x): ', 0h
section .bss
    x resb 10
    a resb 10
    result resb 1
section .text
global _start
_start:
    ; Ввод значения x
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 10
    call sread
    ; Ввод значения a
    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 10
    call sread
    ; Преобразование x и a из строк в числа
    mov eax, x
    call atoi
    mov [x], eax

    mov eax, a
    call atoi
    mov [a], eax
    ; --- Вычисление функции f(x) --
    mov ebx, [x]      ; ebx = x
    mov ecx, [a]      ; ecx = a
    
    cmp ebx, ecx
    jg case_x_less_a  ; если x < a, переход 
    
case_x_ge_a:
    mov eax, ecx
    add eax, 10
    mov [result], eax
    jmp output_result
     
case_x_less_a:
    mov eax, ebx      
    add eax, 10        
    mov [result], eax
output_result:
    ; Вывод результата
    mov eax, msg_result
    call sprint
    mov eax, [result]
    call iprintLF

    call quit