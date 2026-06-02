%include 'in_out.asm'
SECTION .data
msg db "Результат: ",0
SECTION .text
global _start

func:
push ebx
mov ebx, 6
imul ebx
add eax, 13
pop ebx
ret
_start:
pop ecx
pop edx
sub ecx,1
mov esi, 0
next:
cmp ecx,0h
jz _end
pop eax
call atoi
call func
add esi, eax
loop next
_end:
mov eax, msg
call sprint
mov eax, esi
call iprintLF 
call quit