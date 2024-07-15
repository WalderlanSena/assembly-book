global _start

section .data
message: db 'hello, world!', 10

section .text
_start:
  mov   rax,  1       ; o numero da chamada de sistema deve sser armazenado em rax
  mov   rdi,  1       ; argumento #1 em rdi: onde escrever (descritor)?
  mov   rsi,  message ; argumento #2 em rsi: onde comeca a string?
  mov   rdx,  14      ; argumento #3 em rdx: quantos bytes devem ser escritos?
  syscall             ; essa instrucao faz uma chamada de sistema

  mov   rax,  60      ; numero da syscall 'exit'
  xor   rdi, rdi
  syscall

