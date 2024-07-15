section .data
codes:
  db        '0123456789ABCDEF'

section .text
global _start
_start:
  ; numero 1122... em formato hexadecimal
  mov rax, 0x1122334455667788

  mov rdi,  1
  mov rdx,  1
  mov rcx,  64
  ; Cada 4 bits devem ser exibidos como um digito hexdecimal
  ; Use o deslocamento (shift) e a operacao bit a bit AND para isola-las
  ; O resultado eh ©o affset no array 'codes'
.loop:
  push rax
  sub rcx, 4
  ; cl eh um registrador, a parte menor de rcx
  ; rax -- eax -- ax -- ah + al
  ; rcx -- ecx -- cx -- ch + cl
  sar rax, cl
  and rax, 0xf

  lea rsi, [codes + rax]
  mov rax, 1

  ; syscall deixa rcx e r11 alterados
  push rcx
  syscall
  pop rcx

  pop rax
  ; test pode ser usado para uma verificacao mais rapida do tipo 'eh um zero?'
  test rcx, rcx
  jnz .loop
  mov rax, 60   ; faz a chamada do sistema, 'exit'
  xor rdi, rdi
  syscall













