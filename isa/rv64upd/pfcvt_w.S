#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  TEST_PA_INT_OP_D( 2,  fcvt.w.d, 0x00,         -1, 0xBF99999999999980); #-1.1 
  TEST_PA_INT_OP_D( 3,  fcvt.w.d, 0x00,         -1, 0xc000000000000000); #-1.0
  TEST_PA_INT_OP_D( 4,  fcvt.w.d, 0x00,          0, 0xC0CCCCCCCCCCCCC0); #-0.9
  TEST_PA_INT_OP_D( 5,  fcvt.w.d, 0x00,          0, 0x3F33333333333340); # 0.9
  TEST_PA_INT_OP_D( 6,  fcvt.w.d, 0x00,          1, 0x4000000000000000); # 1.0
  TEST_PA_INT_OP_D( 7,  fcvt.w.d, 0x00,          1, 0x4066666666666680); # 1.1
  TEST_PA_INT_OP_D( 8,  fcvt.w.d, 0x00,     -1<<31, 0x844D2FA200000000); #-3e9
  TEST_PA_INT_OP_D( 9,  fcvt.w.d, 0x00,  (1<<31)-1, 0x7BB2D05E00000000); # 3e9

  TEST_PA_INT_OP_D(12, fcvt.wu.d, 0x00,          0, 0xBA00000000000000); #-3.0
  TEST_PA_INT_OP_D(13, fcvt.wu.d, 0x00,          0, 0xc000000000000000); #-1.0
  TEST_PA_INT_OP_D(14, fcvt.wu.d, 0x00,          0, 0xC0CCCCCCCCCCCCC0); #-0.9
  TEST_PA_INT_OP_D(15, fcvt.wu.d, 0x00,          0, 0x3F33333333333340); # 0.9
  TEST_PA_INT_OP_D(16, fcvt.wu.d, 0x00,          1, 0x4000000000000000); # 1.0
  TEST_PA_INT_OP_D(17, fcvt.wu.d, 0x00,          1, 0x4066666666666680); # 1.1
  TEST_PA_INT_OP_D(18, fcvt.wu.d, 0x00,          0, 0x844D2FA200000000); #-3e9
  TEST_PA_INT_OP_D(19, fcvt.wu.d, 0x00, 0xffffffffb2d05e00, 0x7BB2D05E00000000); # 3e9

#if __riscv_xlen >= 64
  TEST_PA_INT_OP_D(22,  fcvt.l.d, 0x00,         -1, 0xBF99999999999980);#-1.1
  TEST_PA_INT_OP_D(23,  fcvt.l.d, 0x00,         -1, 0xc000000000000000);#-1.0
  TEST_PA_INT_OP_D(24,  fcvt.l.d, 0x00,          0, 0xC0CCCCCCCCCCCCC0);#-0.9
  TEST_PA_INT_OP_D(25,  fcvt.l.d, 0x00,          0, 0x3F33333333333340);# 0.9
  TEST_PA_INT_OP_D(26,  fcvt.l.d, 0x00,          1, 0x4000000000000000);# 1.0
  TEST_PA_INT_OP_D(27,  fcvt.l.d, 0x00,          1, 0x4066666666666680);# 1.1
  TEST_PA_INT_OP_D(28,  fcvt.l.d, 0x00,-3000000000, 0x844D2FA200000000);#-3e9
  TEST_PA_INT_OP_D(29,  fcvt.l.d, 0x00, 3000000000, 0x7BB2D05E00000000);# 3e9
  TEST_PA_INT_OP_D(20,  fcvt.l.d, 0x00,     -1<<63, 0x803D7EAA5BC98920);#-3e19
  TEST_PA_INT_OP_D(21,  fcvt.l.d, 0x00,  (1<<63)-1, 0x7FC28155A43676E0);#3e19

  TEST_PA_INT_OP_D(32, fcvt.lu.d, 0x00,          0, 0xBA00000000000000);#-3.0
  TEST_PA_INT_OP_D(33, fcvt.lu.d, 0x00,          0, 0xc000000000000000);#-1.0
  TEST_PA_INT_OP_D(34, fcvt.lu.d, 0x00,          0, 0xC0CCCCCCCCCCCCC0);#-0.9
  TEST_PA_INT_OP_D(35, fcvt.lu.d, 0x00,          0, 0x3F33333333333340);# 0.9
  TEST_PA_INT_OP_D(36, fcvt.lu.d, 0x00,          1, 0x4000000000000000);# 1.0
  TEST_PA_INT_OP_D(37, fcvt.lu.d, 0x00,          1, 0x4066666666666680);# 1.1
  TEST_PA_INT_OP_D(38, fcvt.lu.d, 0x00,          0, 0x844D2FA200000000);#-3e9
  TEST_PA_INT_OP_D(39, fcvt.lu.d, 0x00, 3000000000, 0x7BB2D05E00000000);# 3e9
#endif

 #test NaR
  TEST_CASE( 42, x1, 0x000000007fffffff, la x1, tdat; fld f1,  0(x1); fcvt.w.d  x1, f1);
  TEST_CASE( 43, x1, 0xffffffffffffffff, la x1, tdat; fld f1,  0(x1); fcvt.wu.d x1, f1);
#if __riscv_xlen >= 64
  TEST_CASE( 44, x1, 0x7fffffffffffffff, la x1, tdat; fld f1,  0(x1); fcvt.l.d  x1, f1);
  TEST_CASE( 45, x1, 0xffffffffffffffff, la x1, tdat; fld f1,  0(x1); fcvt.lu.d x1, f1);
#endif

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

tdat:
.dword 0x8000000000000000

RVTEST_DATA_END

