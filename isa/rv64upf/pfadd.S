# Test fadd.S for Posit Enhanced Rocket Chip

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  TEST_PA_OP2_S( 2, fadd.s, 0, 0x4acccccd, 0x44000000, 0x4199999a); #2.7 = 1.5 + 1.2
  TEST_PA_OP2_S( 3, fadd.s, 0, 0x8b970000, 0x8b967333, 0x40cccccd); #-1234 = -1235.1 + 1.1
  TEST_PA_OP2_S( 4, fadd.s, 0, 0x4c90fdaa, 0x4c90fdaa, 0x00aaf31e); #3.14159265 = 3.14159265 + 0.00000001

  TEST_PA_OP2_S( 5, fsub.s, 0, 0x44000000, 0x4a000000, 0x40000000); #1.5 = 2.5 - 1.0
  TEST_PA_OP2_S( 6, fsub.s, 0, 0x8b970000, 0x8b967333, 0xbf333333); #-1234 = -1235.1 - -1.1
  TEST_PA_OP2_S( 7, fsub.s, 0, 0x4c90fda9, 0x4c90fdaa, 0x00aaf31e); #3.14159264 = 3.14159265 - 0.00000001

  TEST_PA_OP2_S( 8, fmul.s, 0, 0x4a000000, 0x4a000000, 0x40000000); #2.5 = 2.5 * 1.0
  TEST_PA_OP2_S( 9, fmul.s, 0, 0x74a74e14, 0x8b967333, 0xbf333333); #1358.61 = -1235.1 - -1.1
  TEST_PA_OP2_S(10, fmul.s, 0, 0x00e1bb8b, 0x4c90fdaa, 0x00aaf31e); #3.14159265e-8 = 3.14159265 * 0.00000001

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END


