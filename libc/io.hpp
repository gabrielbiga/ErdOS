/*
 * ErdOS Operating System
 * erdos/libc/io.hpp
 * 
 * 17/08/2013 @ 02:40 AM
 * Copyright (C) 2013 Gabriel Marinho <gabrielbiga@me.com>
 */

/*
 * Definicao do namespace 'std' e prototipacao de funcoes de E/S (Apenas saida foi desenvolvida)
 */

#ifndef IO_HPP
#define IO_HPP

namespace std {
  void escrever(char*, int);
  void limpar_tela(void);
}

#endif
