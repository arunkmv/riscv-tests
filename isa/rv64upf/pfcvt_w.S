#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  TEST_PA_INT_OP_S( 2,  fcvt.w.s, 0x00,         -1, 0xbf333333); #-1.1 
  TEST_PA_INT_OP_S( 3,  fcvt.w.s, 0x00,         -1, 0xc0000000); #-1.0
  TEST_PA_INT_OP_S( 4,  fcvt.w.s, 0x00,          0, 0xc199999a); #-0.9
  TEST_PA_INT_OP_S( 5,  fcvt.w.s, 0x00,          0, 0x3e666666); # 0.9
  TEST_PA_INT_OP_S( 6,  fcvt.w.s, 0x00,          1, 0x40000000); # 1.0
  TEST_PA_INT_OP_S( 7,  fcvt.w.s, 0x00,          1, 0x40cccccd); # 1.1
  TEST_PA_INT_OP_S( 8,  fcvt.w.s, 0x00,     -1<<31, 0x8049a5f4); #-3e9
  TEST_PA_INT_OP_S( 9,  fcvt.w.s, 0x00,  (1<<31)-1, 0x7fb65a0c); # 3e9

  TEST_PA_INT_OP_S(12, fcvt.wu.s, 0x00,          0, 0xb4000000); #-3.0
  TEST_PA_INT_OP_S(13, fcvt.wu.s, 0x00,          0, 0xc0000000); #-1.0
  TEST_PA_INT_OP_S(14, fcvt.wu.s, 0x00,          0, 0xc199999a); #-0.9
  TEST_PA_INT_OP_S(15, fcvt.wu.s, 0x00,          0, 0x3e666666); # 0.9
  TEST_PA_INT_OP_S(16, fcvt.wu.s, 0x00,          1, 0x40000000); # 1.0
  TEST_PA_INT_OP_S(17, fcvt.wu.s, 0x00,          1, 0x40cccccd); # 1.1
  TEST_PA_INT_OP_S(18, fcvt.wu.s, 0x00,          0, 0x8049a5f4); #-3e9
  TEST_PA_INT_OP_S(19, fcvt.wu.s, 0x00, 3000000512, 0x7fb65a0c); # 3e9

#if __riscv_xlen >= 64
  TEST_PA_INT_OP_S(22,  fcvt.l.s, 0x00,         -1, 0xbf333333); #-1.1
  TEST_PA_INT_OP_S(23,  fcvt.l.s, 0x00,         -1, 0xc0000000); #-1.0
  TEST_PA_INT_OP_S(24,  fcvt.l.s, 0x00,          0, 0xc199999a); #-0.9
  TEST_PA_INT_OP_S(25,  fcvt.l.s, 0x00,          0, 0x3e666666); # 0.9
  TEST_PA_INT_OP_S(26,  fcvt.l.s, 0x00,          1, 0x40000000); # 1.0
  TEST_PA_INT_OP_S(27,  fcvt.l.s, 0x00,          1, 0x40cccccd); # 1.1

  TEST_PA_INT_OP_S(32, fcvt.lu.s, 0x00,          0, 0xb4000000); #-1.0
  TEST_PA_INT_OP_S(33, fcvt.lu.s, 0x00,          0, 0xc0000000); #-1.0
  TEST_PA_INT_OP_S(34, fcvt.lu.s, 0x00,          0, 0xc199999a); #-0.9
  TEST_PA_INT_OP_S(35, fcvt.lu.s, 0x00,          0, 0x3e666666); # 0.9
  TEST_PA_INT_OP_S(36, fcvt.lu.s, 0x00,          1, 0x40000000); # 1.0
  TEST_PA_INT_OP_S(37, fcvt.lu.s, 0x00,          1, 0x40cccccd); # 1.1
  TEST_PA_INT_OP_S(38, fcvt.lu.s, 0x00,          0, 0x8049a5f4); #-3e9
#endif

 #test NaR
  TEST_CASE( 42, x1, 0x000000007fffffff, la x1, tdat  ; flw f1,  0(x1); fcvt.w.s  x1, f1);
  TEST_CASE( 43, x1, 0xffffffffffffffff, la x1, tdat  ; flw f1,  0(x1); fcvt.wu.s x1, f1);
#if __riscv_xlen >= 64
  TEST_CASE( 44, x1, 0x7fffffffffffffff, la x1, tdat  ; flw f1,  0(x1); fcvt.l.s  x1, f1);
  TEST_CASE( 45, x1, 0xffffffffffffffff, la x1, tdat  ; flw f1,  0(x1); fcvt.lu.s x1, f1);
#endif

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

tdat:
.word 0x80000000

RVTEST_DATA_END

