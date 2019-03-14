; x86

section .text

    global _start

_start:

  mov rdi, -50
  mov rdx, 50
  call fizzBuzz

  mov     ebx,0                 ; exit code - successful
  mov     eax,1                 ; sys_exit
  int     0x80


fizzBuzz:
  cmp rdi, rdx
  jg finishFizzBuzz

  mov edx, 0
  mov eax, rdi
  imul 15
  cmp edx, 0
  je  printFizzBuzz

  mov eax, rdi
  imul 3
  cmp edx, 0
  je printFizz

  mov eax, rdi
  imul 5
  cmp edx, 0
  je printBuzz

  jmp fizzBuzzLoopEnd

fizzBuzzLoopEnd:
  inc rdi
  jmp fizzBuzz
finishFizzBuzz:
  ret

printFizzBuzz:
  mov     edx,fizzbuzzLength    
  mov     ecx,fizzbuzz          
  mov     ebx,1                 ; file handle (stdout)
  mov     eax,4                 ; sys_write
  int     0x80

  jmp fizzBuzzLoopEnd

printFizz:
  mov     edx,fizzLength    
  mov     ecx,fizz          
  mov     ebx,1                 ; file handle (stdout)
  mov     eax,4                 ; sys_write
  int     0x80

  jmp fizzBuzzLoopEnd

printBuzz:
  mov     edx,buzzLength    
  mov     ecx,buzz          
  mov     ebx,1                 ; file handle (stdout)
  mov     eax,4                 ; sys_write
  int     0x80

  jmp fizzBuzzLoopEnd

section .data

fizz            db "Fizz",0xa
buzz            db "Buzz",0xa
fizzbuzz        db "FizzBuzz",0xa

fizzLength      equ $ - fizz
buzzLength      equ $ - buzz
fizzbuzzLength  equ $ - fizzbuzz