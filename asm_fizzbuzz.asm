; x86

section .bss

section .data
fizz:       db "Fizz"
buzz:       db "Buzz"
fizzbuzz:   db "FizzBuzz"

section .text
global _start

_start:
  mov rax, -50

  loop:
    push rax
    call fizzBuzz
    pop rax
    inc rax
    cmp rax, 50
    jle loop

  mov rax, 60
  mov rdi, 0
  syscall

fizzBuzz:
