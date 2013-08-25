; 
; ErdOS Operating System
; erdos/start.asm
;
; 15/08/2013 @ 01:56 AM
; Copyright (C) 2013 Gabriel Marinho <gabrielbiga@me.com>
;

;
; Ponto de partida do kernel e pilha.
; Tome cautela ao usar este lançador. Use por sua conta e risco.
;

[BITS 32]

global start

start:
    mov esp, _pilha_do_sistema    ; Seleciona nova area na pilha do sistema
    jmp subir_kernel		  ; Pula para o bloco onde e efetuada a chamada do kernel (main.cpp)

ALIGN 4 ; Obrigatoriamente esta parte deve estar alinhada a 4 bytes

;
; O bloco multiboot e responsavel por expor informacoes importantes para o linker
;
multiboot:
    ; Macros para o GRUB
    MULTIBOOT_PAGE_ALIGN	equ 1<<0
    MULTIBOOT_MEMORY_INFO	equ 1<<1
    MULTIBOOT_AOUT_KLUDGE	equ 1<<16
    MULTIBOOT_HEADER_MAGIC	equ 0x1BADB002
    MULTIBOOT_HEADER_FLAGS	equ MULTIBOOT_PAGE_ALIGN | MULTIBOOT_MEMORY_INFO | MULTIBOOT_AOUT_KLUDGE
    MULTIBOOT_CHECKSUM	equ -(MULTIBOOT_HEADER_MAGIC + MULTIBOOT_HEADER_FLAGS)
    
    EXTERN code, bss, end

    ; Expondo os cabecalhos Multiboot do GRUB, a assinatura do boot
    ; Caso queira ter mais informacoes vide: http://www.gnu.org/software/grub/manual/multiboot/multiboot.html
    dd MULTIBOOT_HEADER_MAGIC
    dd MULTIBOOT_HEADER_FLAGS
    dd MULTIBOOT_CHECKSUM
    
    ; Expondo enderecos fisicos para o linker (link.ld)
    dd multiboot
    dd code
    dd bss
    dd end
    dd start

;
; O bloco subir_kernel e um loop infinito e tem a funcao de chamar
; a funcao main() do nosso main.cpp
;
subir_kernel:
    extern main
    call main
    jmp $

;
; A section BSS tem a funcao de alocar o tamanho de nossa pilha
;
SECTION .bss
    resb 8192               ; Reserva e apenas reserva 8KB de memoria para a pilha
_pilha_do_sistema:
