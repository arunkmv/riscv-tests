#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  TEST_INT_PA_OP_S( 2,  fcvt.s.w,            0x48000000,  2); # 2.0
  TEST_INT_PA_OP_S( 3,  fcvt.s.w,            0xb8000000, -2); #-2.0

  TEST_INT_PA_OP_S( 4, fcvt.s.wu,            0x48000000,  2); #2.0
  TEST_INT_PA_OP_S( 5, fcvt.s.wu,            0x7fbfffff, -2); #4.2949673e9

#if __riscv_xlen >= 64
  TEST_INT_PA_OP_S( 6,  fcvt.s.l,            0x48000000,  2); # 2.0
  TEST_INT_PA_OP_S( 7,  fcvt.s.l,            0xb8000000, -2); #-2.0

  TEST_INT_PA_OP_S( 8, fcvt.s.lu,            0x48000000,  2); #2.0
  TEST_INT_PA_OP_S( 9, fcvt.s.lu,            0x7fffbfff, -2); #1.8446744e19
#endif

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END