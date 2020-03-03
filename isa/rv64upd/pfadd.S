# See LICENSE for license details.

#*****************************************************************************
# fadd.S
#-----------------------------------------------------------------------------
#
# Test f{add|sub|mul}.d instructions.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

#if __riscv_xlen == 32
    # Replace the function with the 32-bit variant defined in test_macros.h
    #undef TEST_PA_OP2_D
    #define TEST_PA_OP2_D TEST_PA_OP2_D32
#endif

  TEST_PA_OP2_D( 2,  fadd.d, 0, 0x4700000000000000, 0x4500000000000000, 0x4000000000000000); 
  TEST_PA_OP2_D( 3,  fadd.d, 0, 0x9B9700000000000D, 0x9B96733333333340, 0x4066666666666680);
  TEST_PA_OP2_D( 4,  fadd.d, 0, 0x46487ED5481B77C9, 0x46487ED4F2353C40, 0x06ABCC77118461D0);

  TEST_PA_OP2_D( 5,  fsub.d, 0, 0x4200000000000000, 0x4500000000000000, 0x4000000000000000);
  TEST_PA_OP2_D( 6,  fsub.d, 0, 0x9B9700000000000D, 0x9B96733333333340, 0xBF99999999999980);
  TEST_PA_OP2_D( 7,  fsub.d, 0, 0x46487ED49C4F00B7, 0x46487ED4F2353C40, 0x06ABCC77118461D0);

  TEST_PA_OP2_D( 8,  fmul.d, 0, 0x4500000000000000, 0x4500000000000000, 0x4000000000000000);
  TEST_PA_OP2_D( 9,  fmul.d, 0, 0x64A74E147AE147AF, 0x9B96733333333340, 0xBF99999999999980);
  TEST_PA_OP2_D(10,  fmul.d, 0, 0x0786EE2D2E0FF84C, 0x46487ED4F2353C40, 0x06ABCC77118461D0);

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
