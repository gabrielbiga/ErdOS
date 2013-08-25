/*
 * ErdOS Operating System
 * erdos/main.cpp
 * 
 * 17/08/2013 @ 05:10 AM
 * Copyright (C) 2013 Gabriel Marinho <gabrielbiga@me.com>
 */

#include "libc/io.hpp"

using namespace std;

int main() {
  //Limpa nossa tela
  limpar_tela();
  //Escreve uma string na tela, no segundo parametro e colocada
  //a cor desejada, onde 0x??. O primeiro ? representa a cor de fundo
  //e o segundo ? representa a cor da fonte. 0 para preto.
  escrever("Bem vindo ao ErdOS", 0x02);
  
  //Loop infinito para o SO nunca parar
  for(;;);
}
