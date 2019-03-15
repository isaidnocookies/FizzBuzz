section .text

    global _start

_start:
  mov rdi, 3                    ; Start of FizzBuzz range
  neg rdi                       ; Negate the start of the range
  mov rsi, 15                    ; End of the FizzBuzz range

  call fizzBuzz                 ; You know...

  mov     rbx,0                 ; exit code - successful
  mov     rax,1                 ; sys_exit
  int     0x80





;; Print fizzbuzz......
;; ************************************************
fizzBuzz:
  cmp rdi, rsi
  jg finishFizzBuzz

  cmp rdi, 0
  jne continueFizzBuzz
  call printIndex
  jmp fizzBuzzLoopEnd
continueFizzBuzz:  

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
  call printIndex

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
;; ************************************************





; function to print from rdi (the index from fizzbuzz)
;; ************************************************
printIndex:
  push    rdi
  push    rax
  push    rsi

  mov rbx, 1
  mov [first], rbx

  cmp rdi, 0
  jg printIndexLoop
  cmp rdi, 0
  je printZero
  neg rdi
  mov     [index], rdi
  mov     rcx, minusSign        ; print '-' with the sys_write
  mov     rdx,1
  mov     rbx,1                 ; file handle (stdout)
  mov     rax,4                 ; sys_write
  int     0x80
  jmp printIndexLoop

printZero:
  mov rax, '0'
  mov [num], rax
  mov rax, 4
  mov rbx, 1
  push rcx

  mov rcx, num        
  mov rdx, 1        
  int 0x80

  add rsp, 8
  jmp endPrintIndexLoop

printIndexLoop:
  mov rdx, index
  mov rsi, largestMagnitude
  div rsi

  cmp rdx, 0
  jne printCharacter
  mov rsi, largestMagnitude
  mov [index], rdx
  mov [char], rax

printCharacter:
  mov rax, char
  mov rcx, '0'
  add rcx, rax
  mov     rdx,1
  mov     rbx,1                 ; file handle (stdout)
  mov     rax,4                 ; sys_write
  int     0x80

  mov rdx, index
  mov rsi, 10
  div rsi
  mov [largestMagnitude], rax
  cmp rax, 0
  je endPrintIndexLoop
  jmp printIndexLoop

  ;mov rax, '1'
  ;mov [num], rax
  ;mov rax, 4
  ;mov rbx, 1
  ;push rcx

  ;mov rcx, num        
  ;mov rdx, 1        
  ;int 0x80

  ;add rsp, 8

endPrintIndexLoop:

  call printNewline
  
  pop rsi
  pop rax
  pop rdi
  
  ret
;; ************************************************





;; function to print a new line character to stdout
;; ************************************************
printNewline:

  push    rdx
  push    rcx
  push    rax

  mov     rdx,newlineLength    
  mov     rcx,newline     
  mov     rbx,1                 ; file handle (stdout)
  mov     rax,4                 ; sys_write
  int     0x80

  pop     rax
  pop     rcx
  pop     rdx
  
  ret
;; **********************************************





;; Data section
;; ************************************************
section .data

  fizz              db 'Fizz',0xa
  fizzLength        equ $ - fizz

  buzz              db 'Buzz',0xa
  buzzLength        equ $ - buzz

  fizzbuzz          db 'FizzBuzz',0xa
  fizzbuzzLength    equ $ - fizzbuzz

  newline           db '',0xa
  newlineLength     equ $ - newline

  largestMagnitude  equ 10000
  minusSign         db '-'
;; ************************************************





;; Statically allocated variables
;; ************************************************
section .bss
  index resb 1
  lMag  resb 1
  num   resb 1
  first resb 1
  char  resb 1
;; ************************************************