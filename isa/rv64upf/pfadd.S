# Test fadd.S for Posit Enhanced Rocket Chip

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  TEST_PA_OP2_S( 2, fadd.s, 0, 1254935757, 1140850688, 1100585370); #2.7 = 1.5 + 1.2

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END


