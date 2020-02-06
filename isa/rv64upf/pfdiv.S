#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_PA_OP2_S(2,  fdiv.s, 0, 0x413eedfb, 0x4c90fdaa, 0x4adf8545); #1.1557273520668288 = 3.14159265 / 2.71828182
  TEST_PA_OP2_S(3,  fdiv.s, 0, 0xc003a5e3, 0x8b970000, 0x74698ccd); #-0.9991093838555584 = -1234 / 1235.1
  TEST_PA_OP2_S(4,  fdiv.s, 0, 0x4c90fdaa, 0x4c90fdaa, 0x40000000); #3.14159265 = 3.14159265 / 1.0

  TEST_PA_OP1_S(5,  fsqrt.s, 0, 0x462dfc48, 0x4c90fdaa); #1.7724538498928541 = sqrt(3.14159265)
  TEST_PA_OP1_S(6,  fsqrt.s, 0, 0x6a400000, 0x79388000); #100 = sqrt(10000)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
