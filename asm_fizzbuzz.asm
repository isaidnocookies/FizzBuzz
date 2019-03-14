section .text

    global _start

_start:

  mov rdi, 3
  neg rdi

  mov rsi, 0

  call fizzBuzz

  mov     rbx,0                 ; exit code - successful
  mov     rax,1                 ; sys_exit
  int     0x80

fizzBuzz:
  cmp rdi, rsi
  jg finishFizzBuzz

  cmp rdi, 0
  je printIndex

  ; Print FizzBuzz
  mov rdx, 0
  mov rax, rdi
  mov rbx, 15
  idiv rbx
  cmp rdx, 0
  je  printFizzBuzz

  ; Print Fizz
  mov rdx, 0
  mov rax, rdi
  mov rbx, 3
  idiv rbx
  cmp rdx, 0
  je printFizz

  ; Print Buzz
  mov rdx, 0
  mov rax, rdi
  mov rbx, 5
  idiv rbx
  cmp rdx, 0
  je printBuzz

  jmp printIndex

fizzBuzzLoopEnd:
  inc rdi
  jmp fizzBuzz

finishFizzBuzz:
  ret

printIndex:
  mov     rdx,mynumLength    
  mov     rcx,mynum          
  mov     rbx,1                 ; file handle (stdout)
  mov     rax,4                 ; sys_write
  int     0x80
  jmp fizzBuzzLoopEnd




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

fizz            db 'Fizz',0xa
fizzLength      equ $ - fizz

buzz            db 'Buzz',0xa
buzzLength      equ $ - buzz

fizzbuzz        db 'FizzBuzz',0xa
fizzbuzzLength  equ $ - fizzbuzz

mynum           db '[number]',0xa
mynumLength     equ $ - mynum