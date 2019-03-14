#!/bin/sh

nasm -f elf64 asm_fizzbuzz.asm
ld -s -o asm_fuzzbuzz asm_fizzbuzz.o
./asm_fizzbuzz