; Using the "Intel" assembly syntax

; `xcrun --show-sdk-path`/usr/include/sys/syscall.h
; https://stackoverflow.com/a/48845698
;   - 0x2000000 needs to be added to the syscall from the above file for some reason
sys_write equ 0x2000004
sys_exit  equ 0x2000001

STDIN  equ 0
STDOUT equ 1
STDERR equ 2

%macro exit 1
  mov rax, sys_exit
  mov rdi, %1             ; exit status
  syscall
%endmacro

global _main

section .text

_main:
  mov rax, msg
  call print

  exit 0

print:
  push rax              ; rax will contain the pointer to the string
  mov rbx, 0            ; initialize rbx for counting the length to 0
count_chars:
  inc rax               ; point to the next character
  inc rbx               ; count increment
  mov cl, [rax]         ; put the value of rax into cl
  cmp cl, 0             ; compare the char to 0 (0 terminates the string)
  jne count_chars       ; continue counting if the value is not 0
  mov rax, sys_write    ; start the syscall for writing to stdout
  mov rdi, STDOUT
  pop rsi               ; pop the rax pointer to the string that was stored off the stack into rsi for the write syscall arg
  mov rdx, rbx          ; move the rbx counter into the rdx register for the length arg of syswrite
  syscall
  ret

section .data

msg:    db      "Hello, world!", 10 ; 10 is a newline
