/*
 * ErdOS Operating System
 * erdos/libc/io.cpp
 * 
 * 17/08/2013 @ 02:40 AM
 * Copyright (C) 2013 Gabriel Marinho <gabrielbiga@me.com>
 */

/*
 * Desenvolvimento de funcoes de Entrada/Saida (Apenas saida foi desenvolvida, por enquanto).
 */

#include "io.hpp"

//Define o endereco do buffer
#define BUFFER 0xb8000

/*
 * std::escrever
 * Escreve uma string (array de caracteres) na tela.
 * 
 * @author Gabriel Marinho <gabrielbiga@me.com>
 */
void std::escrever(char* mensagem, int cor)
{
  char* mem = (BUFFER);
  while(*mensagem != 0)
  {
    *mem = *mensagem;
    mem++;
    mensagem++;
    *mem = (char*) cor;
    mem++;
  }
}

/*
 * std::limpar_tela
 * Limpa a tela.
 * 
 * @author Gabriel Marinho <gabrielbiga@me.com>
 */
void std::limpar_tela(void) 
{
  char* mem = (char*)(BUFFER);
  while(*mem != 0)
  {
    *mem = 0;
    mem++;
  }
}
