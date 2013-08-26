ErdOS
=====

ErdOS (em homenagem ao matemático Paul Erdős) é um sistema operacional livre de código fonte aberto, objetivando inteiramente o estudo e pesquisa sobre o assunto.

O motivo do desenvolvimento deste simples sistema operacional "hello world" para aprendizagem, é justamente a dificuldade de encontrar material em português e acima de tudo de técnicas que realmente funcionem. O objetivo nada mais é do que a evolução do projeto e divulgação detalhada de cada técnica utilizada para sua melhoria.

O sistema operacional ErdOS foi escrito em C++ e Netwide Assembly. O mesmo é completamente licenciado sob licença GPL v2. Fique à vontade para distribuir, modificar seu código fonte, contribuir com melhorias e realmente estudar.

---

Por que C++? Não é melhor C para o trabalho?

O sistema operacional ErdOS é um sistema inteiramente para estudo, não focando performance. A escolha de C++ foi devida a flexibilidade de trabalho com paradigmas atuais, como orientação a objetos, utlização de namespaces e etc. Estas técnicas podem ser utilizadas livremente dentro do Kernel de ErdOS, reforçando mais ainda seu estudo.

---

Compilando o sistema:

- ** Nota: Não é recomendado o teste de Kernels 'caseiros' em hardwares reais/físicos, pois não é prevista a reação disto. O simples teste pode acabar DANIFICANDO seu equipamento. Caso queira testar, faça por sua conta e risco. O uso de máquinas virtuais não oferece NENHUM risco de dano a sua máquina física. **

Para compilar o ErdOS é incrívelmente simples! O sistema já conta com uma imagem pronta do GRUB 0.5.96 que ja é automáticamente modificada quando seu kernel é linkado corretamente pelo script Makefile.


Você irá precisar ter um sistema Linux instalado na sua máquina. ALGUMAS pessoas tem problemas ao compilar o ErdOS em sistemas operacionais x86_64, então é recomendado que você use um sistema operacional apenas 32 bits para a tarefa. O sistema operacional ErdOS, em todos os casos de teste foi compilado sob a distribuição Slackware 14 32 bits.
Além disso, você irá precisar das seguintes ferramentas instaladas para conseguir construir o ErdOS.

- Nasm (Netwide Assembler)
- G++(GNU C++ Compiler)
- LD (GNU Linker)
- Make (GNU Make)
- QEMU (Virtual Machine)
- GIT (Caso queira fazer clone)

Com isso pronto, vamos a compilação...
Você pode baixar o ZIP e descompactar ou simplesmente fazer o clone do repo em seu HD.

$ git clone git@github.com:gabrielbiga/ErdOS.git

Depois de concluído, basta entrar como root e construir o sistema ErdOS

$ su

 # make

ou

$ sudo make

Ao termino, se todo ocorrer bem, será gerado 2 arquivos na pasta bin. O 'erdos.img' e o kernel.bin.

erdos.img é nada mais do que uma imagem de disquete com seu kernel recentemente gerado atrelado ao GRUB. Você pode gravar a um disquete físico ou testar com o QEMU

 # qemu-system-i386 -fda erdos.img

e kernel.bin é seu Kernel compilado. Para testar o Kernel sem precisar usar um bootloader é completamente possível utilizando:

 # qemu-system-i386 -kernel kernel.bin

Testar o Kernel fora do bootloader é recomendado quando estiver sendo feita modificações, pois tem um carregamento mais simples e mais rápido.
