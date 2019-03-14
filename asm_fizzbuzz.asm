section .text

    global _start

_start:

  mov rdi, 5                    ; Start of FizzBuzz range
  neg rdi                       ; Negate the start of the range
  mov rsi, 5                    ; End of the FizzBuzz range

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
  cmp rax, 0                    ; check rax and get the abs
  jge continueFizzBuzzCheck
  neg rax
continueFizzBuzzCheck:
  idiv rbx
  cmp rdx, 0
  je  printFizzBuzz

  ; Print Fizz
  mov rdx, 0
  mov rax, rdi
  mov rbx, 3
  cmp rax, 0                    ; check rax and get the abs
  jge continueFizzCheck
  neg rax
continueFizzCheck:
  idiv rbx
  cmp rdx, 0
  je printFizz

  ; Print Buzz
  mov rdx, 0
  mov rax, rdi
  mov rbx, 5
  cmp rax, 0                    ; check rax and get the abs
  jge continueBuzzCheck
  neg rax
continueBuzzCheck:
  idiv rbx
  cmp rdx, 0
  je printBuzz
  jmp printIndex

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



printIndex:

  mov     [myNumber], rax
  mov     rcx, myNumber
  mov     rdx, 1       
  mov     rbx,1                 ; file handle (stdout)
  mov     rax,4                 ; sys_write
  int     0x80

  mov     rdx,newlineLength    
  mov     rcx,newline     
  mov     rbx,1                 ; file handle (stdout)
  mov     rax,4                 ; sys_write
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

  newline         db '',0xa
  newlineLength   equ $ - newline

section .bss
  myNumber resb 1