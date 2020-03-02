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
    # Bypass the tests as using the 32 bit varient is currently not possible
    #undef TEST_PA_OP2_D
    #define TEST_PA_OP2_D TEST_PASS_ALWAYS
#endif

  TEST_PA_OP2_D( 2,  fadd.d, 0, 0x4700000000000000, 0x4500000000000000, 0x4000000000000000);

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
