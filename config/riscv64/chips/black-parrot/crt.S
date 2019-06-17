# See LICENSE for license details.

#include "encoding.h"

#if __riscv_xlen == 64
# define LREG ld
# define SREG sd
# define REGBYTES 8
#else
# define LREG lw
# define SREG sw
# define REGBYTES 4
#endif

  .section ".text.init"
  .globl _start
_start:

  # give each core 128KB of stack
  auipc sp, 0x20
  
  # get core id
  csrr a0, mhartid

  # jump to benchmark
  j _init
